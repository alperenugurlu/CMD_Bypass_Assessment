# Helper function to write output to console and to a file
function Write-OutputAndFile {
    param (
        [Parameter(Mandatory=$true)]
        [string]$Message,
        [Parameter(Mandatory=$true)]
        [string]$FilePath
    )
    Write-Host $Message
    Add-Content $FilePath $Message
}

# Header Information
Write-Host "CMD Bypass Method Analysis"
Write-Host " "
Write-Host "Developed by Alperen Ugurlu"
Write-Host " "
$link = "https://www.linkedin.com/in/alperen-ugurlu-7b57b7178/"
Write-Host "Link: $link"

# Define the commands to be tested.
$commands = @(
    @{ Name = "Check CMD Restriction"; Command = "reg query HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\System /v DisableCMD" },
    @{ Name = "Disable CMD Restriction"; Command = "reg add HKCU\Software\Policies\Microsoft\Windows\System /v DisableCMD /t REG_DWORD /d 0 /f" },
    @{ Name = "PowerShell Bypass"; Command = "powershell.exe -ExecutionPolicy Bypass -File bypass.ps1" },
    @{ Name = "HKCU Bypass"; Command = "reg add HKCU\Software\Policies\Microsoft\Windows\System /v DisableCMD /t REG_DWORD /d 0 /f" },
    @{ Name = "/k Bypass"; Command = "cmd.exe /k whoami & exit" },
    @{ Name = "/c Bypass"; Command = "cmd.exe /c pause" },
    @{ Name = "Registry Enumeration"; Command = "reg query HKEY_CURRENT_USER\Software\*" },
    @{ Name = "System Information"; Command = "(systeminfo | Out-String)" },
    @{ Name = "Process List"; Command = "(Get-Process | Out-String)" },
    @{ Name = "Check IP Configuration"; Command = "(Get-NetIPConfiguration | Out-String)" },
    @{ Name = "Check Network Connections"; Command = "(Get-NetTCPConnection | Out-String)" }
)

# Specify the output file for the test results
$outFile = "output.txt"

# Initialize the success score
$score = 0

# Calculate the total number of commands
$total = $commands.Count

# If the output file already exists, delete it
if (Test-Path $outFile) {
    Remove-Item $outFile
}

# Loop through each command
foreach ($cmd in $commands) {
    $command = $cmd.Command
    $name = $cmd.Name
    try {
        # Display the name of the command
        Write-Host "`nRunning: $name"

        # Execute the command and capture the output
        $output = Invoke-Expression $command

        # Check the exit code
        if ($LASTEXITCODE -eq 0) {
            # If successful, increment the score
            $status = "PASSED"
            $score += 1
        } else {
            # If the exit code is not 0, consider it a failure
            $status = "FAILED"
        }

        Write-OutputAndFile -Message "`nRunning: $name`nCommand: $command`nOutput: $output`nReturn code: $LASTEXITCODE`nStatus: $status`n" -FilePath $outFile

    } catch {
        # In case of an error, save the results
        Write-OutputAndFile -Message "`nRunning: $name`nCommand: $command`nOutput: $_`nReturn code: $LASTEXITCODE`nStatus: FAILED`n" -FilePath $outFile
    }
}

# Calculate the success score percentage
$scorePercentage = ($score / $total) * 100

# Display and save the success score
Write-OutputAndFile -Message "`nTotal Score: $scorePercentage% ($score out of $total commands passed)" -FilePath $outFile

# Provide security recommendations based on the success score
if ($scorePercentage -lt 50) {
    Write-OutputAndFile -Message "Security recommendation: Further hardening is required." -FilePath $outFile
} elseif ($scorePercentage -lt 80) {
    Write-OutputAndFile -Message "Security recommendation: Some hardening measures can be improved." -FilePath $outFile
} else {
    Write-OutputAndFile -Message "Security recommendation: The system is sufficiently hardened." -FilePath $outFile
}
