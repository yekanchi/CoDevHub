function global:Get-Lfs() {
	$cwd = Get-Location;
	Write-Host "Finding Files Larger Than 100MB at $cwd"
	Get-ChildItem -r | Where-Object { $_.length -gt 100MB };
}