function global:Get-UserEmail {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $UserName
    )
    if ($UserName) {
        return "$UserName@$env:UserDomain.com";
    }
    else {
        return "$env:USERNAME@$env:UserDomain.com";
    }
}