

$Data = @{
    name = "yoav"
} | ConvertTo-Json

$UserPass = "yoavklein:Yoav-Klein3"
#$UserPass = "cloud_user:WRRW6448hmjo"
$Bytes = [System.Text.Encoding]::ASCII.GetBytes($UserPass)
$EncodedText = [System.Convert]::ToBase64String($Bytes)
$Headers = @{
    Authorization = "Basic $EncodedText"
}
$Url = "https://search-movies-lahamhucuj7pfevsvuek4jwruu.us-east-1.es.amazonaws.com/movies/_doc/1"
