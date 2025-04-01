
# you can pipe an array into Select-String
$results = 'Eli', 'David', 'Yosef' | Select-String -Pattern "Yosef"

$results[0]
$results[0].getType().Name


