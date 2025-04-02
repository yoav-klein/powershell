
# we want to remove 5 lines after the occurence of "publishing"

$content = Get-Content build.gradle

$result = $content | Select-String -Pattern "publishing {" -Context 0, 5
# the list of the unwanted lines
$unwanted = $result.Context.PostContext

# filter out those lines
$content | % { if($unwanted -notcontains $_) { $_ } }
