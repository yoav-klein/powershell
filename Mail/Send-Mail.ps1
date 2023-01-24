
######################################
#
#   Send-Mail.ps1
#
#   An example of sending emails using powershell
#
######################################


function Send-Mail() {
    $Username = "AKIAUKSMTKSXV5BYFDFT"
    $Password = "BCjS1k0o6wxbSzKy0f2Tp/FNXD7WVXkbGKdhwBwnewYN"
    $SecurePassword = ConvertTo-SecureString $Password -AsPlainText -Force
    
    $Credential = New-Object System.Management.Automation.PSCredential($UserName, $SecurePassword)
    $To = "yoavklein25@gmail.com"
    $From = "yoavklein25@gmail.com"
    $Subject = "Sending from PowerShell"
    $SmtpServer = "email-smtp.us-east-1.amazonaws.com"
    $Port = 465
    $Body = @"
<html>
<body>
<h1>Send Mail With PowerShell</h1>
<p>This mail was sent using PowerShell's Send-MailMessage cmdlet</p>
</body>
</html>
"@
    
    Send-MailMessage -To $To -From $From -Subject $Subject `
    -SmtpServer $SmtpServer -Port $Port `
    -Body $Body -Credential $Credential `
    -BodyAsHtml -UseSsl

}

function SendEmail($Server, $Port, $Sender, $Recipient, $Subject, $Body) {
    $Username = "AKIAUKSMTKSXV5BYFDFT"
    $Password = "BCjS1k0o6wxbSzKy0f2Tp/FNXD7WVXkbGKdhwBwnewYN"
    $SecurePassword = ConvertTo-SecureString $Password -AsPlainText -Force
    
    $Credentials = New-Object System.Management.Automation.PSCredential($UserName, $SecurePassword)
    #$Credentials = [Net.NetworkCredential](Get-Credential)
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    $SMTPClient = New-Object Net.Mail.SmtpClient($Server, $Port)
    $SMTPClient.EnableSsl = $true
    $SMTPClient.Credentials = New-Object System.Net.NetworkCredential($Credentials.Username, $Credentials.Password);

    try {
        Write-Output "Sending message..."
        $SMTPClient.Send($Sender, $Recipient, $Subject, $Body)
        Write-Output "Message successfully sent to $($Recipient)"
    } catch [System.Exception] {
        Write-Output "An error occurred:"
        Write-Error $_
    }
}


SendEmail "email-smtp.us-east-1.amazonaws.com" 465 "yoavklein25@gmail.com" "yoavklein25@gmail.com" "Testing" "This is a test message"
#Send-Mail