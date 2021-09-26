function global:Remove-ItemForced {
    param(
        [string] 
        [Alias("P")]
        $Path = $false,
        
        [switch] 
        [Alias("V")]
        $Verbose )

    Get-ChildItem -Path "$Path\" -Directory -Filter "*" | Remove-Item -Recurse -Force -Confirm:$false
    Remove-Item -Path $Path -Recurse -Force -Confirm:$false
    if ($Verbose) {
        Write-Host "Deleted: $Path"
    }
}