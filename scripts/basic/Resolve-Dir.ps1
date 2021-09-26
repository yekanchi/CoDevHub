function global:Resolve-Dir {
    [CmdletBinding()]
    param(
        [string] 
        [Alias("D")]
        $Directorty)

    try {
        if (Test-Path -Path $Directorty) {
            return (Resolve-Path -Path $Directorty).Path
        }
        else {
            return $Directorty;
        }
    }
    catch {
        return "";
    }
}