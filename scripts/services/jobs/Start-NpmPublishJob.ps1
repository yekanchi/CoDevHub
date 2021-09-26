# function global:Start-NpmPublishJob {
#     param(
#         [switch] 
#         [Alias("D")]
#         $DebugMode)
        
#     if ($global:npmJob.State -ne "Running") {
#         $global:npmJob = Start-Job -Name "NpmJob" -ScriptBlock {
#             while ($true) {
#                 Start-Sleep -Seconds 5
#                 # try {
#                 & "$env:CHUB_SCPTS\commons\Set-Commons.ps1";
#                 $npm_Packs = Get-ChildItem -Path $npmsPath -Recurse -Filter "*.tgz";
#                 if ($npm_Packs) {
#                     foreach ($npmPack in $npm_Packs) {
#                         $serviceUrl = "http://localhost:$env:HTTPPORT_VERDACCIO"
#                         if (Assert-Service -Address $serviceUrl) {
#                             npm publish $npmPack.FullName --registry $serviceUrl;
#                             Move-Item  $npmPack.FullName -Destination $doneNpmsPath -Force;
#                         }
#                     }
#                 }
#                 # }
#                 # catch {
#                 #     Write-Error $Error 
#                 # }
#             }
#         };
#     }
# }
