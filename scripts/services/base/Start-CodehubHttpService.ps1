function Global:Start-CodeHubHttpService() {
    param(
        [string] [alias("Command")] $CommandStr,
        [string] [alias("P")] $Port,
        [string] [alias("N")] $Name,        
        [switch] [alias("WP")] $WithProfile,        
        [switch] [Alias("D")] $DebugMode)
    
    ######################## WINDOWS  ########################
    $npProfileSwtich = "-NoProfile";
    if ($WithProfile) {
        $npProfileSwtich = "";
    }
    if ($IsWindows) {
        if ($DebugMode) {
            $argList = "-NoExit  $npProfileSwtich -Command $CommandStr"
        }
        else {
            $argList = "-NoExit $npProfileSwtich -WindowStyle Hidden  -Command $CommandStr"
        }
       
        if (!(Get-IsPortOpen -P $Port)) {
            $srvcProcess = Start-Process -FilePath $pwsh -ArgumentList $argList -PassThru;
            Write-Warning "$Name Started, Port: [$Port], http://localhost:$Port Processes:"
            $srvcProcess
        }
        else {
            Write-Warning "$Name Service Port [$Port] Is In Use, Start $Name Service Aborted"
        }
    }
    ######################## UNIX  ########################
    else {
        $argList = "-NoProfile  -Command $CommandStr"
        if (!(Get-IsPortOpen -P $Port)) {
            $srvcProcess = Start-Process nohup $pwsh, ' --Command "', $CommandStr, '"';
            Write-Warning "$Name Started, Port: [$Port], Processes:"
            $srvcProcess
        }
        else {
            Write-Warning "$Name Service Port [$Port] Is In Use, Start $Name Service Aborted"
        }
    }
}