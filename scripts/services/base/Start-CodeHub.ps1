function Global:Start-CodeHub {
    if ($IsWindows) {
        Invoke-Expression ("$env:CHUB_UTILS\everything\everything.exe" + " " + "-startup");
        Invoke-Expression ("$env:CHUB_UTILS\trafficMonitor\trafficMonitor.exe");
        Invoke-Expression ("$env:CHUB_TOOLS\caffeine64.exe");
    }
}