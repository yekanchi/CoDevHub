function global:Assert-ItemIsDeleted {
    param(
        [string] 
        [Alias("P")]
        $Path = $false)

    if (Test-Path -Path $Path ) {
        Remove-Item $Path -Force
    }
}