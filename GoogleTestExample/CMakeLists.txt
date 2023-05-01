cmake_minimum_required(VERSION 3.25)
project(GoogleTestExample)
set(CMAKE_CXX_STANDARD 17)

add_executable(GoogleTestExample main.cpp CustomMath.cpp)

add_subdirectory(lib)
include_directories(${gtest_SOURCE_DIR}/include ${gtest_SOURCE_DIR})

add_subdirectory(TestCases)