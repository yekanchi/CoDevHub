function Global:Get-PathOwner {
	param(
        [string] 
        [Alias("P")]
        $Path = '')
	
	return ((Get-Acl $Path).Owner -split "\\")[1]
}