#Requires -RunAsAdministrator

param
(
    [Parameter(Mandatory=$true)]
    [string] $vmName = ""
)

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

# Check if VM exists
$vm = Get-VM -Name $vmName -ErrorAction SilentlyContinue
$vmHardDisk = Get-VMHardDiskDrive -VMName $vmName -ErrorAction SilentlyContinue

if ($null -eq $vm)
{
    Write-Output "VM $vmName does not exist"
    Set-Location $currentDirectory
    Stop-Transcript
    exit
}

# Check if VM is running, if so stop the VM
if ('Running' -eq $vm.State)
{
    Write-Output "Stopping VM $vmName"
    Stop-VM -Name $vmName -Force
}

# Delete VM
Write-Output "Deleting VM $vmName"
Remove-VM -Name $vmName -Force

# Delete virtual hard disks
if (Test-Path -Path $vmHardDisk.Path)
{
    Remove-Item -Path $vmHardDisk.Path -Force
    Write-Output "Deleted virtual hard disk $($vmHardDisk.Path)"
}

# Set location back to previous location
Set-Location $currentDirectory

# Stop transcript
Stop-Transcript