#!/bin/bash -x

set -e

proj_root=`pwd`
inst_dir=build-w64
bin_root="${inst_dir}/release"
simanneal_bin_root="${bin_root}/phys/simanneal"

echo `which cmake`
cmake -DCMAKE_SH="CMAKE_SH-NOTFOUND" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="${inst_dir}" -G "MinGW Makefiles" CMakeLists.txt
mingw32-make -j8 install

#echo `which ldd`

#echo `find .`

echo "SiQAD dependencies:"
echo `cygcheck "${bin_root}/siqad.exe" | grep -e 'mingw64.*dll' | sed -e 's/^ *//' | sort -u`
cp `cygcheck "${bin_root}/siqad.exe" | grep -e 'mingw64.*dll' | sed -e 's/^ *//' | sort -u` "${bin_root}"
#echo `ldd "${bin_root}/siqad.exe"`
#cp `ldd "${bin_root}/siqad.exe" | grep -o -e '/mingw64.*dll' | sort -u` "${bin_root}"

echo "SimAnneal dependencies:"
echo `cygcheck "${simanneal_bin_root}/simanneal.exe" | grep -e 'mingw64.*dll' | sed -e 's/^ *//' | sort -u`
cp `cygcheck "${simanneal_bin_root}/simanneal.exe" | grep -e 'mingw64.*dll' | sed -e 's/^ *//' | sort -u` "${simanneal_bin_root}"
#echo `ldd "${simanneal_bin_root}/simanneal.exe"`
#cp `ldd "${simanneal_bin_root}/simanneal.exe" | grep -o -e '/mingw64.*dll' | sort -u` "${simanneal_bin_root}"

cd "${bin_root}"
windeployqt siqad.exe --no-translations
cd "${proj_root}"

zip -r build-w64.zip "${inst_dir}"
