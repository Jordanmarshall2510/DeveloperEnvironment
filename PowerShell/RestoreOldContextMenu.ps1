#Requires -RunAsAdministrator

# Check if temp folder exists
$tempFolder = 'C:\Temp'
if (-not(Test-Path -Path $tempFolder)) 
{
    Write-Output "Creating $tempFolder directory"
    New-Item -path $tempFolder -ItemType Directory
}

# Start transcript
Start-Transcript -Path $tempFolder

# Restore old context menu by creating registry key
$keyPath = "HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32"
if (-not (Test-Path $keyPath)) {
    New-Item -Path $keyPath -Value "" -Force
    Write-Output "Restored old context menu."
}
else {
    Write-Output "Old context menu is already restored."
}

# Stop transcript
Stop-Transcript