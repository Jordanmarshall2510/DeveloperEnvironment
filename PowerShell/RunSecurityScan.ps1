param
(
    [Parameter()]
    [ValidateSet("QuickScan", "FullScan", "CustomScan")]
    [string] $scanType = "QuickScan"
)

# Check if temp folder exists
$tempFolder = 'C:\Temp'
if (-not(Test-Path -Path $tempFolder)) 
{
    Write-Output "Creating $tempFolder directory"
    New-Item -path $tempFolder -ItemType Directory
}

# Start transcript
Start-Transcript -Path $tempFolder

$currentDirectory = Get-Location

$scan = Start-MpScan -ScanType $scanType -AsJob
Write-Output "Security scan started..."

while ($scan.State -eq 'Running') {
    Write-Output "Scan in progress..." -NoNewline
    Start-Sleep -Seconds 5
    Write-Output "`r" -NoNewline
}

if ($scan.State -eq 'Completed') {
    Write-Output "Scan completed successfully."
} else {
    Write-Error "Scan ended with state: $($scan.State)"
    Write-Error "Scan details: $($scan | Format-List | Out-String)"
}

# Set location back to previous location
Set-Location $currentDirectory

# Stop transcript
Stop-Transcript