#enable dynamic lib
set(Boost_USE_STATIC_LIBS OFF)

set(Boost_ROOT "/usr/local/Cellar/boost")
#search for unit test framework
find_package(Boost REQUIRED COMPONENTS unit_test_framework)



include_directories(${Boost_INCLUDE_DIR})

#create a target from CMakeTutorial app
add_executable(CMakeTutorial_boost tests.cpp)

#link boost libraries to the new target
target_link_libraries(CMakeTutorial_boost ${Boost_LIBRARIES})

#link  boost with code library
target_link_libraries(CMakeTutorial_boost CMakeTutorial_lib)



