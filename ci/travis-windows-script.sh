#!/bin/bash -x

set -e

inst_dir=build-w64
bin_root="${inst_dir}/release"
simanneal_bin_root="${bin_root}/phys/simanneal"

echo `which cmake`
cmake -DCMAKE_SH="CMAKE_SH-NOTFOUND" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="${inst_dir}" -G "MinGW Makefiles" CMakeLists.txt
mingw32-make -j8 install

echo `which ldd`

echo `find .`

cp `ldd "${bin_root}/siqad.exe" | grep -o -e '/mingw64.*dll' | sort -u` "${bin_dir}"
cp `ldd "${simanneal_bin_root}/simanneal.exe" | grep -o -e '/mingw64.*dll' | sort -u` "${simanneal_bin_root}"

cd build-w64
windeployqt siqad.exe
cd ..

zip -r build-w64.zip build-w64
