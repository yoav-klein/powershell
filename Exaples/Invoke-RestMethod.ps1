

$Data = @{
    name = "yoav"
} | ConvertTo-Json

$UserPass = "yoavklein:Yoav-Klein3"
$Bytes = [System.Text.Encoding]::Unicode.GetBytes($UserPass)
$EncodedText =[Convert]::ToBase64String($Bytes)
$Headers = @{
    Authorization = "Basic $EncodedText"
}
$Url = "https://search-movies-lahamhucuj7pfevsvuek4jwruu.us-east-1.es.amazonaws.com/movies/_doc/1"
#$Url = "http://localhost:9200/some_ind/_doc/1"
Invoke-RestMethod -Headers $Headers -ContentType "application/json" -Body $Data -Uri $Url -Method PUT
