#!/bin/sh

# LuaJIT install script for devkitPPC
# By HTV04

# $1: Platform (optional)
# $2: Destination directory (optional)

if [ -z "$DEVKITPRO" ]
then
    echo "Please set DEVKITPRO in your environment. export DEVKITPRO=<path to>devkitPro"

    exit 1
fi

if [ "$1" == cube ]
then
  platform=cube

  echo "Installing LuaJIT for GameCube..."
else
  platform=wii

  echo "Installing LuaJIT for Wii..."
fi

mkdir -p "$1$DEVKITPRO/portlibs/$platform/include"

# Install header files
for header in lauxlib.h lua.h lua.hpp luaconf.h luajit.h lualib.h
do
  cp src/$header "$2$DEVKITPRO/portlibs/$platform/include"

  echo "Copied $header to $2$DEVKITPRO/portlibs/$platform/include"
done

# Install LuaJIT
cp src/libluajit.a "$2$DEVKITPRO/portlibs/$platform/lib/libluajit.a"

echo "Copied libluajit.a to $2$DEVKITPRO/portlibs/$platform/lib"

if [ $platform == cube ]
then
  echo "LuaJIT for GameCube installed."
else
  echo "LuaJIT for Wii installed."
fi
