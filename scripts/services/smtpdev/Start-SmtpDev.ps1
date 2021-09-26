function global:Start-SmtpDev {
    param([switch] [Alias("D")] $DebugMode)
    
    $SmtpDevBin = Resolve-Dir "$env:CHUB_SRVCS\smtp4dev\Rnwood.Smtp4dev.exe";
    $Command = @"
    & $SmtpDevBin --urls=http://*:$env:HTTPPORT_SMTPDEV;
"@;
    if ($DebugMode) {
        Start-CodeHubHttpService -Name "SmtpDev" -Port $env:HTTPPORT_SMTPDEV -Command $Command -DebugMode
    }
    else {
        Start-CodeHubHttpService -Name "SmtpDev" -Port $env:HTTPPORT_SMTPDEV -Command $Command
    }
}
