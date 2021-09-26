function global:SyncPackages {
    $Listener = [System.Net.Sockets.TcpListener]9001 ;
    $Listener.Start();
    while ($true) {
        Start-Sleep -Seconds $SyncSleepTime;
        
        ########################## NUGET ###############################
        $nuget_packs = Get-ChildItem -Path $nugetsPath -Recurse -Filter "*.nupkg";
        if ($nuget_packs) {
            foreach ($nugetPack in $nuget_packs) {
                $serviceUrl = "http://localhost:$env:HTTPPORT_BAGET/v3/index.json";
                if (Assert-Service -Address $serviceUrl) {
                        
                    try {
                        $publishResult = (nuget push $nugetPack -source $serviceUrl);
                        $publishResult = ($publishResult -join "</br>`r`n" | Out-String).ToString();
                        $fileName = Split-Path $nugetPack -Leaf;
                        $publishedUser = Get-FileOwner -Path $nugetPack;
                        $publishedUserEmail = Get-UserEmail -UserName $publishedUser;
                        Send-SyncEmail -Email $publishedUserEmail -PackageName $fileName -SourceName "Nuget" -CommandResult $publishResult; 
                    }
                    catch {
                        Write-Error $Error    
                    }
                    finally {
                        Move-Item  $nugetPack.FullName -Destination $doneNugetsPath -Force;
                    }                 
                        
                }
            }
        }
    
        ########################### NPM ################################
        $npm_Packs = Get-ChildItem -Path $npmsPath -Recurse -Filter "*.tgz";
        if ($npm_Packs) {
            foreach ($npmPack in $npm_Packs) {
                $serviceUrl = "http://localhost:$env:HTTPPORT_VERDACCIO"
                if (Assert-Service -Address $serviceUrl) {
                    try {
                        npm publish $npmPack.FullName --registry $serviceUrl;
                        
                    }
                    catch {
                        Write-Error $Error    
                    }
                }
                finally {
                    Move-Item  $npmPack.FullName -Destination $doneNpmsPath -Force;
                }
            }
        }
    }
}
