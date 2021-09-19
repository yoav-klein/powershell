
. ./Native-Command.ps1

# Uncomment this to see the behaviour when you're not catching the exception throw
#Invoke-NativeApplication -ScriptBlock { cmd /c "echo message1 & echo message2 & echo error3 1>&2 & echo error4 1>&2 & echo message5 & exit 1" }


try {
    Invoke-NativeApplication -ScriptBlock { cmd /c "echo message1 & echo message2 & echo error3 1>&2 & echo error4 1>&2 & echo message5 & exit 1" }
} catch {
    echo "Message"
    echo "$_"
    echo "Exit code"
    echo $_.Exception.ProcessInfo.ExitCode
    echo "Stdout"
    echo $_.Exception.ProcessInfo.Stdout
    echo "Stderr"
    echo $_.Exception.ProcessInfo.Stderr
}

 try {
     Invoke-NativeApplication -ScriptBlock { git commits } 
 } catch {
     echo "Message"
     echo "$_"
     echo "Exit code"
     echo $_.Exception.ProcessInfo.ExitCode
     echo "Stdout"
     echo $_.Exception.ProcessInfo.Stdout
     echo "Stderr"
     echo $_.Exception.ProcessInfo.Stderr
 }