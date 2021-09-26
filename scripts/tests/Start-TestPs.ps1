function global:Start-TestPs
{ 
	Write-Color -Text "main process id: ", "$($pid)" -Color Blue, Red
	powershell.exe -Command {
		Param(
			$one,
			$two,
			$three
		)
		
		Write-Host "child process id: $($pid)";
		Write-Host "Message.Status: $($one) $($two) $($three)";
		Set-Location E:\NHUB\bin\tools\baget
		dotnet Baget.dll;
	} -WindowStyle hidden -Args "A", "B", "C" | Out-Null
}