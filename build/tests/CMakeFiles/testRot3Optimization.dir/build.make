# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/cmake-gui

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/bharat/gtsam/gtsam-3.2.0

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/bharat/gtsam/gtsam-3.2.0/build

# Include any dependencies generated for this target.
include tests/CMakeFiles/testRot3Optimization.dir/depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/testRot3Optimization.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/testRot3Optimization.dir/flags.make

tests/CMakeFiles/testRot3Optimization.dir/testRot3Optimization.cpp.o: tests/CMakeFiles/testRot3Optimization.dir/flags.make
tests/CMakeFiles/testRot3Optimization.dir/testRot3Optimization.cpp.o: ../tests/testRot3Optimization.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/bharat/gtsam/gtsam-3.2.0/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object tests/CMakeFiles/testRot3Optimization.dir/testRot3Optimization.cpp.o"
	cd /home/bharat/gtsam/gtsam-3.2.0/build/tests && /usr/bin/c++   $(CXX_DEFINES) -DTOPSRCDIR=\"/home/bharat/gtsam/gtsam-3.2.0\" $(CXX_FLAGS) -o CMakeFiles/testRot3Optimization.dir/testRot3Optimization.cpp.o -c /home/bharat/gtsam/gtsam-3.2.0/tests/testRot3Optimization.cpp

tests/CMakeFiles/testRot3Optimization.dir/testRot3Optimization.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/testRot3Optimization.dir/testRot3Optimization.cpp.i"
	cd /home/bharat/gtsam/gtsam-3.2.0/build/tests && /usr/bin/c++  $(CXX_DEFINES) -DTOPSRCDIR=\"/home/bharat/gtsam/gtsam-3.2.0\" $(CXX_FLAGS) -E /home/bharat/gtsam/gtsam-3.2.0/tests/testRot3Optimization.cpp > CMakeFiles/testRot3Optimization.dir/testRot3Optimization.cpp.i

tests/CMakeFiles/testRot3Optimization.dir/testRot3Optimization.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/testRot3Optimization.dir/testRot3Optimization.cpp.s"
	cd /home/bharat/gtsam/gtsam-3.2.0/build/tests && /usr/bin/c++  $(CXX_DEFINES) -DTOPSRCDIR=\"/home/bharat/gtsam/gtsam-3.2.0\" $(CXX_FLAGS) -S /home/bharat/gtsam/gtsam-3.2.0/tests/testRot3Optimization.cpp -o CMakeFiles/testRot3Optimization.dir/testRot3Optimization.cpp.s

tests/CMakeFiles/testRot3Optimization.dir/testRot3Optimization.cpp.o.requires:
.PHONY : tests/CMakeFiles/testRot3Optimization.dir/testRot3Optimization.cpp.o.requires

tests/CMakeFiles/testRot3Optimization.dir/testRot3Optimization.cpp.o.provides: tests/CMakeFiles/testRot3Optimization.dir/testRot3Optimization.cpp.o.requires
	$(MAKE) -f tests/CMakeFiles/testRot3Optimization.dir/build.make tests/CMakeFiles/testRot3Optimization.dir/testRot3Optimization.cpp.o.provides.build
.PHONY : tests/CMakeFiles/testRot3Optimization.dir/testRot3Optimization.cpp.o.provides

tests/CMakeFiles/testRot3Optimization.dir/testRot3Optimization.cpp.o.provides.build: tests/CMakeFiles/testRot3Optimization.dir/testRot3Optimization.cpp.o

# Object files for target testRot3Optimization
testRot3Optimization_OBJECTS = \
"CMakeFiles/testRot3Optimization.dir/testRot3Optimization.cpp.o"

# External object files for target testRot3Optimization
testRot3Optimization_EXTERNAL_OBJECTS =

tests/testRot3Optimization: tests/CMakeFiles/testRot3Optimization.dir/testRot3Optimization.cpp.o
tests/testRot3Optimization: tests/CMakeFiles/testRot3Optimization.dir/build.make
tests/testRot3Optimization: CppUnitLite/libCppUnitLite.a
tests/testRot3Optimization: gtsam/libgtsam.so.3.2.0
tests/testRot3Optimization: /usr/lib/x86_64-linux-gnu/libboost_serialization.so
tests/testRot3Optimization: /usr/lib/x86_64-linux-gnu/libboost_system.so
tests/testRot3Optimization: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
tests/testRot3Optimization: /usr/lib/x86_64-linux-gnu/libboost_thread.so
tests/testRot3Optimization: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
tests/testRot3Optimization: /usr/lib/x86_64-linux-gnu/libboost_regex.so
tests/testRot3Optimization: /usr/lib/x86_64-linux-gnu/libboost_timer.so
tests/testRot3Optimization: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
tests/testRot3Optimization: /usr/lib/libtbb.so
tests/testRot3Optimization: /usr/lib/libtbbmalloc.so
tests/testRot3Optimization: tests/CMakeFiles/testRot3Optimization.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable testRot3Optimization"
	cd /home/bharat/gtsam/gtsam-3.2.0/build/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/testRot3Optimization.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/testRot3Optimization.dir/build: tests/testRot3Optimization
.PHONY : tests/CMakeFiles/testRot3Optimization.dir/build

tests/CMakeFiles/testRot3Optimization.dir/requires: tests/CMakeFiles/testRot3Optimization.dir/testRot3Optimization.cpp.o.requires
.PHONY : tests/CMakeFiles/testRot3Optimization.dir/requires

tests/CMakeFiles/testRot3Optimization.dir/clean:
	cd /home/bharat/gtsam/gtsam-3.2.0/build/tests && $(CMAKE_COMMAND) -P CMakeFiles/testRot3Optimization.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/testRot3Optimization.dir/clean

tests/CMakeFiles/testRot3Optimization.dir/depend:
	cd /home/bharat/gtsam/gtsam-3.2.0/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/bharat/gtsam/gtsam-3.2.0 /home/bharat/gtsam/gtsam-3.2.0/tests /home/bharat/gtsam/gtsam-3.2.0/build /home/bharat/gtsam/gtsam-3.2.0/build/tests /home/bharat/gtsam/gtsam-3.2.0/build/tests/CMakeFiles/testRot3Optimization.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/testRot3Optimization.dir/depend

