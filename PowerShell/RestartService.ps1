param
(
    [Parameter(Mandatory=$true)]
    [string] $serviceName = ""
)

$serviceInfo = Get-Service -Name $serviceName

# Check if service exists
if ($null -eq $serviceInfo)
{
    Write-Error "$serviceName does not exist."
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
    exit
}
