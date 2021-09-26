function global:Get-CurrentUserName {
    return $env:USERNAME;
}


function global:Get-FileOwner {
    param (
        # File Full Path
        [Parameter()]
        [string]
        $Path
    )
    $Null = @(
        $fullUser =  (Get-Acl $Path | Select-Object Owner).Owner.ToString();
        $domainStr = "$env:UserDomain\\";
        $user = $fullUser -replace $domainStr , ""
    )
    
    return $user;
}