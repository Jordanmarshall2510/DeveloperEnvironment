param
(
    [Parameter()]
    [string] $parentDirectory = ""
)

# Check if temp folder exists
$tempFolder = 'C:\Temp'
if (-not(Test-Path -Path $tempFolder)) 
{
    Write-Output "Creating $tempFolder directory"
    New-Item -path $tempFolder -ItemType Directory
}

# Start transcript
Start-Transcript -Path $tempFolder

$currentDirectory = Get-Location

# Check if user defined a different path to current path
if ($parentDirectory -ne "")
{
    Set-Location $parentDirectory
}
else
{
    $parentDirectory = $currentDirectory
}

# Get all folders in parent path
$childDirectories = Get-ChildItem $parentDirectory -Directory

if ($childDirectories)
{
    # Create empty table for data
    $table = @()

    ForEach ($child in $childDirectories)
    {
        # Set location to child folder
        Set-Location $child.FullName

        # Get commit ID from within folder
        $commitId = & git rev-parse HEAD

        # Add full path and commit ID to table
        $table += [pscustomobject]@{Directory = $child.FullName; CommitID = $commitId}

        # Return to parent directory
        Set-Location $parentDirectory
    }
}

Write-Output $table

# Set location back to previous location
Set-Location $currentDirectory

# Stop transcript
Stop-Transcript
