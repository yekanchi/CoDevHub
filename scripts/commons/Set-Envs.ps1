# SUB ROUTES:
$env:CHUB_BIN                           = (Resolve-Dir "$env:CHUB_HOME\bin");
$env:CHUB_SCPTS                         = (Resolve-Dir "$env:CHUB_HOME\scripts");
$env:CHUB_REPOS                         = (Resolve-Dir "$env:CHUB_HOME\repos");
$env:CHUB_UTILS                         = (Resolve-Dir "$env:CHUB_HOME\utils");
$env:CHUB_MODLS                         = (Resolve-Dir "$env:CHUB_REPOS\modules");
$env:CHUB_IMPRT                         = (Resolve-Dir "$env:CHUB_REPOS\packages");
$env:CHUB_TOOLS                         = (Resolve-Dir "$env:CHUB_BIN\tools");
$env:CHUB_EXECS                         = (Resolve-Dir "$env:CHUB_BIN\exec");
$env:CHUB_SRVCS                         = (Resolve-Dir "$env:CHUB_BIN\services");


$env:CHUB_CONFIG_FILE                   = (Resolve-Dir "$env:CHUB_REPOS\CodeHubSystemConfig.json");
$global:CodeHubConfig                   = Get-Content -Path $env:CHUB_CONFIG_FILE | ConvertFrom-Json

# Pwsh Settings
$env:POWERSHELL_UPDATECHECK             = "Off";
$env:PSModulePath                       = $env:CHUB_MODLS + ";" + $env:PSModulePath;
$env:SharedPSPath                       = (Resolve-Dir "$env:CHUB_HOME\scripts\shared");
$env:ServicePSPath                      = (Resolve-Dir "$env:CHUB_HOME\scripts\services");

# Commands
if ($IsWindows) {
    $global:pwsh                        = (Resolve-Dir "$env:CHUB_BIN\pwsh\pwsh.exe");
    $Global:java                        = (Resolve-Dir "$env:CHUB_EXECS\jdk\bin\java.exe")
    $Global:dotnet                      = (Resolve-Dir "$env:CHUB_EXECS\dotnet\dotnet.exe")
$Global:verdaccio                       = "node" + " " + (Resolve-Dir "$env:CHUB_BIN\services\verd\node_modules\verdaccio\bin\verdaccio");
}
else {
    $Global:pwsh                        = (Resolve-Dir "$env:CHUB_BIN\pwsh\pwsh");
    $Global:java                        = (Resolve-Dir "$env:CHUB_EXECS\jdk\bin\java")
}
# PORTS:
$env:HTTPPORT_BAGET                     = 8001;
$env:HTTPPORT_VERDACCIO                 = 8002;
$env:HTTPPORT_VERDACCIOGRABBER          = 8003;
$env:HTTPPORT_GITEA                     = 8004;
$env:HTTPPORT_JENKINS                   = 8005;
$env:HTTPPORT_JIRA                      = 8006; #CONFIG: CodeHub\bin\services\jira\conf\server.xml
$env:HTTPPORT_SMTPDEV                   = 8007; 
$env:HTTPPORT_SYNCPACKAGES              = 9001;
$env:HTTPPORT_Mysql                     = 3306;

#	CodeHub Path:


##  CodeHub
#Baget
$env:BAGET_URL                          = "http://localhost:$env:HTTPPORT_BAGET/v3/index.json";
$env:BAGET_CONFIG_ROOT                  = Resolve-Dir "$env:CHUB_REPOS\baget";
$env:BAGET_DLL                          = Resolve-Dir "$env:CHUB_SRVCS\baget\baget.dll";

#GITEA
$env:GITEA_WORK_DIR                     = Resolve-Dir "$env:CHUB_REPOS\gitea"
$env:GITEA_CUSTOM                       = Resolve-Dir "$env:CHUB_REPOS\gitea"
$env:JIRA_BIN_PATH                      = Resolve-Dir "$env:CHUB_SRVCS\jira";

$global:JenkinsBinPath                  = Resolve-Dir "$env:CHUB_SRVCS\jenkins";
$global:GiteaBinPath                    = Resolve-Dir "$env:CHUB_SRVCS\gitea";

$global:VerdaccioConfigFile             = Resolve-Dir "$env:CHUB_HOME\repos\verdaccio\config.yaml";
$env:CHUB_NPMGrabber                    = Resolve-Dir "$env:CHUB_UTILS\npmGrabber";
$global:VerdaccioGrabberConfigFile      = Resolve-Dir "$env:CHUB_NPMGrabber\config.yaml";


