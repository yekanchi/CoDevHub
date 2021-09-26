function global:Start-GitCommitAllAndPush() {
	Write-Host "Adding Files to git";
	git add -A;
	Write-Host "Commiting Files";
	git commit -a -m 'cosmetic';
	Write-Host "Pushing  Files To Origin";
	git push ;
}