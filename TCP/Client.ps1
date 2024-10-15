param (
    [string]$Host = "localhost",
    [int]$Port = 1337
)

$client = New-Object System.Net.Sockets.TcpClient($Host, $Port)
$stream = $client.GetStream()
$writer = New-Object System.IO.StreamWriter($stream)
$writer.WriteLine("Hello from PowerShell!")
$writer.Flush()
$writer.Close()
$client.Close()
