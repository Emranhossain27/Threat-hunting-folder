
<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Emran Hossain
    LinkedIn        : https://www.linkedin.com/in/emranhossain278/
    GitHub          : https://github.com/Emranhossain27
    Date Created    : 11-05-2025
    Last Modified   : 11-05-2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000365

.TESTED ON
    Date(s) Tested  : 11-05-2025
    Tested By       : Emran Hossain
    Systems Tested  : Windows
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000365).ps1 
#>

# YOUR CODE GOES HERE
# Ensure script runs as Administrator
# (Right-click PowerShell → "Run as Administrator" before executing)

# WN10-CC-000365  |  Prevent Windows apps from being activated by voice while locked
# Severity: Medium
# Must be run as Administrator

# Define registry path
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy"

# 1️⃣ Create the registry key if it doesn't exist
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
    Write-Host "Created registry path: $RegPath"
}

# 2️⃣ Apply required settings
# This disables Windows voice activation above the lock screen
# per STIG: LetAppsActivateWithVoiceAboveLock = 2

Set-ItemProperty -Path $RegPath -Name "LetAppsActivateWithVoiceAboveLock" -Type DWord -Value 2

# 3️⃣ Optional check: if LetAppsActivateWithVoice = 2, the above setting is NA
# You can still include it for completeness:
# Set-ItemProperty -Path $RegPath -Name "LetAppsActivateWithVoice" -Type DWord -Value 2

# 4️⃣ Verify results
$Result = Get-ItemProperty -Path $RegPath | Select-Object LetAppsActivateWithVoiceAboveLock, LetAppsActivateWithVoice
Write-Host "`nVerification:`n" ($Result | Format-List | Out-String)

# 5️⃣ Refresh group policy (optional)
gpupdate /force

Write-Host "`n✅ STIG WN10-CC-000365 applied successfully.`n"

