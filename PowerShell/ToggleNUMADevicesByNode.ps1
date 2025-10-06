param 
(
    [Parameter(Mandatory=$true)]
    [string] $deviceName,

    [Parameter(Mandatory=$true)]
    [int] $numaNode,

    [Parameter()]
    [switch] $enable,

    [Parameter()]
    [switch] $disable
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

# Get device object from string
$getDevices = Get-PnpDevice -FriendlyName $deviceName

# Get devices on specific NUMA node
$getDevicesOnNode = $getDevices | Get-PnpDeviceProperty -KeyName "DEVPKEY_Device_Numa_Node" | Where-Object {$_.Data -eq 0}

# Enable selected devices
if($enable)
{
    $getDevicesOnNode | Enable-PnpDevice
    Write-Output "Enabled $deviceName with NUMA node $numaNode."
    Stop-Transcript
    exit
}

# Disable selected devices
if ($disable) 
{
    $getDevicesOnNode | Disable-PnpDevice
    Write-Output "Disabled $deviceName with NUMA node $numaNode."
    Stop-Transcript
    exit
}
