function global:Stop-ProcessByPort {
    param (
        [int64]
        [alias("P")]
        $Port,
        
        [string]
        [alias("N")]
        $Name
    )
    if (Get-IsPortOpen -P $port) {
        
        $procTree = Get-ProcessTreeByPort -Port $port
        $currentProcTree = Get-CurrentProcessTree -ProcessId $PID
        $currentProcessIds = ($currentProcTree | Select-Object -ExpandPropert Id);
        Write-Color "Procs To Be Terminated For: ", "[$Name]" -Color Darkred , Red
        $procTree;
        foreach ($procToBeKilled in $procTree) {
            try {
                if ($currentProcessIds -notcontains $procToBeKilled.Id) {
                    $procToBeKilled.Kill();
                }
            }
            catch {
                wmic process where processId=$procToBeKilled .Id delete
                Write-Warning "Process For Port: $Port [$Name], ProcID: $procToBeKilled.Id , Stopped By Force"
            }
        }
    }
    else {
        Write-Warning "Not Process Found For Port: $Port [$Name], Stop-Process Aborted"
    }
}