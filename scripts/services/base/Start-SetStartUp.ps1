function global:Start-SetStartUp {
    param(
        [switch] 
        [Alias("D")]
        $DebugMode)
#     $Command = 
#     @"
#         echo "hello" >> "C:\Users\m.talebi\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\codeStart.bat"
#         pause
# "@;
#     $argList = "/k $Command"
#     $verdaccioProcess = Start-Process -FilePath "C:\Windows\system32\cmd.exe" -ArgumentList $argList -PassThru;
#     $verdaccioProcess
}