## Background Jobs:
#job objects:
$global:SyncSleepTime                   = 5;
$global:nugetJob                        = $null;
$global:npmJob                          = $null;
#nuget:
$global:nugetsPath                      = "$env:CHUB_IMPRT\nuget";
$global:doneNugetsPath                  = "$env:CHUB_IMPRT\done_nuget";
#npm:
$global:npmsPath                        = "$env:CHUB_IMPRT\npm";
$global:doneNpmsPath                    = "$env:CHUB_IMPRT\done_npm";


##	Cpp

## 	JavaScript
# 	Node.js, Typescrtipy, Angular, React:
$env:NODE_PATH                          = Resolve-Dir "$env:CHUB_EXECS\node"; #node executbale path
$env:NPM_CONFIG_SCRIPTS_PREPEND_NODE_PATH = "false";

## Dotnet
$env:DOTNET_ROOT                        = Resolve-Dir "$env:CHUB_EXECS\dotnet";
$env:DOTNET_CLI_TELEMETRY_OPTOUT        = 1;

## 	python
#   winPython
# & "$env:CHUB_EXECS\python\scripts\env.bat"
# 	anaconda
$env:CONDA_NPY                          = "111";
$env:SCRIPTS                            = Resolve-Dir "$env:CHUB_HOME\bin\exec\anaconda\Scripts";
$env:LIBRARY_BIN                        = Resolve-Dir "$env:CHUB_HOME\bin\exec\anaconda\Library\bin";
$env:LIBRARY_IN                         = Resolve-Dir "$env:CHUB_HOME\bin\exec\anaconda\Library\include";
$env:LIBRARY_LIB                        = Resolve-Dir "$env:CHUB_HOME\bin\exec\anaconda\Library\lib";
$env:QT_PLUGIN_PATH                     = Resolve-Dir "$env:CHUB_HOME\bin\exec\anaconda\Library\plugins";


## Postgresql
$env:PGDATA                             = Resolve-Dir  "$env:CHUB_REPOS\pgdata"
##	Java
#jdk
$env:JAVA_HOME                          = Resolve-Dir "$env:CHUB_EXECS\jdk";
$env:JRE_HOME                           = Resolve-Dir "$env:CHUB_EXECS\jdk";

## RCLONE
$env:RCLONE_CONFIG_DIR                  = Resolve-Dir "$env:CHUB_REPOS\rclone"
## Jenkings:
$env:JENKINS_HOME                       = Resolve-Dir "$env:CHUB_REPOS\jenkins_home";
$env:JIRA_HOME                          = Resolve-Dir "$env:CHUB_REPOS\jira_home";

## GIT:
$env:GIT_SSH                            = Resolve-Dir "$env:CHUB_BIN\git\gitscm\usr\bin\ssh.exe";
$env:CHUB_SSH_KEYFILE                   = Resolve-Dir "$env:CHUB_REPOS\secrets\git\githubkey";
$global:SshAgent                        = "$env:CHUB_BIN\git\gitscm\usr\bin\ssh-agent.exe"
$global:SshAdd                          = "$env:CHUB_BIN\git\gitscm\usr\bin\ssh-add.exe"

## alacritty
$global:alacaritty                      = "$env:CHUB_TOOLS\alacritty.exe"
$global:alacarittyConfig                = "$env:CHUB_TOOLS\alacritty.yml"
##################################### 	PATH   #####################################:
#	exec
Add-PathTop "$env:CHUB_EXECS\dotnet";
Add-PathTop "$env:CHUB_EXECS\jdk\bin";
Add-PathTop "$env:CHUB_EXECS\node";
Add-PathTop "$env:CHUB_EXECS\python\scripts;";

#	service
Add-PathTop "$env:CHUB_SRVCS\mysql\bin";

# 	bins:
Add-PathTop "$env:CHUB_BIN\npp";
Add-PathEnd "$env:CHUB_TOOLS\7zip";
Add-PathEnd "$env:CHUB_TOOLS\npp";
Add-PathEnd "$env:CHUB_TOOLS\rclone";
Add-PathEnd "$env:CHUB_TOOLS\winfsp"; # Needed For rclone mounting drives
Add-PathEnd "$env:CHUB_TOOLS\nirSoft";
Add-PathEnd "$env:CHUB_TOOLS";

#	scm
Add-PathTop "$env:CHUB_BIN\git\gitscm\bin";
Add-PathTop "$env:CHUB_BIN\git\gitscm\cmd";
Add-PathTop "$env:CHUB_BIN\git\git-lfs";
Add-PathTop "$env:CHUB_BIN\git\github";

## Utils:
Add-PathEnd "$env:CHUB_UTILS\ides\vsCode";
Add-PathEnd "$env:CHUB_UTILS\ides\linqPad6";
Add-PathEnd "$env:CHUB_UTILS\ides\linqPad5";
Add-PathEnd "$env:CHUB_UTILS\ides\webstorm\bin";
Add-PathEnd "$env:CHUB_UTILS\ides\datagrip\bin";
