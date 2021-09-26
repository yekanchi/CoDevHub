function global:Stop-Verdaccio { 
    Stop-CodeHubHttpService -P $env:HTTPPORT_VERDACCIO -N 'Verdaccio'
}