function global:Send-SyncEmail {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $Email,
        [Parameter()]
        [string]
        $PackageName,
        [Parameter()]
        [string]
        $SourceName,
        [Parameter()]
        [string]
        $CommandResult
    )
    $br = "<br/>";
    $bodStyle = "
    body {
        font-family: tahoma;
        font-size: 14px;
    }
    body b {
        color: blue;
    }
    body code {
        color: #e0e0e0;
        background-color: #000531;
    }
";
    $style = "<style type='text/css'>$bodStyle</style>";
    $body = "<div>The Package: <b>$PackageName</b></div>" + $br;
    $body += "<div>Published To: <b>$SourceName</b></div>" + $br;
    $body += "<div>By: <b>$Email</b></div>" + $br;
    $body += "<div>Publish Result: $br<code>$CommandResult</code></div>" + $br;
    $body = "<html><head> $style </head><body>$body</body><html>";
    $subject = "Published $packageName To $SourceName" ;

    Send-Email -ToEmailAddress $Email `
        -Subject $subject `
        -Body $body
}