
# function global:Start-NugetPublishJob {
#     param(
#         [switch] 
#         [Alias("D")]
#         $DebugMode)

#     if ($global:nugetJob.State -ne "Running") {
#         $global:nugetJob = Start-Job -Name "NugetJob" -ScriptBlock {
#             while ($true) {
#                 Start-Sleep -Seconds 5
#                 # try {
#                 & "$env:CHUB_SCPTS\commons\Set-Commons.ps1";
#                 $nuget_packs = Get-ChildItem -Path $nugetsPath -Recurse -Filter "*.nupkg";
#                 if ($nuget_packs) {
#                     foreach ($nugetPack in $nuget_packs) {
#                         $serviceUrl = "http://localhost:$env:HTTPPORT_BAGET/v3/index.json";
#                         if (Assert-Service -Address $serviceUrl) {
#                             nuget push $nugetPack -source $serviceUrl
#                             Move-Item  $nugetPack.FullName -Destination $doneNugetsPath -Force;
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