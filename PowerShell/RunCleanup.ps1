#Requires -RunAsAdministrator

# Check if temp folder exists
$tempFolder = 'C:\Temp'
$scriptName = [System.IO.Path]::GetFileNameWithoutExtension($MyInvocation.MyCommand.Name)
$dateTime = Get-Date -Format "yyyy-MM-dd_HH-mm"
$logFileName = "$scriptName`_$dateTime.log"

if (-not(Test-Path -Path $tempFolder)) 
{
    Write-Output "Creating $tempFolder directory"
    New-Item -path $tempFolder -ItemType Directory
}

# Start transcript
Start-Transcript -Path "$tempFolder\$logFileName"

$currentDirectory = Get-Location
# Cleanup Bin
$recycleBinPath = 'C:\$Recycle.Bin'
# Exclude .ini files from deletion in the recycle bin to avoid removing system or configuration files that may be needed for proper functioning.
Get-ChildItem $recycleBinPath -Force -Recurse -ErrorAction SilentlyContinue | Remove-Item -Recurse -Exclude *.ini -ErrorAction SilentlyContinue
Write-Output "All the necessary data removed from recycle bin successfully" -ForegroundColor Green

# Cleanup Temp folders
$windowsTempPath = 'C:\Windows\Temp' 
Get-ChildItem $windowsTempPath -Force -Recurse -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
Write-Output "All the necessary data removed from Windows Temp folder successfully" -ForegroundColor Green

# Cleanup Prefetch folder
$prefetchPath = 'C:\Windows\Prefetch'
Get-ChildItem $prefetchPath -Force -Recurse -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
Write-Output "All the necessary data removed from Prefetch folder successfully" -ForegroundColor Green

# Cleanup User Temp folders
$userTempPath = 'C:\Users\*\AppData\Local\Temp' 
Get-ChildItem $userTempPath -Force -Recurse -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
Write-Output "All the necessary data removed from User Temp folders successfully" -ForegroundColor Green

# Set location back to previous location
Set-Location $currentDirectory

# Stop transcript
Stop-Transcript