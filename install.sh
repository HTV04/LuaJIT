#!/usr/bin/env bash

# LuaJIT install script for devkitPPC
# By HTV04

# $1: Platform (optional)
# $2: Destination directory (optional)

# Set platform
if [ "$1" == "gamecube" ]
then
  source /opt/devkitpro/cubevars.sh

  platform="gamecube"

  echo "Installing LuaJIT for GameCube..."
else
  source /opt/devkitpro/wiivars.sh

  platform="wii"

  echo "Installing LuaJIT for Wii..."
fi

# Create directories if they don't exist
mkdir -p "$2$DEVKITPRO/portlibs/$platform/include"
mkdir -p "$2$DEVKITPRO/portlibs/$platform/lib"

# Install header files
for header in lauxlib.h lua.h lua.hpp luaconf.h luajit.h lualib.h
do
  cp src/$header "$2$DEVKITPRO/portlibs/$platform/include"

  echo "Copied $header to $2$DEVKITPRO/portlibs/$platform/include"
done

# Install LuaJIT
cp src/libluajit.a "$2$DEVKITPRO/portlibs/$platform/lib/libluajit.a"

echo "Copied libluajit.a to $2$DEVKITPRO/portlibs/$platform/lib"

if [ $platform == gamecube ]
then
  echo "LuaJIT for GameCube installed."
else
  echo "LuaJIT for Wii installed."
fi
