function global:Add-PathTop {
    [CmdletBinding()]
    param(
        [string] 
        [Alias("p")]
        $PathNewItem)

    $PathNewItem = Resolve-Dir $PathNewItem
    $env:Path = $PathNewItem + ";" + $env:path;
}

function global:Add-PathEnd {
    [CmdletBinding()]
    param(
        [string] 
        [Alias("p")]
        $PathNewItem)

    $PathNewItem = Resolve-Dir $PathNewItem
    $env:Path += ";$PathNewItem";
}