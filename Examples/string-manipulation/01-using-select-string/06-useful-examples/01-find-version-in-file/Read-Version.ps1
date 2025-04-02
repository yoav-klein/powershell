
# Assuming we have only one matching pattern

$Result = Select-String -Path 'build.gradle' -Pattern "version = '(.*)'"
$Result[0].Matches.Groups[1].value
