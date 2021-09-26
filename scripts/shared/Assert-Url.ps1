function global:Assert-Url {
    param(
        [string] 
        [Alias("A")]
        $Address = "")

    try {
        Invoke-WebRequest $Address | % { if ($_.StatusCode -eq 200) { return $true; } }
    }
    catch {
        return $false;
    }
}