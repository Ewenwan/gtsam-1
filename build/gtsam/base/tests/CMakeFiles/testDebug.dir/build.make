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
include gtsam/base/tests/CMakeFiles/testDebug.dir/depend.make

# Include the progress variables for this target.
include gtsam/base/tests/CMakeFiles/testDebug.dir/progress.make

# Include the compile flags for this target's objects.
include gtsam/base/tests/CMakeFiles/testDebug.dir/flags.make

gtsam/base/tests/CMakeFiles/testDebug.dir/testDebug.cpp.o: gtsam/base/tests/CMakeFiles/testDebug.dir/flags.make
gtsam/base/tests/CMakeFiles/testDebug.dir/testDebug.cpp.o: ../gtsam/base/tests/testDebug.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/bharat/gtsam/gtsam-3.2.0/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object gtsam/base/tests/CMakeFiles/testDebug.dir/testDebug.cpp.o"
	cd /home/bharat/gtsam/gtsam-3.2.0/build/gtsam/base/tests && /usr/bin/c++   $(CXX_DEFINES) -DTOPSRCDIR=\"/home/bharat/gtsam/gtsam-3.2.0\" $(CXX_FLAGS) -o CMakeFiles/testDebug.dir/testDebug.cpp.o -c /home/bharat/gtsam/gtsam-3.2.0/gtsam/base/tests/testDebug.cpp

gtsam/base/tests/CMakeFiles/testDebug.dir/testDebug.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/testDebug.dir/testDebug.cpp.i"
	cd /home/bharat/gtsam/gtsam-3.2.0/build/gtsam/base/tests && /usr/bin/c++  $(CXX_DEFINES) -DTOPSRCDIR=\"/home/bharat/gtsam/gtsam-3.2.0\" $(CXX_FLAGS) -E /home/bharat/gtsam/gtsam-3.2.0/gtsam/base/tests/testDebug.cpp > CMakeFiles/testDebug.dir/testDebug.cpp.i

gtsam/base/tests/CMakeFiles/testDebug.dir/testDebug.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/testDebug.dir/testDebug.cpp.s"
	cd /home/bharat/gtsam/gtsam-3.2.0/build/gtsam/base/tests && /usr/bin/c++  $(CXX_DEFINES) -DTOPSRCDIR=\"/home/bharat/gtsam/gtsam-3.2.0\" $(CXX_FLAGS) -S /home/bharat/gtsam/gtsam-3.2.0/gtsam/base/tests/testDebug.cpp -o CMakeFiles/testDebug.dir/testDebug.cpp.s

gtsam/base/tests/CMakeFiles/testDebug.dir/testDebug.cpp.o.requires:
.PHONY : gtsam/base/tests/CMakeFiles/testDebug.dir/testDebug.cpp.o.requires

gtsam/base/tests/CMakeFiles/testDebug.dir/testDebug.cpp.o.provides: gtsam/base/tests/CMakeFiles/testDebug.dir/testDebug.cpp.o.requires
	$(MAKE) -f gtsam/base/tests/CMakeFiles/testDebug.dir/build.make gtsam/base/tests/CMakeFiles/testDebug.dir/testDebug.cpp.o.provides.build
.PHONY : gtsam/base/tests/CMakeFiles/testDebug.dir/testDebug.cpp.o.provides

gtsam/base/tests/CMakeFiles/testDebug.dir/testDebug.cpp.o.provides.build: gtsam/base/tests/CMakeFiles/testDebug.dir/testDebug.cpp.o

# Object files for target testDebug
testDebug_OBJECTS = \
"CMakeFiles/testDebug.dir/testDebug.cpp.o"

# External object files for target testDebug
testDebug_EXTERNAL_OBJECTS =

gtsam/base/tests/testDebug: gtsam/base/tests/CMakeFiles/testDebug.dir/testDebug.cpp.o
gtsam/base/tests/testDebug: gtsam/base/tests/CMakeFiles/testDebug.dir/build.make
gtsam/base/tests/testDebug: CppUnitLite/libCppUnitLite.a
gtsam/base/tests/testDebug: gtsam/libgtsam.so.3.2.0
gtsam/base/tests/testDebug: /usr/lib/x86_64-linux-gnu/libboost_serialization.so
gtsam/base/tests/testDebug: /usr/lib/x86_64-linux-gnu/libboost_system.so
gtsam/base/tests/testDebug: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
gtsam/base/tests/testDebug: /usr/lib/x86_64-linux-gnu/libboost_thread.so
gtsam/base/tests/testDebug: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
gtsam/base/tests/testDebug: /usr/lib/x86_64-linux-gnu/libboost_regex.so
gtsam/base/tests/testDebug: /usr/lib/x86_64-linux-gnu/libboost_timer.so
gtsam/base/tests/testDebug: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
gtsam/base/tests/testDebug: /usr/lib/libtbb.so
gtsam/base/tests/testDebug: /usr/lib/libtbbmalloc.so
gtsam/base/tests/testDebug: gtsam/base/tests/CMakeFiles/testDebug.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable testDebug"
	cd /home/bharat/gtsam/gtsam-3.2.0/build/gtsam/base/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/testDebug.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
gtsam/base/tests/CMakeFiles/testDebug.dir/build: gtsam/base/tests/testDebug
.PHONY : gtsam/base/tests/CMakeFiles/testDebug.dir/build

gtsam/base/tests/CMakeFiles/testDebug.dir/requires: gtsam/base/tests/CMakeFiles/testDebug.dir/testDebug.cpp.o.requires
.PHONY : gtsam/base/tests/CMakeFiles/testDebug.dir/requires

gtsam/base/tests/CMakeFiles/testDebug.dir/clean:
	cd /home/bharat/gtsam/gtsam-3.2.0/build/gtsam/base/tests && $(CMAKE_COMMAND) -P CMakeFiles/testDebug.dir/cmake_clean.cmake
.PHONY : gtsam/base/tests/CMakeFiles/testDebug.dir/clean

gtsam/base/tests/CMakeFiles/testDebug.dir/depend:
	cd /home/bharat/gtsam/gtsam-3.2.0/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/bharat/gtsam/gtsam-3.2.0 /home/bharat/gtsam/gtsam-3.2.0/gtsam/base/tests /home/bharat/gtsam/gtsam-3.2.0/build /home/bharat/gtsam/gtsam-3.2.0/build/gtsam/base/tests /home/bharat/gtsam/gtsam-3.2.0/build/gtsam/base/tests/CMakeFiles/testDebug.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : gtsam/base/tests/CMakeFiles/testDebug.dir/depend

