$SCRIPTDIR = $PSScriptRoot
$PARENTDIR = (Get-Item $SCRIPTDIR ).parent.FullName
$WINDOWSDIR = "${PARENTDIR}\windows"
$BUILDDIR = "$($PARENTDIR)\build\windows"
"Checking if the Windows build directory exists..."
if (-Not (Test-Path "$($BUILDDIR)" -PathType Container))
{
  "Windows build directory does not exists, attempting to create..."
  New-Item "$($BUILDDIR)" -ItemType Directory
  if (-Not (Test-Path "$($BUILDDIR)" -PathType Container))
  {
    Write-Error "Could not create the Linux build directory for and unknown reason...`nExiting."
    $global:LASTEXITCODE = 255
  }
}
Set-Location "$WINDOWSDIR"
MSBuild /p:Configuration=Release /p:Platform=x64
if (-Not (Test-Path "$($WINDOWSDIR)\x64\Release\rgbdiff.exe" -PathType Leaf))
{
   Write-Error "Could not build the main program for an unknown reason...`nExiting."
  $global:LASTEXITCODE = 254
}
Set-Location "$PARENTDIR"
"Attempting to move the program to the project build directory..."
Move-Item -Path "$($WINDOWSDIR)\x64\Release\rgbdiff.exe" "$($BUILDDIR)\rgbdiff.exe" -Force
if (-Not (Test-Path "$($BUILDDIR)\rgbdiff.exe" -PathType Leaf))
{
   Write-Error "Could not move the program to the project build directory...`nExiting."
  $global:LASTEXITCODE = 253
}