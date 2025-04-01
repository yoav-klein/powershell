
$Result = Select-String -Path 'build.gradle' -Pattern "version = '(.*)'"
$Result[0].Matches.Groups[1].value

Select-String -Path 'build.gradle' -Pattern "version = *" -NotMatch | % { echo $_.Line } | Out-File new.gradle

$addcontent = @"
versionFile=file('version.txt')
version=versionFile.content.trim()
"@

Get-Content 'new.gradle' | % { 
    $_ 
    if($_ -match "group =") {
        $addcontent
    } 
}