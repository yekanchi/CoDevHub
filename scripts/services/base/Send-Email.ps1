function global:Send-Email {
    param (
        [Parameter(Mandatory = $true)]  [string] [Alias("T")]  $ToEmailAddress,
        [Parameter(Mandatory = $false)] [string] [Alias("F")]  $FromEmailAddress,
        [Parameter(Mandatory = $false)] [string] [Alias("FP")] $FromEmailAddressPass,
        [Parameter(Mandatory = $false)] [string] [Alias("S")]  $Subject,
        [Parameter(Mandatory = $false)] [string] [Alias("A")]  $AttachmentPath = "",
        [Parameter(Mandatory = $false)] [string] [Alias("B")]  $Body = ""
    )
    
    if (!$FromEmailAddress) {
        $FromEmailAddress       = $CodeHubConfig.DefaultFromEmail;
        $SecurePass             = ConvertTo-SecureString $CodeHubConfig.DefaultFromEmailPass -AsPlainText -Force;
        $EmailCredential        = New-Object System.Management.Automation.PSCredential ($CodeHubConfig.DefaultFromEmail, $SecurePass);
    }
    else {
        $SecurePass             = ConvertTo-SecureString $FromEmailAddressPass -AsPlainText -Force;
        $EmailCredential        = New-Object System.Management.Automation.PSCredential ($FromEmailAddress, $SecurePass);
    }


    # -DeliveryNotificationOption OnSuccess, OnFailure `
    if ($AttachmentPath) {
        Send-MailMessage -From  $FromEmailAddress `
            -Credential $EmailCredential `
            -To $ToEmailAddress `
            -Subject $Subject `
            -Body $Body `
            -Attachments  $AttachmentPath `
            -Priority High `
            -SmtpServer $CodeHubConfig.SmtpMailServcer `
            -BodyAsHtml `
            -WarningAction Ignore
    }
    else {
        Send-MailMessage -From $FromEmailAddress `
            -Credential $EmailCredential `
            -To $ToEmailAddress `
            -Subject $Subject `
            -Body $Body `
            -Priority High `
            -SmtpServer $CodeHubConfig.SmtpMailServcer `
            -BodyAsHtml `
            -WarningAction Ignore
    }
}