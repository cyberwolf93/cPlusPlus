cmake_minimum_required(VERSION 3.25)
project(CMakeTutorial)

set(CMAKE_CXX_STANDARD 17)

add_executable(CMakeTutorial main.cpp general.cpp)
add_executable(CMakeTutorial_calc main.cpp calc.cpp)

add_library(CMakeTutorial_lib STATIC calc.cpp)

target_include_directories(CMakeTutorial_calc PUBLIC includes/general)
target_include_directories(CMakeTutorial_calc PUBLIC includes/math)

find_library(TEST_LIB CMakeTutorial_lib lib)
target_link_libraries(CMakeTutorial LINK_PUBLIC ${TEST_LIB})

add_subdirectory(test)