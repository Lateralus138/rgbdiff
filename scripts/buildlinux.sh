#!/usr/bin/env bash
SOURCEDIR=$PWD/linux
PARENTDIR=$(dirname $SOURCEDIR)
BUILDDIR=${PARENTDIR}/build/linux
echo "Checking if the Linux build directory exists..."
if [[ ! -d "${BUILDDIR}" ]]; then
echo "Linux build directory does not exists, attempting to create..."
  mkdir -p "${BUILDDIR}"
  if [[ ! -d "${BUILDDIR}" ]]; then
    echo -e "Could not create the Linux build directory for and unknown reason...\nExiting."
    exit 252
  fi
fi
cd $SOURCEDIR
echo "Attempting to build precompiled headers and objects..."
./prebuild
if [[ $? -gt 0 ]]; then
  echo -e "Could not build precompiled headers and objects...\nExiting."
  exit 251
fi
echo "Attempting to build the main program..."
make releasedynamic
if [[ ! -e "./release/dynamic/rgbdiff" ]]; then
  echo -e "Could not build the main program for an unknown reason...\nExiting."
  exit 250
fi
echo "Attempting to move the program to the project build directory..."
mv "./release/dynamic/rgbdiff" ${BUILDDIR}/
if [[ $? -gt 0 ]]; then
  echo -e "Could not move the program to the project build directory...\nExiting."
  exit 249
fi
