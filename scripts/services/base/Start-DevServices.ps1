function global:Start-DevServices {
    param(
        [switch] 
        [Alias("D")]
        $DebugMode)
    
    if ($DebugMode) {
        Start-Verdaccio -DebugMode;
        Start-Baget -DebugMode;
        Start-SyncPackages -DebugMode;
        Start-Jenkins -DebugMode;
        Start-Gitea -DebugMode
    }
    else {
        Write-Progress -Activity 'Start-DevServices' -Status "Start-Verdaccio" -PercentComplete 0 ;
        Start-Verdaccio;
        Write-Progress -Activity 'Start-DevServices' -Status " Start-Baget" -PercentComplete 10 ;
        Start-Baget;
        Write-Progress -Activity 'Start-DevServices' -Status "Start-Jenkins" -PercentComplete 20 ;
        Start-SyncPackages;
        Write-Progress -Activity 'Start-DevServices' -Status "Start-SyncPackages" -PercentComplete 30 ;
        Start-Jenkins;
        Write-Progress -Activity 'Start-DevServices' -Status "Start-Gitea" -PercentComplete 40 ;
        Start-Gitea;
        Write-Progress -Activity 'Start-DevServices' -Status "Start-SmtpDev" -PercentComplete 50 ;
        Start-SmtpDev;
        Write-Progress -Activity 'Start-DevServices' -Status "Done" -PercentComplete 100 ;
        Start-Sleep -Seconds 1;
    }

}