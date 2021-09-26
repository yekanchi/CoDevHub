function global:Start-Mysql {
    param([switch] [Alias("D")] $DebugMode)
 
    $Command = @"
    Set-Location $env:CHUB_SRVCS\mysql\bin;
    mysqld.exe;
"@;
    # nuget locals all -clear;
    if ($DebugMode) {
        Start-CodeHubHttpService -Name "Mysql" -Port $env:HTTPPORT_MYSQL -Command $Command -DebugMode
    }
    else {
        Start-CodeHubHttpService -Name "Mysql" -Port $env:HTTPPORT_MYSQL -Command $Command
    }
}