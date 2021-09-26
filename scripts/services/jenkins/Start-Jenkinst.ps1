function global:Start-Jenkins {
    param([switch] [Alias("D")] $DebugMode)
    
    $jenkinsCommand = Resolve-Dir "$env:CHUB_SRVCS\jenkins\jenkins.war";
    $Command = '$env:Path += ''' + "$env:CHUB_BIN\git\gitscm\usr\bin;" + '''';
    $Command += @"

dir $env:JENKINS_HOME;
$java -jar $jenkinsCommand --httpPort=$env:HTTPPORT_JENKINS;
"@;
    if ($DebugMode) {
        Start-CodeHubHttpService -Name "Jenkins" -Port $env:HTTPPORT_JENKINS -Command $Command -DebugMode
    }
    else {
        Start-CodeHubHttpService -Name "Jenkins" -Port $env:HTTPPORT_JENKINS -Command $Command
    }
}
