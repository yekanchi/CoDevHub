function global:Assert-DicrectoryExists {
    param(
        [string] 
        [Alias("P")]
        $Path = $false)

    if (Test-Path2 -Path $Path) {
        return $true;
    }
    else {
        New-Item -Path $Path -ItemType "directory";
        return $false;
    }
}



