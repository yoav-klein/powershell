

$apikey = $env:APIKEY
$baseUrl = "https://cyberark.jfrog.io/artifactory"


$Headers = @{
    'X-JFrog-Art-Api' = $apikey
    'Content-Type' =  'application/json'
}

function ListFiles() {
    $repo = "digi-gradle-latest-local"
    $listUrl = '/api/storage/digi-gradle-latest-local/com/cyberark/digi/application-service-sdk?list'
    $(Invoke-RestMethod -Headers $Headers -Uri "$baseUrl$listUrl").files
}

function DownloadFile() {
    $repo = "digi-gradle-latest-local"
    $path = '/com/cyberark/digi/application-service-sdk/ivy-1.0.1101.xml'
    Invoke-RestMethod -Headers $Headers -Uri "$baseUrl/$repo/$path"
}

# FOR SOME REASON DOESN'T WORK IN Invoke-RestMethod
# BUT DOES WORK WITH CURL
function MoveArtifacts() {

    $sourceRepo = "digi-generic-deployment-dev"
    $sourcePath = "testupload/test-file.txt"
    $targetRepo = "digi-generic-deployment-integration"
    $targetPath = "testupload/test-file.txt"
    
    $promoteUrl = "/api/move/$sourceRepo/$sourcePath?to=/$targetRepo/$targetPath"

    $(Invoke-RestMethod -Method POST -Headers $Headers -Uri "$baseUrl$promoteUrl").Content
    
}

function Upload() {
    $repo = "digi-gradle-latest-local"
    $path = "com/cyberark/digi/application-service-sdk/2.2.1701"
    $file = "test-file.txt"

    Invoke-RestMethod -Headers $Headers -Method PUT -InFile $file -Uri "$baseUrl/$repo/$path/$file"
}

function Delete() {
    $repo = "digi-gradle-dev-local"
    $path = "com/yoav/app"

    Invoke-RestMethod -Headers $Headers -Method DELETE -Uri "$baseUrl/$repo/$path"
}

Delete
