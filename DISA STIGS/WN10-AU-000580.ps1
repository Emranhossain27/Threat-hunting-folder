<#
.SYNOPSIS
    This PowerShell script configures Windows to audit MPSSVC Rule-Level Policy Change failures.

.NOTES
    Author          : Emran Hossain
    LinkedIn        : https://www.linkedin.com/in/emranhossain278/
    GitHub          : https://github.com/Emranhossain27
    Date Created    : 03-04-2026
    Last Modified   : 03-04-2026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000580

.TESTED ON
    Date(s) Tested  : 03-04-2026
    Tested By       : Emran Hossain
    Systems Tested  : Windows
    PowerShell Ver. :

.USAGE
    Run this script in an elevated PowerShell session (as Administrator).
    Example syntax:
    PS C:\> .\remediation_template(STIG-ID-WN10-AU-000580).ps1
#>

# YOUR CODE GOES HERE
# Run this script in an elevated PowerShell session (as Administrator)

$subcategory = "MPSSVC Rule-Level Policy Change"

# Enable failure auditing for the specified subcategory
auditpol /set /subcategory:"$subcategory" /failure:enable

Write-Output "Audit policy configured: $subcategory - Failure auditing enabled."
