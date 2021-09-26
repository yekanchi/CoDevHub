function Global:Find-HandlesLocking {
    param(
        [string] 
        [Alias("P")]
        $Path = $PWD.ToString())

    $handles = handle;
    Write-Host ("Handles Count: " + $handles.Count);
    Write-Warning "Handles Locking $Path :"
    foreach ($line in $handleOut) { 
        if ($line -match '\S+\spid:') {
            $exe = $line;
            $exe;
        } 
        elseif ($line -like "*$Path*") { 
            "$exe - $line"
        }ls
    }
}