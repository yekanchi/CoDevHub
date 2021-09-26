function global:Start-SyncPackages {
    param([switch] [Alias("D")] $DebugMode)
    
    $Command = @"
    SyncPackages
"@;

    if ($DebugMode) {
        Start-CodeHubHttpService -Name "SyncPackages" -Port $env:HTTPPORT_SYNCPACKAGES -Command  $Command -WithProfile -DebugMode
    }
    else {
        Start-CodeHubHttpService -Name "SyncPackages" -Port $env:HTTPPORT_SYNCPACKAGES -Command  $Command -WithProfile
    }
}
