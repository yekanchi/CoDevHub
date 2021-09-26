$BaseProfileFile = [System.IO.DirectoryInfo]"$PSScriptRoot\..\..\scripts\profiles\baseProfile.ps1"
write-host "Calling Base Profile at" $BaseProfileFile.FullName
& $BaseProfileFile.FullName