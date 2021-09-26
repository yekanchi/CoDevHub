function global:Start-WindowsStartup {
    [CmdLetBinding()]
    param (
        [Parameter(Mandatory = $false)]
        [string]
        $FilePath
        = ""
    )

    Start-CodeHub;
    # Start-DevServices;
}
