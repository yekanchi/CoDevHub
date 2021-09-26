powershell.exe -Noexit -ExecutionPolicy Bypass -File Set-Base.ps1 

if NOT ["%errorlevel%"]==["0"] (
    pause
    exit /b %errorlevel%
)