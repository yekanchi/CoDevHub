function global:Start-Gitea {
    param([switch] [Alias("D")] $DebugMode)

    $Command = @"
    Set-Location $env:GITEA_WORK_DIR
    & $env:CHUB_SRVCS\gitea\gitea.exe web --port $env:HTTPPORT_GITEA;
"@;
    if ($DebugMode) {
        Start-CodeHubHttpService -Name "Gitea" -Port $env:HTTPPORT_GITEA -Command $Command -DebugMode
    }
    else {
        Start-CodeHubHttpService -Name "Gitea" -Port $env:HTTPPORT_GITEA -Command $Command
    }
}
