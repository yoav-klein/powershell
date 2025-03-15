

$apikey = "xxx"
$baseUrl = "https://your-artifactory-server/artifactory"


$Headers = @{
    'X-JFrog-Art-Api' = $apikey
    'Content-Type' =  'application/json'
}

function ListFiles() {
    $listUrl = '/api/storage/digi-generic-deployment-dev?list'
    $(Invoke-RestMethod -Headers $Headers -Uri "$baseUrl$listUrl").files
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
    $repo = "digi-generic-deployment-dev"
    $path = "testupload"
    $file = "test-file.txt"

    Invoke-RestMethod -Headers $Headers -Method PUT -InFile $file -Uri "$baseUrl/$repo/$path/$file"
   
}

MoveArtifacts
