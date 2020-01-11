cmake_minimum_required(VERSION 3.10)

# for release builds, add flag "-DCMAKE_BUILD_TYPE=Release" (without quotes) when running cmake.

#if(DEFINED SIQAD_INSTALL_ROOT)
#    set(SIQADCONN_INSTALL_DIR "${SIQAD_INSTALL_ROOT}/phys/siqadconn")
#elseif(CMAKE_BUILD_TYPE MATCHES Release)
#    set(SIQADCONN_INSTALL_DIR "release")
#else()
#    set(SIQADCONN_INSTALL_DIR "debug")
#ENDIF()

find_package(SWIG REQUIRED)
include(${SWIG_USE_FILE})

find_package(PythonLibs REQUIRED)
include_directories(${PYTHON_INCLUDE_PATH})

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/src)
set(CMAKE_SWIG_FLAGS "")

#add_subdirectory(siqadconn_cxx)

#set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
set_property(SOURCE src/siqadconn.i PROPERTY CPLUSPLUS ON)
set_property(SOURCE src/siqadconn.i PROPERTY USE_LIBRARY_INCLUDE_DIRECTORIES TRUE)
#set_property(TARGET siqadconn_cxx PROPERTY SWIG_USE_TARGET_INCLUDE_DIRECTORIES TRUE)
set_source_files_properties(siqadconn_cxx/siqadconn.h PROPERTIES SWIG_FLAGS "-includeall")
#SET_SOURCE_FILES_PROPERTIES(src/siqadconn.i PROPERTIES SWIG_FLAGS "-includeall")
swig_add_library(siqadconn LANGUAGE python SOURCES src/siqadconn.i src/siqadconn.cc)

#swig_link_libraries(siqadconn siqadconn_cxx)
swig_link_libraries(siqadconn ${PYTHON_LIBRARIES} ${Boost_LIBRARIES})

install(TARGETS ${SWIG_MODULE_siqadconn_REAL_NAME} 
        DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/../cmake-install/siqadtools)
install(FILES ${CMAKE_CURRENT_BINARY_DIR}/siqadconn.py 
              ${CMAKE_CURRENT_SOURCE_DIR}/src/__init__.py
        DESTINATION ${CMAKE_CURRENT_BINARY_DIR}/../cmake-install/siqadtools)

#add_custom_command(
#    TARGET _siqadconn POST_BUILD
#    COMMAND ${CMAKE_COMMAND} -E copy
#            ${CMAKE_CURRENT_BINARY_DIR}/siqadconn.py
#            ${CMAKE_CURRENT_BINARY_DIR}/../../../siqadconn/siqadconn.py)
#install(TARGETS ${SWIG_MODULE_siqadconn_REAL_NAME} 
#        LIBRARY DESTINATION ${SIQADCONN_INSTALL_DIR})
#install(FILES ${CMAKE_CURRENT_BINARY_DIR}/siqadconn.py
#        DESTINATION ${SIQADCONN_INSTALL_DIR})
