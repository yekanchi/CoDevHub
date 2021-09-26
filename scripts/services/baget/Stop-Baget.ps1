function global:Stop-Baget { 
    Stop-CodeHubHttpService -P $env:HTTPPORT_BAGET -N 'Baget'
}


