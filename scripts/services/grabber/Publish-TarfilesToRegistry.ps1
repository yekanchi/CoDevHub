function global:Publish-TarfilesToRegistry {
    param(
        # [Parameter(Mandatory=$true, HelpMessage='PlaceWhere to Search For Packages')]
        [alias("P")]
        [string]
        $Path = $env:NodePacks + "\tarfiles",
        [alias("R")]
        [string]
        $Registry = "http://localhost:$env:HTTPPORT_VERDACCIO/"
    )

    $tarfiles = Get-ChildItem -Path $Path -Recurse -Filter *.tgz
    $totalCount = $tarfiles.Count;
    $counter = 0;
    foreach ($tarfile in $tarfiles) {
        Write-color "publishing $counter/$totalCount ", $tarfile, -B DarkGreen, DarkRed -F Yellow, Yellow 
        npm publish $tarfile.FullName --registry $Registry  -f
        $counter++;
    }   
}
