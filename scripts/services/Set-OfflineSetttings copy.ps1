function global:Set-Sources { 
    npm set registry "http://localhost:$env:HTTPPORT_VERDACCIO"
}