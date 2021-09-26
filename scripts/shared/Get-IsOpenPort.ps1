function Global:Get-IsPortOpen() {
	param(
		[Alias("P")]
		[Int64]
		$Port
	)
	$connection = (New-Object Net.Sockets.TcpClient);
	try {
		$connection.Connect("127.0.0.1", $Port);
		$connection.Dispose();
		return $true
	}
	catch {
		$connection.Dispose();
		return $false
	}
}