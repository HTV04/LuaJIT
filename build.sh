#!/usr/bin/env bash

# LuaJIT build script for devkitPPC
# By HTV04

# $1: Platform (optional)
# $2: Amalgamation (optional)

# Set amalgamation
if [ "$2" == "noamalg" ]
then
  amalg=""
else
  amalg="LJCORE_O=ljamalg.o"
fi

# Build LuaJIT
if [ "$1" == "gamecube" ]
then
  echo "Building LuaJIT for GameCube..."

  source /opt/devkitpro/cubevars.sh

  make -C src libluajit.a \
    BUILDMODE=static \
    CFLAGS="" \
    LDFLAGS="" \
    LIBS="" \
    CROSS="$TOOL_PREFIX" \
    HOST_CC="gcc -m32" \
    $amalg \
    TARGET_CFLAGS="$CFLAGS" \
    TARGET_LDFLAGS="$LDFLAGS" \
    TARGET_SYS=GameCube \
    XCFLAGS="-DLUAJIT_ENABLE_JIT -DLUAJIT_SECURITY_PRNG=0 -DLUAJIT_SECURITY_MCODE=0 -DLUAJIT_NUMMODE=1 -DLUAJIT_USE_SYSMALLOC"

  echo "LuaJIT for GameCube built."
else
  echo "Building LuaJIT for Wii..."

  source /opt/devkitpro/wiivars.sh

  # JIT is temporarily disabled for the Wii until I can find a safer way to allocate memory for it
  make -C src libluajit.a \
    BUILDMODE=static \
    CFLAGS="" \
    LDFLAGS="" \
    LIBS="" \
    CROSS="$TOOL_PREFIX" \
    HOST_CC="gcc -m32" \
    $amalg \
    TARGET_CFLAGS="$CFLAGS" \
    TARGET_LDFLAGS="$LDFLAGS" \
    TARGET_SYS=Wii \
    XCFLAGS="-DLUAJIT_DISABLE_JIT -DLUAJIT_SECURITY_PRNG=0 -DLUAJIT_SECURITY_MCODE=0 -DLUAJIT_NUMMODE=1 -DLUAJIT_USE_SYSMALLOC"

  echo "LuaJIT for Wii built."
fi
