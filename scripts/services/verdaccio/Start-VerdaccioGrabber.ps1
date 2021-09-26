function global:Start-VerdaccioGrabber {
    param([switch] [Alias("D")] $DebugMode)
    
    $Command = @"
    & $verdaccio -c $VerdaccioGrabberConfigFile; 
"@;
    if ($DebugMode) {
        Start-CodeHubHttpService -Name "Verdaccio" -Port $env:HTTPPORT_VERDACCIOGRABBER -Command $Command -DebugMode
    }
    else {
        Start-CodeHubHttpService -Name "Verdaccio" -Port $env:HTTPPORT_VERDACCIOGRABBER -Command $Command
    }
}