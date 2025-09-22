
<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Emran Hossain
    LinkedIn        : https://www.linkedin.com/in/emranhossain278/
    GitHub          : https://github.com/Emranhossain27
    Date Created    : 09-22-2025
    Last Modified   : 09-22-2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 09-22-2025
    Tested By       : Emran Hossain
    Systems Tested  : Windows
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000500).ps1 
#>

# YOUR CODE GOES HERE
# Run this script in an elevated PowerShell session (as Administrator)

$path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
$name = "MaxSize"
$value = 0x8000  # hex 8000 = 32768 decimal

# Ensure the registry path exists
if (-not (Test-Path $path)) {
    New-Item -Path $path -Force | Out-Null
}

# Set the DWORD value
New-ItemProperty -Path $path -Name $name -Value $value -PropertyType DWord -Force | Out-Null

Write-Output "Registry key set: $path\$name = $value (DWORD)"
