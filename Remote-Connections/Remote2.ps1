
$userName = "your-user"
$password = "plaintext-password"
$secPassword = ConvertTo-SecureString $password -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential ($userName, $secPassword)
$session = New-PSSession -ComputerName <machine> -Credential $cred

Enter-PSSession -Session $session
