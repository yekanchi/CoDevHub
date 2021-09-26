function global:Start-ArchvieCodeHub() {
    [CmdletBinding()]
    param (
        [Parameter()]
        [int]
        $Mode
    )
    # Samples: 
    # winrar  a  -r -v1g -rr2p  save.rar . -x.git
    # 7z a $OutFile $VolumeLimit  -mx0  -xr0'!.git'
    Clear-Trash;
    Set-Location $env:CHUB_HOME;
    
    $OutPutDir = ([System.IO.DirectoryInfo]"$env:CHUB_HOME\tmp").FullName;
    $OutFile = $OutPutDir + "\CodeHubArchive.7z";
    if ($Mode -eq 0) {
        $VolumeLimit = "-v2g"; #Set Volume Split Limit 2 GigiaByte
        $CompressionLevel = "-mx2"; #Set Compress Level
        7z a $OutFile $VolumeLimit $CompressionLevel -r
    }
    elseif ($Mode -eq 1) {
        $VolumeLimit = "-v2g"; #Set Volume Split Limit 2 GigiaByte
        $CompressionLevel = "-mx2"; #Set Compress Level
        7z a $OutFile $VolumeLimit $CompressionLevel -xr0'!.git' -r
    }
    elseif ($Mode -eq 2) {
        $VolumeLimit = "-v2g"; #Set Volume Split Limit 2 GigiaByte
        $CompressionLevel = "-mx2"; #Set Compress Level
        7z a $OutFile $VolumeLimit $CompressionLevel -xr0'!.git' -xr0'!repos' -r
    }
    elseif ($Mode -eq 3) {
        Write-Host "MODE: $Mode"
        $VolumeLimit = "-v2g"; #Set Volume Split Limit 2 GigiaByte
        $CompressionLevel = "-mx2"; #Set Compress Level
        7z a $OutFile $VolumeLimit $CompressionLevel -xr0'!.git' -xr0'!repos' -xr0'!utils' -r
    }
}