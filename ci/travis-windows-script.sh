#!/bin/bash -x

set -e

which cmake 
cmake -DCMAKE_SH="CMAKE_SH-NOTFOUND" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=build-w64 -G "MinGW Makefiles" CMakeLists.txt
mingw32-make -j8 install

cd build-w64
cp `ldd siqad.exe | grep -o -e '/mingw64.*dll' | sort -u` .
windeployqt siqad.exe
cd ..

zip -r build-w64.zip build-w64
