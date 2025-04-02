
# get lines before and after the match
# using the -context parameter

$result = Select-String -Path example.txt -Pattern "example" -Context 2,2

# The context is stored in a Context field of the MatchInfo objects
# It's a MatchInfoContext object

$result | % {
    #$_.Context.GetType()
    echo "=== before"
    $_.Context.PreContext
    echo "=== after"
    $_.Context.PostContext
}

# you can see that the output marks > on the lines matched
# and outputs 2 lines before and 2 lines after each match