#!/bin/bash

ROOT=`pwd`
BINDIR=$ROOT/bin
SRCDIR=$ROOT/src
LOGDIR=$ROOT/log
WIN64_TOOL_PREFIX=/usr/bin/i686-w64-mingw32-

echo "Building Packages"
cd $SRCDIR
for i in *
do
    if [[ -d $i ]]; then
        PACKAGE=$i
        echo "Building package: " $PACKAGE
        cd $i && ./build.sh &> $LOGDIR/$PACKAGE.log
    fi
done
