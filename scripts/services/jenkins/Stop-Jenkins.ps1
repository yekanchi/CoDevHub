function global:Stop-Jenkins { 
    Stop-CodeHubHttpService -P $env:HTTPPORT_JENKINS -N 'Jenkins'
}