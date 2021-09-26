Clear-Host
Write-Host "---------------------------------------" -B Gray -F Black 
Write-Host "--------- Setup Minimal Shell ---------" -B Gray -F Black 
Write-Host "---------------------------------------" -B Gray -F Black 

Set-Location $PSScriptRoot

##### Load Functions #####
& "$PSScriptRoot\types\Load-Types.ps1";
& "$PSScriptRoot\Load-Functions.ps1";
& "$PSScriptRoot\Config\Get-InitConfig.ps1";
& "$PSScriptRoot\Config\Get-CodeHubPackages.ps1";

$env:CHUB_HOME = ([System.IO.DirectoryInfo]"$PSScriptRoot\..\..").FullName;
 
$initConfig = Get-InitConfig -R $env:CHUB_HOME
$initConfig.Packages = Get-CodeHubPackages -CodeHubIntiConfig $initConfig

$initConfig.Packages[0].Sources

# $initConfig
# $initConfig.Packages | Format-Table
#$ArchiveDestin = "$BaseDir\pwsh";



foreach ($package in $initConfig.Packages) {
    $package
}






#$BaseProfileFile = "$InitDir\profiles\base\profile.ps1";
#$BaseProfileContent = Get-Content -Path $BaseProfileFile
#$BaseProfileContent
#$BaseProfileContent | Out-File -FilePath "$BaseDir\pwsh\profile.ps1";

#& $BaseDir\pwsh\profile.ps1
# Extract Base pwsh
#Extract-Archive -source "$ArchiveSource" -destin "$ArchiveDestin"
#Create-Archive -source "$PackDir\powershell\*" -destin "$PackDir\pwsh\pwsh.7z";;




