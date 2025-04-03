# wrap each line in a file in "<TEXT>",

$content = Get-Content file.txt
$content | % { "`"$_`"," }