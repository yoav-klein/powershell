
class ProcessInfo {
    [int]$ExitCode;
    [string[]]$Stdout;
    [string[]]$Stderr;

    ProcessInfo($ExitCode, $Stdout, $Stderr) {
        $this.ExitCode = $ExitCode
        $this.Stdout = $Stdout
        $this.Stderr = $Stderr
    }
}

class NativeCommandException : Exception {
    [ProcessInfo]$ProcessInfo
    
    NativeCommandException($Message, $ProcessInfo) : base($Message) {
        $this.ProcessInfo = $ProcessInfo
    }
}

function Invoke-NativeCommand
{
    param
    (
        [ScriptBlock] $ScriptBlock,
        [int[]] $AllowedExitCodes = @(0),
        [switch]$IgnoreExitCode
    )
    
    # Setting ErrorActionPreference to Continue so that piping STDERR to STDOUT won't throw an exception in 
    # case of ErrorAction=Stop
    $ErrorActionPreference = "Continue"
    try {
        $AllOutput = & $ScriptBlock 2>&1
        
        $Stdout = $AllOutput | ?{ $_ -isnot [System.Management.Automation.ErrorRecord]}
        $Stderr = $AllOutput | ?{ $_ -is [System.Management.Automation.ErrorRecord]}

        $ProcessInfo = [ProcessInfo]::new($LastExitCode, $Stdout, $Stderr)
        if (($AllowedExitCodes -notcontains $LASTEXITCODE) -and (-not $IgnoreExitCode))
        {
            throw [NativeCommandException]::new(
                "$($MyInvocation.ScriptName): Failed in Line $($MyInvocation.ScriptLineNumber)", $ProcessInfo)
        }
        else {
            return $ProcessInfo
        }
    }
    catch [System.Management.Automation.CommandNotFoundException] {
        throw
    }
}

