#!/bin/bash -x

set -e

which cmake 
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=build-w64 -G "MinGW Makefiles" CMakeLists.txt
mingw32-make -j8 install
