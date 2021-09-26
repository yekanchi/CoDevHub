function Global:Write-PwshProfile {
    '$defaultprofile  = "$PSScriptRoot/../../scripts/profiles/defaultProfile.ps1";
    & $defaultprofile;' > "$env:CHUB_BIN\pwsh\profile.ps1"
}