param (
    [int]$Port = 1337
)

$listener = [System.Net.Sockets.TcpListener]::new($Port)
Write-Host "Listening on port $Port..."
$listener.Start()
$client = $listener.AcceptTcpClient()
$stream = $client.GetStream()
$reader = New-Object System.IO.StreamReader($stream)
while ($reader.Peek() -ne -1) {
    $data = $reader.ReadLine()
    Write-Host "Received: $data"
}
$reader.Close()
$client.Close()
$listener.Stop()
