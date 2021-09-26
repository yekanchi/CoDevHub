function global:Stop-SmtpDev {
    Stop-CodeHubHttpService -Name "SmtpDev" -Port $env:HTTPPORT_SMTPDEV
}