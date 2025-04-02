
# find all access log lines from IP 192.168.1.1
# and extract the request URI

# tricky part - there are also 192.168.1.11, 12, etc.
$result = Get-Content access.log |
    Select-String -Pattern "192\.168\.1\.1\D" |
    % { $_.Line } |
    Select-String -Pattern "(GET|POST|PUT)\s(\S+)\s" |
    % { $_.Matches[0].Groups[2].Value }

$result

## Explanation

# 1. Select-String -Pattern "192\.168\.1\.1\D" - returns an Array of MatchInfo objects
# 2. % { $_.Line } - takes this array as input, and outputs an array of Strings containing the matching line
# 3. Select-String -Pattern "(GET|POST|PUT)\s(\S+)\s"  - takes this array as input, and outputs an array of MatchInfo objects
# with captured groups
# 4. { $_.Matches[0].Groups[2].Value } - takes the array of MatchInfo objects, and for each, extracts the last group's value
# this outputs an array of Strings, which is what we want.
