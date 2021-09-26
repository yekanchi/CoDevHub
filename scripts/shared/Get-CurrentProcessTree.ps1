function global:Get-CurrentProcessTree {
    [CmdletBinding()]
    param (
        [Parameter()]
        [int]
        [Alias("Pid")]
        $ProcessId
    )
    $procChain = [System.Collections.ArrayList]@();
    $Null = @(
        $proc = Get-Process -Id $ProcessId
        if ($proc) {
            $procChain.Add($proc);
        }
        $hasParent = $true;
        do {
            if ($null -eq $proc.Parent) {
                $hasParent = $false;
            }
            else {
                $procChain.Add($proc);
                $proc = $proc.Parent;
            }
            
        } until ($hasParent -eq $false)
    )
    return $procChain;
}