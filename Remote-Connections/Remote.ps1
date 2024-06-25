
# Replace 'RemoteComputerName' with the actual hostname or IP address of the remote machine.
$remoteComputer = "10.70.220.7"

# Replace 'Username' and 'Password' with the credentials for the remote machine.
$credentials = Get-Credential -Credential "Administrator"

# Create a new PowerShell session to the remote machine.
$session = New-PSSession -ComputerName $remoteComputer -Credential $credentials