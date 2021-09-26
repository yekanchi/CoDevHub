$BaseHubPath 	            				= (new-object system.io.directoryinfo "$PSScriptRoot\..\..\base").FullName;
$CHUB_HOME 		            				= (new-object system.io.directoryinfo "$PSScriptRoot\..\..").FullName;;

Write-Host "CodeHub Base Dir:" 	$BaseHubPath -B Gray
Write-Host "CodeHub Home Dir:" 	$CHUB_HOME -B Gray

$Global:BaseNodePath        				= "$BaseHubPath\node";
$Global:BaseGitPath         				= "$BaseHubPath\git\bin";

$Global:BasePwsh            				= "$BaseHubPath\pwsh\pwsh.exe";
$Global:BaseNode            				= "$baseNodePath\node.exe";
$Global:BaseVerdaccio       				= "$baseNodePath\verdaccio.cmd";
$Global:BaseGit             				= "$baseGitPath\git.exe";

$env:path 		            				= ";$baseGitPath" + $env:path; 
$env:path 		            				= ";$baseNodePath" + $env:path;


########################## Configure PATH, To Force It Use CODEHUB Assets ##########################
# Add Base Node To Top of Path So It's Considred Firtst
$env:NODE_PATH 								= $BaseGitPath + "node"; #node executbale path
$env:NPM_CONFIG_SCRIPTS_PREPEND_NODE_PATH 	= "false";

Set-Location $CHUB_HOME
Write-Host "----------------------------------" -B Green -F Yellow;
Write-Host "---------@CodeHub: Base-----------" -B White -F Black;
Write-Host "----------------------------------" -B Red -F Yellow;