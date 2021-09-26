function global:Stop-Jira { 
    Stop-CodeHubHttpService -P $env:HTTPPORT_JIRA -N 'Jira'
}


