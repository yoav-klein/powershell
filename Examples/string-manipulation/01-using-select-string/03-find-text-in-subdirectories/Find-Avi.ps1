
# find text in all subdirectories

Get-ChildItem -Recurse -Filter "*.txt" | Select-String -Pattern "Avi"