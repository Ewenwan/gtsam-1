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

# Utility rule file for check.geometry.

# Include the progress variables for this target.
include gtsam/geometry/tests/CMakeFiles/check.geometry.dir/progress.make

gtsam/geometry/tests/CMakeFiles/check.geometry:
	cd /home/bharat/gtsam/gtsam-3.2.0/build/gtsam/geometry/tests && /usr/bin/ctest -C Release --output-on-failure

check.geometry: gtsam/geometry/tests/CMakeFiles/check.geometry
check.geometry: gtsam/geometry/tests/CMakeFiles/check.geometry.dir/build.make
.PHONY : check.geometry

# Rule to build all files generated by this target.
gtsam/geometry/tests/CMakeFiles/check.geometry.dir/build: check.geometry
.PHONY : gtsam/geometry/tests/CMakeFiles/check.geometry.dir/build

gtsam/geometry/tests/CMakeFiles/check.geometry.dir/clean:
	cd /home/bharat/gtsam/gtsam-3.2.0/build/gtsam/geometry/tests && $(CMAKE_COMMAND) -P CMakeFiles/check.geometry.dir/cmake_clean.cmake
.PHONY : gtsam/geometry/tests/CMakeFiles/check.geometry.dir/clean

gtsam/geometry/tests/CMakeFiles/check.geometry.dir/depend:
	cd /home/bharat/gtsam/gtsam-3.2.0/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/bharat/gtsam/gtsam-3.2.0 /home/bharat/gtsam/gtsam-3.2.0/gtsam/geometry/tests /home/bharat/gtsam/gtsam-3.2.0/build /home/bharat/gtsam/gtsam-3.2.0/build/gtsam/geometry/tests /home/bharat/gtsam/gtsam-3.2.0/build/gtsam/geometry/tests/CMakeFiles/check.geometry.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : gtsam/geometry/tests/CMakeFiles/check.geometry.dir/depend

