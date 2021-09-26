function global:Stop-Gitea { 
    Stop-CodeHubHttpService -P $env:HTTPPORT_GITEA -N 'Gitea'
}


