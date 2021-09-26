$global:RequiredModules = @(
	"PSWriteColor",
	"posh-git",
	"oh-my-posh",
	"IISAdministration",
	"PowerShellGet",
	"ComputerManagementDsc",
	"NetworkingDsc",
	"WindowsDefender",
	"SqlServer",
	"powershell-yaml",
	"PSLogging",
	"xNetworking",
	"TaskRunner",
	"CredentialManager",
	"ImportExcel",
	"PSReadLine",
	"WallpaperManager",
	"newtonsoft.json",
	"PoshRSJob",
	"WinSCP",
	"SharePointDSC",
	"cChoco",
	"FileContentDsc",
	"Terminal-Icons",
	"ModuleBuilder",
	"PSReadLine",
	"BurntToast",
	"ImportExcel",
	# "Pansies",
	# "PowerLine",
	"PSWriteHTML",
	"dbatools",
	"Microsoft.PowerShell.SecretManagement",
	"NTFSSecurity",
	"Posh-SSH",
	"Graphical",
	"PSGraph",
	# "ActiveDirectory",
	# "GroupPolicy",
	"PSWinDocumentation",
	"PSWritePDF",
	"ImportExcel",
	"PSWriteWord",
	"platyPS",
	"PScribo",
	# "Pscx",
	"psframework",
	"PoShLog",
	"Plaster",
	"PSModuleDevelopment",
	"Catesta",
	"PowerShellGet",
	"SPReplicator",
	"PoshColor",
	"AnyBox",
	"InvokeBuild",
	"Microsoft.PowerShell.GraphicalTools",
	"Microsoft.PowerShell.ConsoleGuiTools",
	"PS-Menu",
	"psInlineProgress",
	"pode",
	"posh-git",
	"Polaris",
	"PSScriptTools")

$global:EssentialModules = @(
	"PSWriteColor",
	"oh-my-posh",
	"Terminal-Icons")


function global:Save-CodeHubModules {
	foreach ($moduleName in $EssentialModules) {

		try {
			Save-Package -Name $moduleName -Source https://www.powershellgallery.com/api/v2 -Path $env:CHUB_MODLS;
		}
		catch {
			Write-Error $Error;
		}
	}
}


function global:Register-CodeHubPsGallery {
	# Check If Gallery Exists? If Not Register It
	if ((-Not (Get-PSRepository | Where-Object { $_.Name -eq $env:PSRepoName })) -Or ((Get-PSRepository -Name CodeHubPSRepo).SourceLocation -eq $env:PSRepoPath )) {
		UnRegister-PSRepository -Name $env:PSRepoName;
		Register-PSRepository -Name $env:PSRepoName  -SourceLocation $env:PSRepoPath -ScriptSourceLocation $env:PSRepoPath -InstallationPolicy Trusted;
		Write-Host "Registered" $env:PSRepoName ;
	}
}

function Get-CodeHubPsModules {
	foreach ($moduleName in $RequiredModules) {
		Uninstall-Module $moduleName; {
			try {
				Save-Package -Name $moduleName -Provider NuGet -Source https://www.powershellgallery.com/api/v2 -Path $env:PSRepoPath;
			}
			catch {
				Write-Error $Error;
			}
		}
	}
}

function Global:Register-Modules() {
	Write-Host "Setting Modules...";

	Get-CodeHubPsModules;
	# Iterate Over Modules And Install Them
	foreach ($moduleName in $RequiredModules) {
		Uninstall-Module $moduleName;
		if (-Not (Find-Package -Source $env:PSRepoName | Where-Object { $_.Name -eq $moduleName })) {
			try {
				Save-Package -Name $moduleName -Provider NuGet -Source https://www.powershellgallery.com/api/v2 -Path $env:PSRepoPath;
			}
			catch {
				Write-Error $Error;
			}
		}

		if (-Not (Get-Module -ListAvailable -Name $moduleName)) {
			Write-Host "Installing Module" $moduleName "From Repository:" $env:PSRepoName;
			if (Find-Module  -Name $moduleName -Repository $env:PSRepoName -ErrorAction SilentlyContinue) {			
				Write-Host $env:PSRepoName;
				Install-Module -Name $moduleName -Repository $env:PSRepoName -AllowClobber;
			}
			else {
				Write-Host "Module:" $moduleName "Not Found At Repository:" $env:PSRepoName;
				Write-Host "Saving Module:" $moduleName "From Repository PSGallery";
				Save-Package -Name $moduleName -Provider NuGet -Source https://www.powershellgallery.com/api/v2 -Path $env:PSRepoPath;
				Install-Module -Name $moduleName -Repository $env:PSRepoName -SkipPublisherCheck;
			}
		}
	}

	if ( -Not (Get-PackageSource | Where-Object { $_.Name -eq 'BaGet' })) {
		$HTTP_Request = [System.Net.WebRequest]::Create($env:BAGET_URL);
		try {
			$HTTP_Response = $HTTP_Request.GetResponse();
			$HTTP_Status = [int]$HTTP_Response.StatusCode
			If ($HTTP_Status -eq 200) {
				Register-PackageSource -Name BaGet -Location $env:BAGET_URL -ProviderName NuGet
				Write-Host "Registered baget at" $env:BAGET_URL ;
			}
			Else {
				Write-Host "Baget Is Down!!!"
			}
		}
		catch [Net.WebException] {
			Write-Host "Baget is Down."
		}
	}

	Write-Host "Modules Are Set.";
}