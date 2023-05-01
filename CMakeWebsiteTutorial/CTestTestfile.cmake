# CMake generated Testfile for 
# Source directory: /Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial
# Build directory: /Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(Runs "/Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/CMakeTutorial" "25")
set_tests_properties(Runs PROPERTIES  _BACKTRACE_TRIPLES "/Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/CMakeLists.txt;41;add_test;/Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/CMakeLists.txt;0;")
add_test(Usage "/Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/CMakeTutorial" "4")
set_tests_properties(Usage PROPERTIES  PASS_REGULAR_EXPRESSION "Hello there" _BACKTRACE_TRIPLES "/Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/CMakeLists.txt;42;add_test;/Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/CMakeLists.txt;0;")
add_test(StandardUse "/Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/CMakeTutorial" "4")
set_tests_properties(StandardUse PROPERTIES  PASS_REGULAR_EXPRESSION "value is 2" _BACKTRACE_TRIPLES "/Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/CMakeLists.txt;44;add_test;/Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/CMakeLists.txt;0;")
add_test(Comp4 "/Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/CMakeTutorial" "4")
set_tests_properties(Comp4 PROPERTIES  PASS_REGULAR_EXPRESSION "value is 2" _BACKTRACE_TRIPLES "/Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/CMakeLists.txt;48;add_test;/Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/CMakeLists.txt;53;do_test;/Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/CMakeLists.txt;0;")
add_test(Comp9 "/Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/CMakeTutorial" "9")
set_tests_properties(Comp9 PROPERTIES  PASS_REGULAR_EXPRESSION "value is 3" _BACKTRACE_TRIPLES "/Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/CMakeLists.txt;48;add_test;/Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/CMakeLists.txt;54;do_test;/Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/CMakeLists.txt;0;")
add_test(Comp5 "/Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/CMakeTutorial" "5")
set_tests_properties(Comp5 PROPERTIES  PASS_REGULAR_EXPRESSION "value is 2.236" _BACKTRACE_TRIPLES "/Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/CMakeLists.txt;48;add_test;/Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/CMakeLists.txt;55;do_test;/Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/CMakeLists.txt;0;")
add_test(Comp7 "/Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/CMakeTutorial" "7")
set_tests_properties(Comp7 PROPERTIES  PASS_REGULAR_EXPRESSION "value is 2.645" _BACKTRACE_TRIPLES "/Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/CMakeLists.txt;48;add_test;/Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/CMakeLists.txt;56;do_test;/Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/CMakeLists.txt;0;")
add_test(Comp25 "/Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/CMakeTutorial" "25")
set_tests_properties(Comp25 PROPERTIES  PASS_REGULAR_EXPRESSION "value is 5" _BACKTRACE_TRIPLES "/Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/CMakeLists.txt;48;add_test;/Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/CMakeLists.txt;57;do_test;/Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/CMakeLists.txt;0;")
add_test(Comp-25 "/Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/CMakeTutorial" "-25")
set_tests_properties(Comp-25 PROPERTIES  PASS_REGULAR_EXPRESSION "value is (-nan|nan|0)" _BACKTRACE_TRIPLES "/Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/CMakeLists.txt;48;add_test;/Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/CMakeLists.txt;58;do_test;/Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/CMakeLists.txt;0;")
add_test(Comp0.0001 "/Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/CMakeTutorial" "0.0001")
set_tests_properties(Comp0.0001 PROPERTIES  PASS_REGULAR_EXPRESSION "value is 0.01" _BACKTRACE_TRIPLES "/Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/CMakeLists.txt;48;add_test;/Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/CMakeLists.txt;59;do_test;/Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/CMakeLists.txt;0;")
subdirs("MathFunctions")
