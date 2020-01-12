powershell Set-MpPreference -DisableRealTimeMonitoring 1
powershell Set-MpPreference -DisableBehaviorMonitoring 1

gdr

choco list -localonly
choco uninstall -y mingw llvm wsl

gdr

choco install -q msys2
taskkill -IM "gpg-agent.exe" -F

gdr

c:\tools\msys64\usr\bin\bash.exe -l -c "pacman --noconfirm --needed -S zip mingw-w64-x86_64-toolchain mingw-w64-x86_64-gcc mingw-w64-x86_64-qt5 mingw-w64-x86_64-cmake mingw-w64-x86_64-pkg-config mingw-w64-x86_64-boost"
