
################### System ###################
function global:Set-PathTop {
    param([Alias('D')] [string ] $Directory)
    $env:Path += "$Directory;" + $env:Path;
}

function global:Set-PathEnd {
    param([Alias('D')] [string ] $Directory)
    $env:Path += $env:Path + ";$dir;";
}

function global:New-ConstVariable {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $VariableName,
        [Parameter()]
        [System.Object]
        $Value
    )
    Set-Variable -Name $VariableName -Value $Value -Scope  Global -Option Constant
    
    $Variable = (Get-Variable -Name $VariableName).Value;
    return $Variable;
}
################### Archive ###################
function global:New-Archive($source , $destin) {
    7z a -mx=9 -v90m "$destin" "$source" -bsp1 -bt
}

function global:Publish-CodeHubPackage {
    [CmdletBinding()]
    param (
        [Parameter()]
        [Alias('C')]
        [CodeHub.Core.CodeHubInitPackage]
        $CodeHubInitPackage
    )

    Write-Host "Extracting From: $source" -BackgroundColor DarkGreen;
    Write-Host "Extracting   To: $destin" -BackgroundColor DarkRed;
        
    Write-Host "Source Health Check:" -BackgroundColor DarkYellow;
    7z t "$source";
    Write-Host "Extracting ..." -BackgroundColor DarkYellow;
    7z x "$source" -o"$destin" -bsp1 -bt
    
}

################### Internet ###################
function global:Assert-IsUrl {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $Url
    )
    {
        $HTTP_Request = [System.Net.WebRequest]::Create("$Url")

        # We then get a response from the site.
        $HTTP_Response = $HTTP_Request.GetResponse()

        # We then get the HTTP code as an integer.
        $HTTP_Status = [int]$HTTP_Response.StatusCode

        $Result = [bool]0;
        If ($HTTP_Status -eq 200) {
            Write-Host "Site is OK!";
            $Result = [bool]1;
        }
        Else {
            Write-Host "The Site may be down, please check!"
        }

        # Finally, we clean up the http request by closing it.
        If ($HTTP_Response -eq $null) { } 
        Else { $HTTP_Response.Close(); }

        return $Result;
    }
}
function global:Set-CodeHubDirs([string] $Root) {
    
}