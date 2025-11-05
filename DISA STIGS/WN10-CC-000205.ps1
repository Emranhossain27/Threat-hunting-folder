
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
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 11-05-2025
    Tested By       : Emran Hossain
    Systems Tested  : Windows
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000205).ps1 
#>

# YOUR CODE GOES HERE
# Ensure script runs as Administrator
# (Right-click PowerShell → "Run as Administrator" before executing)

# Define the registry path
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"

# 1️⃣  Create the key if it does not exist
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
    Write-Host "Created registry path: $RegPath"
}

# 2️⃣  Create or update the AllowTelemetry value
# ----- Choose ONE of the following lines -----
# Set to Security (0)
Set-ItemProperty -Path $RegPath -Name "AllowTelemetry" -Type DWord -Value 0
# Set to Basic (1)
# Set-ItemProperty -Path $RegPath -Name "AllowTelemetry" -Type DWord -Value 1

Write-Host "AllowTelemetry value has been set."

# 3️⃣  Verify the change
$Result = Get-ItemProperty -Path $RegPath -Name "AllowTelemetry"
Write-Host "`nVerification:`n" $Result

# 4️⃣  (Optional) Force policy refresh immediately
gpupdate /force
