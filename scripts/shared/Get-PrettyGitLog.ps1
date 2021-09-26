function global:Get-PrettyGitLog()
{
	git log --all --decorate --oneline --graph --abbrev-commit --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' 
};
