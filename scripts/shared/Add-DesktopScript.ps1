function global:Add-DesktopScripts() {
    "$env:CHUB_BIN\pwsh\pwsh.exe -NoLogo -ExecutionPolicy Bypass" > "$env:userprofile\desktop\ch.bat"
    "$env:CHUB_BIN\pwsh\pwsh.exe -NoLogo -ExecutionPolicy Bypass -NoProfile -File $env:CHUB_SCPTS\Console.ps1 -Terminal -BareShell %*" > "$env:userprofile\desktop\wt.bat"
}
