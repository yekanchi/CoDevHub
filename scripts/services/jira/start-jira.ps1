function global:Start-Jira {
    param([switch] [Alias("D")] $DebugMode)
    
    $jiraCommand = Resolve-Dir "$env:CHUB_SRVCS\jira\bin\start-jira.bat";
    $Command = @"
    dir $env:JIRA_HOME;
    Set-Location $env:JIRA_BIN_PATH;
    $jiraCommand /fg;
"@;
    if ($DebugMode) {
        Start-CodeHubHttpService -Name "Jira" -Port $env:HTTPPORT_JIRA -Command $Command -DebugMode
    }
    else {
        Start-CodeHubHttpService -Name "Jira" -Port $env:HTTPPORT_JIRA -Command $Command
    }
}
