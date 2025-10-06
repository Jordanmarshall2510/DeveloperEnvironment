param
(
    [Parameter(Mandatory=$true)]
    [ValidateRange(1, 31)]
    [int] $day,

    [Parameter(Mandatory=$true)]
    [ValidateRange(1, 12)]
    [int] $month,

    [Parameter(Mandatory=$true)]
    [ValidateRange(1964, [int]::MaxValue)]
    [int] $year,

    [Parameter(Mandatory=$true)]
    [ValidateRange(0, 23)]
    [int] $hours,

    [Parameter(Mandatory=$true)]
    [ValidateRange(0, 59)]
    [int] $minutes,

    [Parameter(Mandatory=$true)]
    [ValidateRange(0, 59)]
    [int] $seconds
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

$timePeriod = if ($hours -le 12) {"AM"} else {"PM"}

$dateTime = "{0}/{1}/{2} {3}:{4}:{5} {6}" -f $month, $day, $year, $hours, $minutes, $seconds, $timePeriod
$rc = Set-Date $dateTime

if($null -eq $rc)
{
    Write-Error "Failed to set date and time: $rc"
    Stop-Transcript
    exit
}

$getDateTime = Get-Date
Write-Output "Set date and time: $getDateTime"

# Stop transcript
Stop-Transcript
