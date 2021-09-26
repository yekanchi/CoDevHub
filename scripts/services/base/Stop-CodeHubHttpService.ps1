function Global:Stop-CodeHubHttpService {
    param ( [string] [Alias("N")] $Name, 
        [string] [Alias("P")] $Port)
    
        Stop-ProcessByPort -P $Port -N $Name
}