#!/bin/bash

echo "Building Linux64 Package"
cd build_linux64
mkdir -p package
cp -R ../SDL2-2.0.3 .
HERE=`pwd`
cd SDL2-2.0.3
./configure --prefix=$HERE/package
make -j8
make install
rm -rf SDL2-2.0.3
cd ../..

echo "Building Windows64 Package"
cd build_windows64
mkdir -p package
cp -R ../SDL2-2.0.3 .
HERE=`pwd`
cd SDL2-2.0.3
patch -p0 < ../../patches/SDL2-fix-gcc-compatibility.patch
patch -p0 < ../../patches/SDL2-prevent-duplicate-d3d11-declarations.patch
./configure CC='/usr/bin/i686-w64-mingw32-gcc' WINDRES='/usr/bin/i686-w64-mingw32-windres' --prefix=$HERE/package --host=i686-mingw32msvc --build=x86_64-linux
make
make install
rm -rf SDL2-2.0.3
cd ../..
