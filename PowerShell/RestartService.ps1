param
(
    [Parameter(Mandatory=$true)]
    [string] $serviceName = ""
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

$serviceInfo = Get-Service -Name $serviceName

# Check if service exists
if ($null -eq $serviceInfo)
{
    Write-Error "$serviceName does not exist."
    Stop-Transcript
    exit
}

if ($serviceInfo.Status -eq "Running")
{
    # If service is running, then stop and start service
    Stop-Service -Name $serviceName
    Start-Service -Name $serviceName

}
else {
    # If service is stopped, then only start service
    Start-Service -Name $serviceName
}

# Check if service is running after restart
$serviceInfo = Get-Service -Name $serviceName

if ($serviceInfo.Status -ne "Running")
{
    Write-Error "$serviceName failed to restart."
    Stop-Transcript
    exit
}

# Stop transcript
Stop-Transcript
