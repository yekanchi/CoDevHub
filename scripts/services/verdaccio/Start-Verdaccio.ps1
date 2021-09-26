function global:Start-Verdaccio {
    param([switch] [Alias("D")] $DebugMode)

    $verdaccioRepoPath = Resolve-Dir "$env:CHUB_HOME\repos\verdaccio";
    $Command = @"
    Set-Location $verdaccioRepoPath;
    & $verdaccio -c $VerdaccioConfigFile; 
"@;
    # npm cache clean --force
    if ($DebugMode) {
        Start-CodeHubHttpService -Name "Verdaccio" -Port $env:HTTPPORT_VERDACCIO -Command $Command -DebugMode
    }
    else {
        Start-CodeHubHttpService -Name "Verdaccio" -Port $env:HTTPPORT_VERDACCIO -Command $Command
    }
}