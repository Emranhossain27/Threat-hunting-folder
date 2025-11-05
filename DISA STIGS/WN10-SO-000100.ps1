
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
    STIG-ID         : WN10-SO-000100

.TESTED ON
    Date(s) Tested  : 11-05-2025
    Tested By       : Emran Hossain
    Systems Tested  : Windows
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(WN10-SO-000100).ps1 
#>

# YOUR CODE GOES HERE
# Ensure script runs as Administrator
# (Right-click PowerShell → "Run as Administrator" before executing)

# WN10-SO-000100  |  Require SMB client packet signing
# Severity: Medium
# Must be run as Administrator

$RegPath = "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters"
$ValueName = "RequireSecuritySignature"
$ExpectedValue = 1

# 1️⃣  Ensure the path exists
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
    Write-Host "Created registry path: $RegPath"
}

# 2️⃣  Create or update the value
Set-ItemProperty -Path $RegPath -Name $ValueName -Type DWord -Value $ExpectedValue
Write-Host "Configured $ValueName to $ExpectedValue (SMB signing required)."

# 3️⃣  Verify configuration
$Current = (Get-ItemProperty -Path $RegPath -Name $ValueName).$ValueName
if ($Current -eq $ExpectedValue) {
    Write-Host "`n✅ STIG WN10-SO-000100: Compliant (RequireSecuritySignature = 1)`n"
} else {
    Write-Host "`n❌ STIG WN10-SO-000100: NON-COMPLIANT (Current value = $Current)`n"
}

# 4️⃣  Optional: refresh group policy
gpupdate /force
