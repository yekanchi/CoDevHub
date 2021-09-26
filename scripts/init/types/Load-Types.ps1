# Add-Type -Path "$PSScriptRoot\types\CodeHub.Core.dll"
$CodeHubDllPath = $PSScriptRoot + "\..\..\src\CodeHub.Core\bin\Debug\netstandard2.0\CodeHub.dll";
Add-Type -Path $CodeHubDllPath
$global:initConfig = [CodeHub.Init.CodeHubInitConfig]::new();