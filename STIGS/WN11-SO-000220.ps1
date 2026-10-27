<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Josh Madakor
    LinkedIn        : linkedin.com/in/joshmadakor/
    GitHub          : github.com/joshmadakor1
    Date Created    : 2024-09-09
    Last Modified   : 2024-09-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-AU-000500
    Documentation   : https://stigaview.com/products/win11/v2r7/WN11-AU-000500/

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000500).ps1 
#>

$RegistryPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0"
$ExpectedValue = 537395200

try {
    $ActualValue = Get-ItemPropertyValue `
        -Path $RegistryPath `
        -Name "NTLMMinServerSec" `
        -ErrorAction Stop

    if ($ActualValue -eq $ExpectedValue) {
        Write-Host "PASS: WN11-SO-000220 is configured correctly." -ForegroundColor Green
    }
    else {
        Write-Host "FAIL: WN11-SO-000220 is incorrectly configured." -ForegroundColor Red
        Write-Host "Expected: $ExpectedValue"
        Write-Host "Actual: $ActualValue"
    }
}
catch {
    Write-Host "FAIL: Required registry value does not exist or cannot be read." -ForegroundColor Red
}
