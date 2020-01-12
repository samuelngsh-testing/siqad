#!/bin/bash -x

set -e

inst_dir=build-w64
simanneal_inst_dir="${inst_dir}/phys/simanneal"

which cmake 
cmake -DCMAKE_SH="CMAKE_SH-NOTFOUND" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="${inst_dir}" -G "MinGW Makefiles" CMakeLists.txt
mingw32-make -j8 install

cp `ldd "${inst_dir}/siqad.exe" | grep -o -e '/mingw64.*dll' | sort -u` "${inst_dir}"
cp `ldd "${simanneal_inst_dir}/simanneal.exe" | grep -o -e '/mingw64.*dll' | sort -u` "${inst_dir}"

cd build-w64
windeployqt siqad.exe
cd ..

zip -r build-w64.zip build-w64
