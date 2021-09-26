function global:Set-OfflineSetttings { 
    $bagetSettingsFile = "$env:CHUB_BIN\services\baget\appSettings.json";

    $content = Get-Content $bagetSettingsFile;
    $content = $content -replace "https://api.nuget.org/v3/index.json", "http://devops:1100/nuget/nuget_all/"
    $content = $content -replace """legacy"": false", """legacy"": true"
    Set-Content $content -Path $bagetSettingsFile;
}