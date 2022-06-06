#!/bin/sh

# LuaJIT build script for devkitPPC
# By HTV04

# $1: Platform (optional)

if [ -z "$DEVKITPPC" ]
then
    echo "Please set DEVKITPPC in your environment. export DEVKITPPC=<path to>devkitPPC"

    exit 1
fi

if [ "$1" == "cube" ]
then
  echo "Building LuaJIT for GameCube..."

  make HOST_CC="gcc -m32" \
    CROSS="$DEVKITPPC/bin/powerpc-eabi-" \
    TARGET_CFLAGS="-DGEKKO -mogc -mcpu=750 -meabi -mhard-float -g -O2 -Wall " \
    TARGET_SYS=GameCube

  echo "LuaJIT for GameCube built."
else
  echo "Building LuaJIT for Wii..."

  make HOST_CC="gcc -m32" \
    CROSS="$DEVKITPPC/bin/powerpc-eabi-" \
    TARGET_CFLAGS="-DGEKKO -mrvl -mcpu=750 -meabi -mhard-float -g -O2 -Wall " \
    TARGET_SYS=Wii

  echo "LuaJIT for Wii built."
fi
