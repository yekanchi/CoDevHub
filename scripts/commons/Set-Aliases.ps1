# Important:
Set-Alias -Name "find" -Value "$env:windir\System32\find.exe" -Scope Global;
## CLI:

Set-Alias -Name "baget" -Value Start-Baget -Scope Global
Set-Alias -Name "gitpub" -Value Start-GitCommitAllAndPush -Scope Global;
Set-Alias -Name "carchive" -Value Start-ArchvieCodeHub -Scope Global;
Set-Alias -Name "vsCode" -Value Open-VSCode -Scope Global > $null;
Set-Alias -Name "webStorm" -Value Open-WebStorm -Scope Global > $null;
Set-Alias -Name "datagrip" -Value Open-DataGrip -Scope Global > $null;
Set-Alias -Name "npp" -Value Open-Npp -Scope Global > $null;
Set-Alias -Name "pgl" -Value Get-PrettyGitLog -Scope Global > $null;
Set-Alias -Name "vs" -Value Open-VisualStudio -Scope Global > $null;
Set-Alias -Name "pichon" -Value Open-Pichon -Scope Global > $null;
Set-Alias -Name "rider" -Value Open-Rider -Scope Global > $null;

function global:Open-VSCode { 
	Invoke-Expression "cmd.exe /c start pwsh -WindowStyle Hidden -Command {code $args}";
}

function global:Open-Npp { 
	Invoke-Expression "cmd.exe /c start pwsh -WindowStyle Hidden -Command {notepad++ $args}";
}

function global:Open-WebStorm {
	Set-Location "$env:CHUB_UTILS\ides\webstorm";
	Invoke-Expression "cmd.exe /c start pwsh -WindowStyle Hidden -Command {webstorm64.exe $args}";
}
function global:Open-DataGrip { 
	Set-Location "$env:CHUB_UTILS\ides\datagrip\bin";
	Invoke-Expression "cmd.exe /c start pwsh -WindowStyle Hidden -Command {datagrip64.exe $args}";
}

function global:Open-Rider { 
	Set-Location "$env:CHUB_UTILS\ides\rider\bin";
	Invoke-Expression "cmd.exe /c start pwsh -WindowStyle Hidden -Command {.\rider.bat $args}";
}

function global:Open-VisualStudio { 
	Invoke-Expression "cmd.exe /c start pwsh -WindowStyle Hidden -Command {& 'C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\Common7\IDE\devenv.exe' $args}";
}

function global:Open-Pichon { 
	Invoke-Expression "cmd.exe /c start pwsh -WindowStyle Hidden -Command {& '$env:CHUB_UTILS\icons8\pichon\pichon.exe' $args}";
}
