Get-ChildItem  "$psscriptroot/../basic" -Recurse -Include *.ps1 | ForEach-Object {
    Invoke-Expression $_.FullName
}

$Success = "✅";
Write-Host  "VARS" -NoNewLine -B Cyan -F Black
Invoke-Expression (Resolve-Dir "$env:CHUB_HOME/scripts/commons/Set-Envs.ps1");
Write-Host  "$Success" -NoNewLine -F DarkGreen -B Cyan
Write-Host  "SCRPT" -NoNewLine -B Cyan -F Black
Invoke-Expression (Resolve-Dir "$env:CHUB_SCPTS/commons/Load-Scripts.ps1");
Write-Host  "$Success" -NoNewLine -F DarkGreen -B Cyan
Write-Host  "ALIAS" -NoNewLine -B Cyan -F Black
Invoke-Expression (Resolve-Dir "$env:CHUB_SCPTS/commons/Set-Aliases.ps1");
Write-Host  "$Success" -NoNewLine -F DarkGreen -B Cyan

Invoke-Expression (Resolve-Dir "$env:CHUB_SCPTS/commons/Register-Modules.ps1");
#Set-Up Terminal-Modules
Import-Module (Resolve-Dir "$env:CHUB_MODLS\Terminal-Icons");
Import-Module (Resolve-Dir "$env:CHUB_MODLS\oh-my-posh");
Import-Module (Resolve-Dir "$env:CHUB_MODLS\PSWriteColor");

Set-SshAgent
#Set Paradox Theme for oh-my-posh
Set-PoshPrompt -Theme codehub;


if ($IsLinux) {
    Set-Alias -Name "ls" -Value dir;
    Write-Host  " Linux Are Set. " -BackgroundColor DarkGreen
    Set-Alias -Name "ls" -Value dir;
}

