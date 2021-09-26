
function Write-BarPercent($Percent) {
    # Write-Host -NoNewLine "`r$Percent% complete"

    $hostLength = $Host.UI.RawUI.WindowSize.Width
    $percentLength = (($Percent / 100) * $hostLength) - 5;

    Write-Host "`r" -NoNewline;
    $bar = "";
    for ($a = 0; $a -le $percentLength; $a++) {
        $bar += "*";
    }
    for ($a = 0; $a -le $percentLength; $a++) {
        $bar += "*";
    }
    # Write-Host "  $Percent% $bar" - -NoNewLine;
    Write-Progress -Activity "Working On It " -PercentComplete $Percent
}

for ($a = 0; $a -le 100; $a++) {
    Write-BarPercent -Percent $a;
    Start-Sleep -Milliseconds 100
}

