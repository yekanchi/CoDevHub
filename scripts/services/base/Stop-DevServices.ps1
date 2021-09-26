function global:Stop-DevServices { 
    Stop-Verdaccio;
    Stop-Baget;
    Stop-SyncPackages;
    Stop-Jenkins;
    Stop-Gitea;
    Stop-SmtpDev;
}