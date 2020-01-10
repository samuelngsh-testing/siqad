cmake_minimum_required(VERSION 3.10)

# for release builds, add flag "-DCMAKE_BUILD_TYPE=Release" (without quotes) when running cmake.

#project(SiQAD VERSION 0.2.0)
# TODO add way to push version number into source code
#add_executable(src/main.cc)

#set(CMAKE_CXX_STANDARD 11)
#set(CMAKE_CXX_STANDARD_REQUIRED True)
#set(QT_VERSION_REQ "5.2")
#set(MAKE_INCLUDE_CURRENT_DIR ON)

add_subdirectory(src)
#add_subdirectory(src/phys/afmmarcus)
add_subdirectory(src/phys/simanneal)
#add_subdirectory(src/phys/poissolver)
