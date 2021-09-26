function global:Start-Baget {
    param([switch] [Alias("D")] $DebugMode)
 
    $Command = @"
    Set-Location $env:BAGET_CONFIG_ROOT;
    $dotnet $env:BAGET_DLL;
"@;
    # nuget locals all -clear;
    if ($DebugMode) {
        Start-CodeHubHttpService -Name "Baget" -Port $env:HTTPPORT_BAGET -Command $Command -DebugMode
    }
    else {
        Start-CodeHubHttpService -Name "Baget" -Port $env:HTTPPORT_BAGET -Command $Command
    }
}