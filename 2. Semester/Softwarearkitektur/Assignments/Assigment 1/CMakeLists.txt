set (ProjectName "Assignment_1")
set (CPP_Compiler "C:/MinGW/bin/g++")
set (C_Compiler "C:/MinGW/bin/gcc")

cmake_minimum_required(VERSION 3.5)
project(${ProjectName} VERSION 1.0)

set( CMAKE_CXX_COMPILER ${CPP_Compiler} )
set( CMAKE_C_COMPILER ${C_Compiler} )

file(GLOB SOURCES 
    src/*.cpp
)

file(GLOB HEADERS 
    inc/*.h
)

add_library(
    my_libraries
    ${SOURCES}
    ${HEADERS}
)

add_executable(${ProjectName} src/main.cpp)

target_link_libraries(${ProjectName} PRIVATE my_libraries)
