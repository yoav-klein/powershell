# Native Command

This is based on the Articles serie [Invoking external commands in Powershell](https://mnaoumov.wordpress.com/2015/01/11/execution-of-external-commands-in-powershell-done-right/)

The `Native-Command.ps1` script contains a function that is a helper function to invoke native commands in Powershell.

When invoking native commands, basically what we want is the following capabilities:

1. When the command exits with an error status code, terminate the run of the script
2. Know what command failed
3. Print the error message that the command outputs

This function is not quite the same as the one in the article, but I think it fulfils the above requirements.