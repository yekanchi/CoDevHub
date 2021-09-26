function global:Assert-DirectoryIsDeleted {
    param(
        [string] 
        [Alias("P")]
        $Path = $false)

    if (Test-Path -Path $Path ) {
        Remove-Item $Path -Recurse -Force
    }
}