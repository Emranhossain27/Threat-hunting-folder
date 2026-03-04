<#
.SYNOPSIS
    This PowerShell script prevents Web publishing and online ordering wizards from downloading a list of providers.

.NOTES
    Author          : Emran Hossain
    LinkedIn        : https://www.linkedin.com/in/emranhossain278/
    GitHub          : https://github.com/Emranhossain27
    Date Created    : 03-04-2026
    Last Modified   : 03-04-2026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000105

.TESTED ON
    Date(s) Tested  : 03-04-2026
    Tested By       : Emran Hossain
    Systems Tested  : Windows
    PowerShell Ver. :

.USAGE
    Run this script in an elevated PowerShell session (as Administrator).

    Example syntax:
    PS C:\> .\remediation_template(STIG-ID-WN10-CC-000105).ps1
#>

# YOUR CODE GOES HERE
# Run this script in an elevated PowerShell session (as Administrator)

$path = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer"
$name = "NoWebServices"
$value = 1

# Ensure the registry path exists
if (-not (Test-Path $path)) {
    New-Item -Path $path -Force | Out-Null
}

# Set the DWORD value
New-ItemProperty -Path $path -Name $name -Value $value -PropertyType DWord -Force | Out-Null

Write-Output "Registry key set: $path\$name = $value (DWORD)"
Write-Output "Internet download for Web publishing and online ordering wizards has been disabled."
