# Native Command

This is based on the Articles serie [Invoking external commands in Powershell](https://mnaoumov.wordpress.com/2015/01/11/execution-of-external-commands-in-powershell-done-right/)


## Background
When authoring a script, you need to detect and respond to errors. It is not often that you want to just continue your script as usual if one of the steps fail.

When using Powershell cmdlets, you can set the behaviour of a failing cmdlet using the `ErrorAction` _Common Variable_, or just setting the `$ErrorActionPreference` variable for the whole script.

However, a failure of a native application (some executable) will not affect the sequence of your script - you need to take of it yourself.

What you'll usually want to do is to check the exit code of the application, and if is not what you expect, you want to handle it in some way (often that will be terminating the script run). Maybe you'll want to inspect the output streams to know what exactly went wrong.

So basically what you'll want to do looks something like:

```
$Output = some_application_name 2>&1
if ($LastExitCode -ne 0) {
    if($Output -match "some pattern") {
        Write-Output "The problem is ..."
        exit 1
    }
}
```

That's OK if you're only executing one or two such applications in your script. But if you have a script that is a basically a long list of such commands,  this is not scalable. So we want to have a function that encapsulates all this logic in a robust, yet a flexible and configurable way.

So eventually we want the ability to:
1. Execute a native application, and if it fails, throw an exception (Yet to be able to configure it not to throw one).
2. That exception should hold the STDOUT and STDERR of the application, so I as a script-writer can inspect it and provide an informative message to the user based on it.
<div style="background-color:Cyan;color:black;padding:20px;">
<h2> What we want to do when a fatal error occurs</h2>
This is a point we need to pay attention to.
When some command in our script fails, such that there is no reason to continue execution, what do we want to do?
The options are:

1. Let the exception stop the script - i.e. not catch it. The output will be ugly, and the script will terminate ungracefully.
2. Catch the exception, having the opportunity to parse the output of the command and generate an informative message to the user.

In case of option (1) - we can just have our function to print the line in which the error occured and throw an exception. This enables the script-writer to just call a list of applications without having to write a lot of `try catch` blocks in his code.

The problem with this is exiting non-gracefully.

In case of option (2) - In order to take care of every invocation specifically - i.e. check the output of the command and produce a custom message accordingly - the user will have a `try catch` block for every invocation - which raises the question - what did we achieve here anyway?
</div>

## Invoke-NativeCommand
The `Invoke-NativeCommand` function is a helper function for invoking native applications.

### Parameters
1. The command to execute
2. Optional - a list of error codes that are considered success - defaults to 0.
3. Optional - a flag `IgnoreExitCode` to not throw an exception on error. Defaults to False.

### Return Value
On success, the function returns a `ProcesInfo` object (which is a custom object defined in the same script that the function is defined at) which contains the STDOUT, STDERR and exit code of the application.

### Exceptions
_NativeCommandException_ - If the exit code of the application is not included in the list of _AllowedExitCodes_ - throws this exception, which contains a `ProcessInfo` object, so the script writer can inspect it.

_System.Management.Automation.CommandNotFoundException_ - In case that the command specified wasn't found.
