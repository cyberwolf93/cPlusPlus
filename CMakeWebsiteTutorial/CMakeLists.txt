cmake_minimum_required(VERSION 3.6)

project(CMakeTutorial VERSION 1.0)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(gcc_like_cxx "$<COMPILE_LANG_AND_ID:CXX,ARMClang,AppleClang,Clang,GNU,LCC>")
set(msvc_cxx "$<COMPILE_LANG_AND_ID:CXX,MSVC>")

add_library(tutorial_compiler_flags INTERFACE)
target_compile_features(tutorial_compiler_flags INTERFACE cxx_std_11)
target_compile_options(tutorial_compiler_flags INTERFACE "$<${gcc_like_cxx}:-Wall;-Wextra;-Wshadow;-Wformat=2;-Wunused>" "$<${msvc_cxx}:-W3>")
target_compile_options(tutorial_compiler_flags INTERFACE
  "$<${gcc_like_cxx}:$<BUILD_INTERFACE:-Wall;-Wextra;-Wshadow;-Wformat=2;-Wunused>>"
  "$<${msvc_cxx}:$<BUILD_INTERFACE:-W3>>"
)


option(USE_MYMATH "use custom math lib" ON)
configure_file(CMakeTutorialConfig.h.in CMakeTutorialConfig.h)


if(USE_MYMATH)
    add_subdirectory(MathFunctions)
    list(APPEND EXTRA_LIBS MathLib)
endif()


add_executable(CMakeTutorial main.cpp)

target_link_libraries(CMakeTutorial PUBLIC ${EXTRA_LIBS} tutorial_compiler_flags)
target_include_directories(CMakeTutorial PUBLIC "${PROJECT_BINARY_DIR}")

#installation
install(TARGETS CMakeTutorial DESTINATION bin)
install(FILES "${PROJECT_BINARY_DIR}/CMakeTutorialConfig.h" DESTINATION include)


#Testing 
include(CTest)
enable_testing()
add_test(NAME Runs COMMAND CMakeTutorial 25)
add_test(NAME Usage COMMAND CMakeTutorial 4)
set_tests_properties(Usage PROPERTIES PASS_REGULAR_EXPRESSION "Hello there")
add_test(NAME StandardUse COMMAND CMakeTutorial 4)
set_tests_properties(StandardUse PROPERTIES PASS_REGULAR_EXPRESSION "value is 2")

function(do_test target arg result)
    add_test(NAME Comp${arg} COMMAND ${target} ${arg})
    set_tests_properties(Comp${arg} PROPERTIES PASS_REGULAR_EXPRESSION ${result})
endfunction()

# run multible tests
do_test(CMakeTutorial 4 "value is 2")
do_test(CMakeTutorial 9 "value is 3")
do_test(CMakeTutorial 5 "value is 2.236")
do_test(CMakeTutorial 7 "value is 2.645")
do_test(CMakeTutorial 25 "value is 5")
do_test(CMakeTutorial -25 "value is (-nan|nan|0)")
do_test(CMakeTutorial 0.0001 "value is 0.01")




# Packaging 
include(InstallRequiredSystemLibraries)
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/License.txt")
set(CPACK_PACKAGE_VERSION_MAJOR "${CMakeTutorial_VERSION_MAJOR}")
set(CPACK_PACKAGE_VERSION_MINOR "${CMakeTutorial_VERSION_MINOR}")
set(CPACK_SOURCE_GENERATOR "TGZ")
include(CPack)