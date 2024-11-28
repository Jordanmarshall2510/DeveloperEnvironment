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

# Installs latest Window updates
Write-Output "Installing latest Windows updates..."

# Check if module is installed, if not install module
if ($null -eq (Get-Module -ListAvailable -Name PSWindowsUpdate))
{
    Write-Output "Installing PSWindowsUpdate module"
    Install-Module PSWindowsUpdate
} 

Import-Module PSWindowsUpdate
Get-WindowsUpdate -verbose | Install-WindowsUpdate -verbose

# Update git
Write-Output "Installing latest git updates..."
git update-git-for-windows

# Use winget to update applications on Windows
Write-Output "Installing latest application updates..."
winget update --all --verbose

# Stop transcript
Stop-Transcript
