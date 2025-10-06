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

# Get OS information
Write-Output "OS Information"
$osInformation = Get-CimInstance -ClassName Win32_OperatingSystem -ErrorAction Stop
$parsedOsInformation = $osInformation | Format-Table Caption, BuildNumber -autosize
Write-Output $parsedOsInformation

# Get CPU information
Write-Output "CPU Information"
$cpuInformation = Get-CimInstance -Class CIM_Processor -ErrorAction Stop
$parsedCpuInformation = $cpuInformation | Format-Table DeviceID, Name, NumberOfCores, NumberOfLogicalProcessors, ThreadCount -autosize
Write-Output $parsedCpuInformation

# Get RAM information
Write-Output "RAM Information `n"
$ramSpeed = (Get-CimInstance -ClassName Win32_PhysicalMemory -ErrorAction Stop | Measure-Object -Property Speed -Minimum).Minimum
$ramCount= (Get-CimInstance -ClassName Win32_PhysicalMemory -ErrorAction Stop | Measure-Object -Property Capacity -Sum).Count
$ramCapacity = (Get-CimInstance -ClassName Win32_PhysicalMemory -ErrorAction Stop | Measure-Object -Property Capacity -Sum).Sum/1GB
Write-Output "RAM Speed: $ramSpeed MHz"
Write-Output "RAM Populated: $ramCount"
Write-Output "Total RAM Capacity: $ramCapacity GB"

$ramInformation = Get-CimInstance Win32_PhysicalMemory -ErrorAction Stop
$parsedRamInformation = $ramInformation | Format-Table Speed, ConfiguredClockSpeed, @{n="Capacity (GB)"; e={[math]::Round($_.Capacity/1GB, 2)}} -autosize
Write-Output $parsedRamInformation

# Get Disk information
Write-Output "Disk Information"
$diskInformation = Get-PhysicalDisk -ErrorAction Stop
$parsedDiskInformation = $diskInformation | Format-Table FriendlyName, MediaType, @{n="Size (GB)"; e={[math]::Round($_.Size/1GB, 2)}} -autosize
Write-Output $parsedDiskInformation

# Get Network Adapter information
Write-Output "Network Adapter Information"
$networkAdapterInformation = Get-CimInstance -ClassName Win32_NetworkAdapterConfiguration -ErrorAction Stop
$parsedNetworkAdapterInformation = $networkAdapterInformation | Format-Table Description, Index -autosize
Write-Output $parsedNetworkAdapterInformation

# Stop transcript
Stop-Transcript
