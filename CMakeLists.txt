cmake_minimum_required(VERSION 3.10)

# For release builds, add flag "-DCMAKE_BUILD_TYPE=Release" (without quotes) when running cmake.
# Add flag "-DCMAKE_INSTALL_PREFIX=" to define installation location.

if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Debug CACHE STRING "Choose the build type.")
endif()

add_subdirectory(src)
#add_subdirectory(src/phys/siqadconn)
#add_subdirectory(src/phys/afmmarcus)
add_subdirectory(src/phys/exhaustive_gs)
add_subdirectory(src/phys/simanneal)
#add_subdirectory(src/phys/poissolver)
