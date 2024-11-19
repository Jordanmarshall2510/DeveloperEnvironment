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

# Get device object from string
$getDevices = Get-PnpDevice -FriendlyName $deviceName

# Get devices on specific NUMA node
$getDevicesOnNode = $getDevices | Get-PnpDeviceProperty -KeyName "DEVPKEY_Device_Numa_Node" | Where-Object {$_.Data -eq 0}

# Enable selected devices
if($enable)
{
    $getDevicesOnNode | Enable-PnpDevice
    "Enabled $deviceName with NUMA node $numaNode."
    exit
}

# Disable selected devices
if ($disable) 
{
    $getDevicesOnNode | Disable-PnpDevice
    "Disabled $deviceName with NUMA node $numaNode."
    exit
}
