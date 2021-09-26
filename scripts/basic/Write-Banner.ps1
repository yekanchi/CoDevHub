function Global:Write-InlineBanner {
    param (
        [string]
        [Alias("M")]
        $Message
    )

    $bg = "Yellow";
    $fg = "Gray";

    $bgMsg = "Green";
    $fgMsg = "Black";
    
    $cursoePosition = ($Host.UI.RawUI.CursorPosition).X + 4;
    $messageLength = $Message.Length;
    $hostWidth = ($Host.UI.RawUI.WindowSize.Width) - ($messageLength + 8 + $cursoePosition);

    #  WINGS:
    $wingChar = "=";
    $leftWing = "<<";
    $rightWing = "";
    for ($i = 0; $i -lt $hostWidth / 2; $i++) {
        $leftWing += $wingChar;
        $rightWing += $wingChar;
    }
    $rightWing += ">>";
    Write-Host -NoNewline   $leftWing       -F $fg        -B $bg  
    Write-Host -NoNewline "_$Message _"     -F $fgMsg -B $bgMsg;
    Write-Host -NoNewline   $rightWing      -F $fg        -B $bg  ;
    Write-Host;
}

function Global:Write-Banner {
    param (
        [string]
        [Alias("M")]
        $Message
    )

    $bg = "Yellow";
    $fg = "Gray";

    $bgMsg = "Green";
    $fgMsg = "Black";
    
    $messageLength = $Message.Length;
    $hostWidth = ($Host.UI.RawUI.WindowSize.Width) - ($messageLength + 8);

    #  WINGS:
    $wingChar = "=";
    $leftWing = "<<";
    $rightWing = "";
    for ($i = 0; $i -lt $hostWidth / 2; $i++) {
        $leftWing += $wingChar;
        $rightWing += $wingChar;
    }
    $rightWing += ">>";
    Write-Host -NoNewline   $leftWing       -F $fg        -B $bg  
    Write-Host -NoNewline "_$Message _"     -F $fgMsg -B $bgMsg;
    Write-Host -NoNewline   $rightWing      -F $fg        -B $bg  ;
    Write-Host;
}