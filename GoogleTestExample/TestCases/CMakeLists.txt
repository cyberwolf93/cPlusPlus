
add_executable(GoogleTestExample_test testFile.cpp ../CustomMath.cpp)
target_link_libraries(GoogleTestExample_test gtest gtest_main)