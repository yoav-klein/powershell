
Get-Content build.gradle | Select-String -Pattern "version =" -NotMatch | Set-Content new.gradle