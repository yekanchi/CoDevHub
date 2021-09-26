function global:Clear-Trash {
    param(
        [switch] 
        [Alias("V")]
        $Verbose )

    $src = $env:CHUB_HOME + "\src";
    $nodeModules = Get-ChildItem -Path $src -Recurse | Where-Object { $_.Name -eq "node_modules" }
    foreach ($nodeModule in $nodeModules) {
        if (Test-Path -Path $nodeModule) {
            Write-Warning "Deleting: $nodeModule";
            Remove-ItemForced  -Path $nodeModule -Verbose $Verbose
        }
    }

    $deletePathes = [System.Collections.ArrayList]@();
    $deletePathes.Add("$env:CHUB_NPMGrabber\node_modules\") > $null;
    $deletePathes.Add("$env:CHUB_NPMGrabber\tarfiles\") > $null;
    $deletePathes.Add("$env:CHUB_NPMGrabber\storage\") > $null;
    $deletePathes.Add("$env:CHUB_HOME\tmp\") > $null;

    foreach ($p in $deletePathes) {
        if (Test-Path -Path $p) {
            Write-Host "Dleteting: [$p]";
            $files = Get-ChildItem -Path $p
            foreach ($file in $files) {
                if (Test-Path -Path $file) {
                    Remove-ItemForced  -Path $file -Verbose $Verbose
                    Write-Warning "Deleted: $file";
                }
            }
        }
    }
}