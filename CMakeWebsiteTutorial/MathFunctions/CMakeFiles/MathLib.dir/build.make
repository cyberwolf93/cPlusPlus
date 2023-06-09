# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.26

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.26.3/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.26.3/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial

# Include any dependencies generated for this target.
include MathFunctions/CMakeFiles/MathLib.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include MathFunctions/CMakeFiles/MathLib.dir/compiler_depend.make

# Include the progress variables for this target.
include MathFunctions/CMakeFiles/MathLib.dir/progress.make

# Include the compile flags for this target's objects.
include MathFunctions/CMakeFiles/MathLib.dir/flags.make

MathFunctions/CMakeFiles/MathLib.dir/mysqrt.cpp.o: MathFunctions/CMakeFiles/MathLib.dir/flags.make
MathFunctions/CMakeFiles/MathLib.dir/mysqrt.cpp.o: MathFunctions/mysqrt.cpp
MathFunctions/CMakeFiles/MathLib.dir/mysqrt.cpp.o: MathFunctions/CMakeFiles/MathLib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object MathFunctions/CMakeFiles/MathLib.dir/mysqrt.cpp.o"
	cd /Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/MathFunctions && /Applications/Xcode-14.2.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT MathFunctions/CMakeFiles/MathLib.dir/mysqrt.cpp.o -MF CMakeFiles/MathLib.dir/mysqrt.cpp.o.d -o CMakeFiles/MathLib.dir/mysqrt.cpp.o -c /Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/MathFunctions/mysqrt.cpp

MathFunctions/CMakeFiles/MathLib.dir/mysqrt.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/MathLib.dir/mysqrt.cpp.i"
	cd /Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/MathFunctions && /Applications/Xcode-14.2.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/MathFunctions/mysqrt.cpp > CMakeFiles/MathLib.dir/mysqrt.cpp.i

MathFunctions/CMakeFiles/MathLib.dir/mysqrt.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/MathLib.dir/mysqrt.cpp.s"
	cd /Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/MathFunctions && /Applications/Xcode-14.2.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/MathFunctions/mysqrt.cpp -o CMakeFiles/MathLib.dir/mysqrt.cpp.s

# Object files for target MathLib
MathLib_OBJECTS = \
"CMakeFiles/MathLib.dir/mysqrt.cpp.o"

# External object files for target MathLib
MathLib_EXTERNAL_OBJECTS =

MathFunctions/libMathLib.a: MathFunctions/CMakeFiles/MathLib.dir/mysqrt.cpp.o
MathFunctions/libMathLib.a: MathFunctions/CMakeFiles/MathLib.dir/build.make
MathFunctions/libMathLib.a: MathFunctions/CMakeFiles/MathLib.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libMathLib.a"
	cd /Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/MathFunctions && $(CMAKE_COMMAND) -P CMakeFiles/MathLib.dir/cmake_clean_target.cmake
	cd /Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/MathFunctions && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/MathLib.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
MathFunctions/CMakeFiles/MathLib.dir/build: MathFunctions/libMathLib.a
.PHONY : MathFunctions/CMakeFiles/MathLib.dir/build

MathFunctions/CMakeFiles/MathLib.dir/clean:
	cd /Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/MathFunctions && $(CMAKE_COMMAND) -P CMakeFiles/MathLib.dir/cmake_clean.cmake
.PHONY : MathFunctions/CMakeFiles/MathLib.dir/clean

MathFunctions/CMakeFiles/MathLib.dir/depend:
	cd /Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial /Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/MathFunctions /Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial /Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/MathFunctions /Users/amohiy/Projects/cPlusPlus/CMakeWebsiteTutorial/MathFunctions/CMakeFiles/MathLib.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : MathFunctions/CMakeFiles/MathLib.dir/depend

