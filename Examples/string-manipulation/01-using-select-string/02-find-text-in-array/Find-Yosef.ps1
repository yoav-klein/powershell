
# you can pipe an array into Select-String
$results = 'John', 'abuYosef', 'Eli', 'David', 'Yosef' | Select-String -Pattern "Yosef"

$results
#$results[0].getType().Name


