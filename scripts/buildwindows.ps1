$SCRIPTDIR = $PSScriptRoot
$PARENTDIR = (Get-Item $SCRIPTDIR ).parent.FullName
$WINDOWSDIR = "${PARENTDIR}\windows"
$BUILDDIR = "$($PARENTDIR)\build\windows"
$BUILDDIR64 = "$($BUILDDIR)\x64"
if (-Not (Test-Path "$($BUILDDIR)" -PathType Container))
{
  New-Item "$($BUILDDIR)" -ItemType Directory
  if (-Not (Test-Path "$($BUILDDIR)" -PathType Container))
  {
    $global:LASTEXITCODE = 255
  }
}
if (-Not (Test-Path "$($BUILDDIR64)" -PathType Container))
{
  New-Item "$($BUILDDIR64)" -ItemType Directory
  if (-Not (Test-Path "$($BUILDDIR64)" -PathType Container))
  {
    $global:LASTEXITCODE = 254
  }
}
Set-Location "$WINDOWSDIR"
MSBuild /p:Configuration=Release /p:Platform=x64
if (-Not (Test-Path "$($WINDOWSDIR)\x64\Release\rgbdiff.exe" -PathType Leaf))
{
  $global:LASTEXITCODE = 253
}
Move-Item -Path "$($WINDOWSDIR)\x64\Release\rgbdiff.exe" "$($BUILDDIR64)\rgbdiff.exe"
Set-Location "$PARENTDIR"

