

function Invoke-NativeApplication
{
    param
    (
        [ScriptBlock] $ScriptBlock,
        [int[]] $AllowedExitCodes = @(0),
        [switch]$IgnoreExitCode
    )
  
    $backupErrorActionPreference = $ErrorActionPreference
    $ErrorActionPreference = "Continue"
    try
    {
        & $ScriptBlock 2>&1 | ForEach-Object -Process `
            {
                $isError = 
                $_ -is [System.Management.Automation.ErrorRecord]
                if($isError) {
                    Write-Host "STDERR: $_" -ForegroundColor Red
                }
                else {
                    "$_"
                }
            }
        if (($AllowedExitCodes -notcontains $LASTEXITCODE) -and (-not $IgnoreExitCode))
        {
            echo "$($MyInvocation.ScriptName): Failed in $($MyInvocation.ScriptLineNumber)"
            throw "Execution failed with exit code $LASTEXITCODE"
        }
    }
    finally
    {
        $ErrorActionPreference = $backupErrorActionPreference
    }
}

Invoke-NativeApplication -ScriptBlock { cmd /c "echo message1 & echo message2 & echo error3 1>&2 & echo error4 1>&2 & echo message5 & exit 1" }
