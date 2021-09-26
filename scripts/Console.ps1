
[CmdletBinding()]
param (
    [Parameter()]
    [switch]
    $BareShell,
    [Parameter()]
    [switch]
    $Terminal
)

process {
    # .Net methods for hiding/showing the console in the background
    Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow();

[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
'
    function Hide-Console {
        $consolePtr = [Console.Window]::GetConsoleWindow()
        #0 hide
        [Console.Window]::ShowWindow($consolePtr, 0)
    }


    if ($Terminal) {
        if ([System.Environment]::OSVersion.Version.Build -ge 19000) {
            # Start-Process -FilePath "$PSScriptRoot\..\bin\tools\alacritty.exe" -ArgumentList "--config-file", "$PSScriptRoot\..\bin\tools\alacritty.yml" -PassThru
            # Hide-Console
            Start-Process -FilePath "$PSScriptRoot\..\bin\tools\wt\wt.exe" -ArgumentList "-w", "0", "nt", "-d", "$PWD" -PassThru
        }
        else {
            Start-Process -FilePath "$PSScriptRoot\..\bin\tools\alacritty.exe" -ArgumentList "--config-file", "$PSScriptRoot\..\bin\tools\alacritty.yml" -PassThru
            Hide-Console
        }
    }
    if ($BareShell) {
    
    }
    else {
        Add-DesktopScripts
        Set-Location $env:CHUB_HOME
        Write-InlineBanner -Message "@CodeHub"
    }
}
    
