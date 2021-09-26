function global:Save-NpmPacks {
    [CmdletBinding()]
    param([switch] [Alias("L")] $Lock)


    try {
        Set-Location $env:CHUB_NPMGrabber;
        Write-Host $env:CHUB_NPMGrabber -BackgroundColor Red
        $storage = $env:CHUB_NPMGrabber + "\storage";
        $tarfiles = "$env:CHUB_NPMGrabber\tarfiles"
        
        # Start Verdaccio Grabber
        npm cache clear --force
        Stop-VerdaccioGrabber
        Start-VerdaccioGrabber -DebugMode $true;
        
        # Clean Directories
        Assert-DirectoryIsDeleted -Path ".\node_modules";
        Assert-DirectoryIsDeleted -Path $storage;
        Assert-DirectoryIsDeleted -Path $tarfiles;
        # Assert-ItemIsDeleted -Path ".\package-lock.json";

        # Grab Packages
        Assert-DicrectoryExists -Path $tarfiles
        npm clear cache --force
        Write-Host "CWD: " + $pwd -BackgroundColor Red
        Write-Host "RUN: npm ci" + $pwd -BackgroundColor Red
        if ($Lock) {
            npm ci --registry "http://localhost:$env:HTTPPORT_VERDACCIOGRABBER/"
        }
        else {
            npm i --registry "http://localhost:$env:HTTPPORT_VERDACCIOGRABBER/"
        }
        
        $tgzFiles = Get-ChildItem -Path $storage -Recurse -Filter *.tgz
        foreach ($item in $tgzFiles) {
            Write-Host "Copying: " + $item.FullName;
            Copy-Item -Path $item.FullName -Destination $tarfiles -Force;
        }
        
        # Stop VerdaccioGrabber
        Stop-VerdaccioGrabber;
    }
    catch {
        Stop-VerdaccioGrabber;
        Write-Warning $Error
    }
}