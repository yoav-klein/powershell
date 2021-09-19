
$ErrorActionPreference = "Continue"
function exec1
{
    param
    (
        [ScriptBlock] $ScriptBlock,
        [string] $StderrPrefix = "Error: ",
        [int[]] $AllowedExitCodes = @(0)
    )
 
    $backupErrorActionPreference = $script:ErrorActionPreference
 
    $script:ErrorActionPreference = "Continue"
    try
    {
        & $ScriptBlock 2>&1 | ForEach-Object -Process {
                if ($_ -is [System.Management.Automation.ErrorRecord])
                {
                    "$StderrPrefix$_"
                }
                else
                {
                    "$_"
                }
            }
        if ($AllowedExitCodes -notcontains $LASTEXITCODE)
        {
            throw "Execution failed with exit code $LASTEXITCODE"
        }
    }
    finally
    {
        $script:ErrorActionPreference = $backupErrorActionPreference
    }
}


function exec2
{
    param
    (
        [ScriptBlock] $ScriptBlock,
        [string] $StderrPrefix = "Error: ",
        [int[]] $AllowedExitCodes = @(0)
    )
 
    $backupErrorActionPreference = $script:ErrorActionPreference
 
    $script:ErrorActionPreference = "Continue"
    try
    {
        echo "Exec2"
        & $ScriptBlock
        if ($AllowedExitCodes -notcontains $LASTEXITCODE)
        {
            throw "Execution failed with exit code $LASTEXITCODE"
        }
    }
    finally
    {
        $script:ErrorActionPreference = $backupErrorActionPreference
    }
}


try { 
    $res = exec1 { cmd /c "echo STDOUT & echo STDERR 1>&2 & exit 1" } -StderrPrefix "ERR:"
    #$res
}
catch {
    echo "ohhh.."
}

echo "After all"

# function Invoke-NativeApplication
# {
#     param
#     (
#         [ScriptBlock] $ScriptBlock,
#         [int[]] $AllowedExitCodes = @(0)
#     )
  
#     $backupErrorActionPreference = $ErrorActionPreference
  
#     $ErrorActionPreference = "Continue"
#     try
#     {
#         & $ScriptBlock 2>&1 | ForEach-Object -Process `
#             {
#                 $isError = $_ -is [System.Management.Automation.ErrorRecord]
#                 "$_" | Add-Member -Name IsError -MemberType NoteProperty -Value $isError -PassThru
#             }
#         if ($AllowedExitCodes -notcontains $LASTEXITCODE)
#         {
#             throw "Execution failed with exit code $LASTEXITCODE"
#         }
#     }
#     finally
#     {
#         $ErrorActionPreference = $backupErrorActionPreference
#     }
# }

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


echo "here"

Invoke-NativeApplication -ScriptBlock { cmd /c "echo message1 & echo message2 & echo error3 1>&2 & echo error4 1>&2 & echo message5 & exit 1" }
# $result | ForEach-Object -Process `
# {
#     if ($_.IsError)
#     {
#         Write-Host -Object "Error: $_" -ForegroundColor Red
#     }
#     else
#     {
#         Write-Host -Object $_ -ForegroundColor Green
#     }
# }
