function global:Stop-SyncPackages { 
    Stop-CodeHubHttpService -P $env:HTTPPORT_SYNCPACKAGES -N 'SyncPackages'
}