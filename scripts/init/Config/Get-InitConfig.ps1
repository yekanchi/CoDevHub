function global:Get-InitConfig {
    [CmdletBinding()]
    param (
        [Parameter()]
        [Alias('R')]
        [string]
        $CodeHubRoot
    )
    $initConfig = New-Object CodeHub.Init.CodeHubInitConfig;

    $initConfig.RootDir = [System.IO.DirectoryInfo]"$CodeHubRoot";
    $initConfig.ZipDir = [System.IO.DirectoryInfo]"$CodeHubRoot\bin\tools\7zip";
    $initConfig.PacksDir = [System.IO.DirectoryInfo]"$CodeHubRoot\repos\packs";
    $initConfig.BaseDir = [System.IO.DirectoryInfo]"$CodeHubRoot\base";
    $initConfig.ExecDir = [System.IO.DirectoryInfo]"$env:CHUB_HOME\bin\exec";
    $initConfig.InitDir = [System.IO.DirectoryInfo]"$env:CHUB_HOME\scripts\init";
    $initConfig.Zip = [System.IO.FileInfo]"$env:CHUB_HOME\bin\tools\7zip\7z.exe";

    return $initConfig
}