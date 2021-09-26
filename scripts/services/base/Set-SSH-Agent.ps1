function global:Set-SshAgent {
    $sshAgentProcs = Get-Process -Name "ssh-agent" -ErrorAction Ignore;
    foreach ($proc in $sshAgentProcs) {
        $proc.Kill();
    }

    $result = & $SshAgent;
    $ssh_auth_sock = [regex]::Match($result, "SSH_AUTH_SOCK=(.*?);").Groups[1].Value;
    $ssh_agent_pid = [regex]::Match($result, "SSH_AGENT_PID=(.*?);").Groups[1].Value;

    $env:SSH_AUTH_SOCK = $ssh_auth_sock;
    $env:SSH_AGENT_PID = $ssh_agent_pid;
}

function global:Add-Ssh {
    & $SshAdd  $env:CHUB_SSH_KEYFILE;
}