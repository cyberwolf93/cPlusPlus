set(Boost_USE_STATIC_LIBS OFF)
find_package(Boost REQUIRED COMPONENTS unit_test_framework)
include_directories(${Boost_INCLUDE_DIRS})

include_directories(../)

add_executable(BoostTestExample_test  testMath.cpp ../CustomMath.cpp)
target_link_libraries(BoostTestExample_test ${Boost_LIBRARIES})