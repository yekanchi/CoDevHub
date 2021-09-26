$lockingProcIds = Find-CodeHubLocks;
foreach ($prc in $lockingProcIds ) {
    if ($prc.Id -and $prc.Id -ne $PID) {
        Stop-Process -Id $prc.Id -ErrorAction Ignore;
    }
}