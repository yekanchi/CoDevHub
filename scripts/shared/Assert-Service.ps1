
function global:Assert-Service {
    param(
        [string] 
        [Alias("A")]
        $Address = "")

    $result = Assert-Url -Address $Address
    return $result;
}