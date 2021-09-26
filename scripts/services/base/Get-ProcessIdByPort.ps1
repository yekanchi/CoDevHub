function  global:Get-ProcessIdByPort {
    param (
        [Parameter()]
        [int]
        $Port
    )
    $proc = (Get-NetTCPConnection -LocalPort $Port -ErrorAction Ignore);
    if ($proc.Length) {
        foreach ($cimProp  in $proc) {
            if ($cimProp.CimInstanceProperties["OwningProcess"].Value -ne 0) {
                return $cimProp.CimInstanceProperties["OwningProcess"].Value
            }
        }
    }
    if ($proc) {
        return $proc.OwningProcess
    }
    else {
        return -1;
    }
}

function global:Get-ProcessTreeByPort {
    param (
        [Parameter()]
        [int]
        [Alias("P")]
        $Port
    )
    $Null = @(
        $procId = Get-ProcessIdByPort -Port $Port;
    )
    $procTree = Get-CurrentProcessTree -ProcessId $procId
    return $procTree;
}