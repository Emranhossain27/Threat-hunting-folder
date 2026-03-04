<#
.SYNOPSIS
    This PowerShell script disables the SMBv1 protocol on the SMB server by configuring the required registry value.

.NOTES
    Author          : Emran Hossain
    LinkedIn        : https://www.linkedin.com/in/emranhossain278/
    GitHub          : https://github.com/Emranhossain27
    Date Created    : 03-04-2026
    Last Modified   : 03-04-2026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-00-000165

.TESTED ON
    Date(s) Tested  : 03-04-2026
    Tested By       : Emran Hossain
    Systems Tested  : Windows
    PowerShell Ver. : 

.USAGE
    Run this script in an elevated PowerShell session (as Administrator).

    Example syntax:
    PS C:\> .\remediation_template(STIG-ID-WN10-00-000165).ps1
#>

# YOUR CODE GOES HERE
# Run this script in an elevated PowerShell session (as Administrator)

$path = "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters"
$name = "SMB1"
$value = 0

# Ensure the registry path exists
if (-not (Test-Path $path)) {
    New-Item -Path $path -Force | Out-Null
}

# Set the DWORD value
New-ItemProperty -Path $path -Name $name -Value $value -PropertyType DWord -Force | Out-Null

Write-Output "Registry key set: $path\$name = $value (DWORD)"
Write-Output "SMBv1 protocol has been disabled on the SMB server. A system restart may be required."
