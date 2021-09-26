Clear-Host;
$env:CHUB_HOME = (Resolve-Path "$PSHOME\..\..").Path;
Write-Host -NoNewline " Default " 						-B DarkYellow 	-F Black
Write-Host -NoNewline " CodeHubHome: $env:CHUB_HOME "  	-B Red 			-F Black

Invoke-Expression "$env:CHUB_HOME\scripts\commons\Set-Commons.ps1";


