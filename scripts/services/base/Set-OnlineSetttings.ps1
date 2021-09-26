function global:Set-OnlineSetttings { 
    
    #Baget
    $bagetSettingsFile = "$env:CHUB_BIN\services\baget\appSettings.json";
    $content = Get-Content $bagetSettingsFile;
    $content = $content -replace  "http://devops:1100/nuget/nuget_all/", "https://api.nuget.org/v3/index.json"
    $content = $content -replace  """legacy"": true" , """legacy"": false"
    Set-Content $content -Path $bagetSettingsFile
}