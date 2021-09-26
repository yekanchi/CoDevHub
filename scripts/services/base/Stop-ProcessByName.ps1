function Global:Stop-ProcessByName {
    [CmdLetBinding()]
    param (
        [Parameter(Mandatory = $false)]
        [string]
        [Alias("N")]
        $Name = ""
    )

    $proc = Get-Process -Name $Name -ErrorAction Ignore
    if ($proc) {
        $proc.Kill();
        Write-Warning "Stoppeed process: [$Name]"
    }
    else {
        Write-Warning "Not Found Process For: [$Name]"
    }
}