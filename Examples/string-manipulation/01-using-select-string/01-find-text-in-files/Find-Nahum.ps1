
# find Nahum in all text files
Select-String -Path * -Pattern "Nahum"

# Select-String returns an array of MatchInfo
$result = Select-String -Path * -Pattern "Nahum"
$result[0].GetType()


