powershell Set-MpPreference -DisableRealTimeMonitoring 1
powershell Set-MpPreference -DisableBehaviorMonitoring 1

<<<<<<< HEAD
gdr

choco list -localonly
choco uninstall -y mingw llvm wsl

gdr
=======
#gdr

#choco list -localonly
choco uninstall -y mingw llvm wsl

#gdr
>>>>>>> master

choco install -q msys2
taskkill -IM "gpg-agent.exe" -F

<<<<<<< HEAD
gdr

c:\tools\msys64\usr\bin\bash.exe -l -c "pacman --noconfirm --needed -S mingw-w64-x86_64-toolchain mingw-w64-x86_64-gcc mingw-w64-x86_64-qt5 mingw-w64-x86_64-cmake mingw-w64-x86_64-pkg-config mingw-w64-x86_64-boost"
=======
#gdr

c:\tools\msys64\usr\bin\bash.exe -l -c "pacman --quiet --noconfirm --needed -S zip base-devel mingw-w64-x86_64-toolchain mingw-w64-x86_64-gcc mingw-w64-x86_64-qt5 mingw-w64-x86_64-cmake mingw-w64-x86_64-pkg-config mingw-w64-x86_64-boost"
>>>>>>> master
