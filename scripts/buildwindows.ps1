$SCRIPTDIR = $PSScriptRoot
$PARENTDIR = (Get-Item $SCRIPTDIR ).parent.FullName
$WINDOWSDIR = "${PARENTDIR}\windows"
$BUILDDIR = "$($PARENTDIR)\build\windows"
# $BUILDDIR86 = "$($BUILDDIR)\x86"
$BUILDDIR64 = "$($BUILDDIR)\x64"
if (-Not (Test-Path "$($BUILDDIR)" -PathType Container))
{
  New-Item "$($BUILDDIR)" -ItemType Directory
  if (-Not (Test-Path "$($BUILDDIR)" -PathType Container))
  {
    Exit 255
  }
}
# if (-Not (Test-Path "$($BUILDDIR86)" -PathType Container))
# {
#   New-Item "$($BUILDDIR86)" -ItemType Directory
#   if (-Not (Test-Path "$($BUILDDIR86)" -PathType Container))
#   {
#     Exit 254
#   }
# }
if (-Not (Test-Path "$($BUILDDIR64)" -PathType Container))
{
  New-Item "$($BUILDDIR64)" -ItemType Directory
  if (-Not (Test-Path "$($BUILDDIR64)" -PathType Container))
  {
    Exit 254
    # Exit 253
  }
}
Set-Location "$($WINDOWSDIR)"
# MSBuild /p:Configuration=Release /p:Platform=x86
# if (-Not (Test-Path "$($WINDOWSDIR)\Release\rgbdiff.exe" -PathType Leaf))
# {
#   Exit 253
#   # Exit 252
# }
# Move-Item -Path "$($WINDOWSDIR)\Release\rgbdiff.exe" "$($BUILDDIR86)\rgbdiff-x86.exe"
MSBuild /p:Configuration=Release /p:Platform=x64
if (-Not (Test-Path "$($WINDOWSDIR)\x64\Release\rgbdiff.exe" -PathType Leaf))
{
  Exit 253
  # Exit 251
}
Move-Item -Path "$($WINDOWSDIR)\x64\Release\rgbdiff.exe" "$($BUILDDIR64)\rgbdiff-x64.exe"
Set-Location "$(PARENTDIR)"
