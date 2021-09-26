function global:Stop-Mysql { 
    Stop-CodeHubHttpService -P $env:HTTPPORT_MYSQL -N 'Mysql'
}