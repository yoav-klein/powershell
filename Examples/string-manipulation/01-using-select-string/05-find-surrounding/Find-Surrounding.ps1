
# get lines before and after the match
# using the -context parameter

Select-String -Path example.txt -Pattern "example" -Context 2,2

# you can see that the output marks > on the lines matched
# and outputs 2 lines before and 2 lines after each match