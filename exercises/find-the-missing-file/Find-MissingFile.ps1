
# you have a directory with a bunch of files named file1.txt, file2.txt ... until file100.txt.
# but one or more files are missing.
# find the missing file(s)

$files = Get-ChildItem dir

$template = "fileNUMBER.txt"
$missing = @()
foreach($number in 1..100) {
    $fileName = $template -replace 'NUMBER', $number
    if((Test-Path -Path dir/$fileName) -ne $true) {
        $missing += $fileName
    }
}

echo $missing
