cmake_minimum_required(VERSION 3.25)
project(BoostTestExample)

set(CMAKE_CXX_STANDARD 17)


add_executable(BoostTestExample main.cpp CustomMath.cpp)
add_subdirectory(Boost_tests)
