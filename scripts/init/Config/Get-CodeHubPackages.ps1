function global:Get-CodeHubPackages {
    [CmdletBinding()]
    param (
        [Parameter()]
        [CodeHub.Init.CodeHubInitConfig]
        $CodeHubIntiConfig
    )
    $CodeHubPackages = New-Object Collections.Generic.List[CodeHub.Init.Package]


    ################################################# pwsh #################################################
    $package = New-Object CodeHub.Init.Package;
    $package.Name = "basePwsh";
    $package.Directory = [System.IO.DirectoryInfo]($CodeHubIntiConfig.BaseDir.FullName + "\pwsh");
    $package.Version = "7.1.2";
    
    #powershell from packs directory if exists
    $source0 = New-Object CodeHub.Init.PackageSource;
    $source0.Priority = 0;
    $source0.SourceName = "PacksDir"
    $source0.SourceType = [CodeHub.Init.SourceType]::FileStorage;
    $source0.Path = ($CodeHubIntiConfig.PacksDir.FullName + "\pwsh\pwsh.7z.001")
    $package.Sources.Add($source0);

    #powershell from github releases
    $source1 = New-Object CodeHub.Init.PackageSource;
    $source1.Priority = 1;
    $source1.SourceType = [CodeHub.Init.SourceType]::DownloadUri;
    $source1.Path = "https://github.com/PowerShell/PowerShell/releases/download/v7.1.2/PowerShell-7.1.2-win-x64.zip"
    $package.Sources.Add($source1);
    
    $CodeHubPackages.Add($package);
    
    ################################################# dotnet #################################################   
    $package = New-Object CodeHub.Init.Package;
    $package.Name = "dotnet";
    $package.Directory = [System.IO.DirectoryInfo]($CodeHubIntiConfig.ExecDir.FullName + "\dotnet");
    $package.Version = "3.1";
    
    #dotnet from packs directory
    $source0 = New-Object CodeHub.Init.PackageSource;
    $source0.Priority = 0;
    $source0.SourceName = "PacksDir"
    $source0.SourceType = [CodeHub.Init.SourceType]::FileStorage;
    $source0.Path = ($CodeHubIntiConfig.PacksDir.FullName + "\dotnet\dotnet.7z.001")
    $package.Sources.Add($source0);

    #dotnet from micorosoft 
    $source1 = New-Object CodeHub.Init.PackageSource;
    $source1.Priority = 1;
    $source1.SourceType = [CodeHub.Init.SourceType]::DownloadUri;
    $source1.Path = "https://github.com/PowerShell/PowerShell/releases/download/v7.1.2/PowerShell-7.1.2-win-x64.zip"

    $package.Sources.Add($source0);
    $package.Sources.Add($source1);
    
    $CodeHubPackages.Add($package);

    ################################################# jdk #################################################  
    $package = New-Object CodeHub.Init.Package;
    $package.Name = "jdk";
    $package.Directory = [System.IO.DirectoryInfo]($CodeHubIntiConfig.ExecDir.FullName + "\jdk");
    $package.Version = "15";
    
    #jdk from packs directory
    $source0 = New-Object CodeHub.Init.PackageSource;
    $source0.Priority = 0;
    $source0.SourceName = "PacksDir"
    $source0.SourceType = [CodeHub.Init.SourceType]::FileStorage;
    $source0.Path = ($CodeHubIntiConfig.PacksDir.FullName + "\dotnet\jdk15.001")
    $package.Sources.Add($source0);

    #jdk from packs directory
    $source0 = New-Object CodeHub.Init.PackageSource;
    $source0.Priority = 0;
    $source0.SourceType = [CodeHub.Init.SourceType]::FileStorage;
    $source0.Path = ($CodeHubIntiConfig.PacksDir.FullName + "\jdk\jdk.7z.001")
        
    #jdk from micorosoft 
    $source1 = New-Object CodeHub.Init.PackageSource;
    $source1.Priority = 1;
    $source1.SourceType = [CodeHub.Init.SourceType]::DownloadUri;
    $source1.Path = "https://download.oracle.com/otn-pub/java/jdk/15.0.2+7/0d1cfde4252546c6931946de8db48ee2/jdk-15.0.2_windows-x64_bin.zip?AuthParam=1613727705_38433c2f186ed22ccdcf3ed6533876e2"


    $package.Sources.Add($source0);
    $package.Sources.Add($source1);
    $CodeHubPackages.Add($package);

    ############################################################################

    return $CodeHubPackages;
}