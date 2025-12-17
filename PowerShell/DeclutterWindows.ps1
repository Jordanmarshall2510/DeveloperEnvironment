#Requires -RunAsAdministrator

$appsToRemove = @(
    "Microsoft.BingWeather",
    "Clipchamp.Clipchamp",
    "Microsoft.Microsoft3DViewer",
    "Microsoft.MicrosoftOfficeHub",
    "Microsoft.MicrosoftSolitaireCollection",
    "Microsoft.People",
    "Microsoft.SkypeApp",
    "Microsoft.WindowsAlarms",
    "Microsoft.WindowsCamera",
    "Microsoft.WindowsMaps",
    "Microsoft.WindowsSoundRecorder",
    "Microsoft.Xbox.TCUI",
    "Microsoft.XboxApp",
    "Microsoft.ZuneMusic",
    "Microsoft.BingNews",
    "Microsoft.BingSearch",
    "Microsoft.ZuneVideo",
    "Microsoft.MixedReality.Portal",
    "Microsoft.Edge.GameAssist",
    "Microsoft.YourPhone",
    "Microsoft.XboxGameOverlay",
    "Microsoft.XboxGamingOverlay",
    "Microsoft.XboxIdentityProvider",
    "Microsoft.XboxSpeechToTextOverlay",
    "MSTeams"
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

# Get all provisioned packages
$provisionedPackages = Get-AppxProvisionedPackage -Online

# Loop through each app to remove
foreach ($app in $appsToRemove)
{
    # Check if the app is installed
    $package = $provisionedPackages | Where-Object { $_.PackageName -like "*$app*" }
    
    if ($package)
    {
        Write-Output "Removing $($package.PackageName)..."
        try
        {
            Remove-AppxProvisionedPackage -Online -PackageName $package.PackageName -ErrorAction Stop
            Write-Output "Successfully removed $($package.PackageName)" -ForegroundColor Green
        }
        catch
        {
            Write-Output "Failed to remove $($package.PackageName): $_" -ForegroundColor Red
            Set-Location $currentDirectory
            exit
        }
    }
    else
    {
        Write-Output "App $app not found as provisioned package" -ForegroundColor Yellow
    }
}

# Stop transcript
Stop-Transcript

Set-Location $currentDirectory

