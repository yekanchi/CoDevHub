function Global:Stop-CodeHub {
    [CmdletBinding()]
    param (
        [Parameter()]
        [switch]
        [Alias("F")]
        $Force
    )
    process {
        if ($IsWindows) {
            Stop-ProcessByName -Name "TrafficMonitor";
            Stop-ProcessByName -Name "Everything";
            Stop-ProcessByName -Name "caffeine64";
            Stop-ProcessByName -Name "ssh-agent";
    
            $pwshProcesses = Get-Process `
            | Where-Object { $_.Path -eq $pwsh.ToString() -and $_.Id -ne $PID };
    
            if ($pwshProcesses.HandleCount -gt 0) {
                Write-Warning "Killing: ";
                $pwshProcesses;
                $pwshProcesses | ForEach-Object { $_.Kill() }
            }
            if ($Force) {
                $lockingProcIds = Find-CodeHubLocks;
                $currentProcessTree = Get-CurrentProcessTree -Pid $PID;
                foreach ($prc in $lockingProcIds ) {
                    if ($prc.Id -and $prc.Id -ne $PID) {
                        if (($currentProcessTree | Select-Object -ExpandPropert Id) -notcontains $prc.Id ) {
                            # Stop-Process -Id $prc.Id -ErrorAction Ignore;
                            $prc.Kill();
                        }
                    }
                }
            }
        }
    }
}