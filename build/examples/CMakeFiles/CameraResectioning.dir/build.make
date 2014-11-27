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
include examples/CMakeFiles/CameraResectioning.dir/depend.make

# Include the progress variables for this target.
include examples/CMakeFiles/CameraResectioning.dir/progress.make

# Include the compile flags for this target's objects.
include examples/CMakeFiles/CameraResectioning.dir/flags.make

examples/CMakeFiles/CameraResectioning.dir/CameraResectioning.cpp.o: examples/CMakeFiles/CameraResectioning.dir/flags.make
examples/CMakeFiles/CameraResectioning.dir/CameraResectioning.cpp.o: ../examples/CameraResectioning.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/bharat/gtsam/gtsam-3.2.0/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object examples/CMakeFiles/CameraResectioning.dir/CameraResectioning.cpp.o"
	cd /home/bharat/gtsam/gtsam-3.2.0/build/examples && /usr/bin/c++   $(CXX_DEFINES) -DTOPSRCDIR=\"/home/bharat/gtsam/gtsam-3.2.0\" $(CXX_FLAGS) -o CMakeFiles/CameraResectioning.dir/CameraResectioning.cpp.o -c /home/bharat/gtsam/gtsam-3.2.0/examples/CameraResectioning.cpp

examples/CMakeFiles/CameraResectioning.dir/CameraResectioning.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/CameraResectioning.dir/CameraResectioning.cpp.i"
	cd /home/bharat/gtsam/gtsam-3.2.0/build/examples && /usr/bin/c++  $(CXX_DEFINES) -DTOPSRCDIR=\"/home/bharat/gtsam/gtsam-3.2.0\" $(CXX_FLAGS) -E /home/bharat/gtsam/gtsam-3.2.0/examples/CameraResectioning.cpp > CMakeFiles/CameraResectioning.dir/CameraResectioning.cpp.i

examples/CMakeFiles/CameraResectioning.dir/CameraResectioning.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/CameraResectioning.dir/CameraResectioning.cpp.s"
	cd /home/bharat/gtsam/gtsam-3.2.0/build/examples && /usr/bin/c++  $(CXX_DEFINES) -DTOPSRCDIR=\"/home/bharat/gtsam/gtsam-3.2.0\" $(CXX_FLAGS) -S /home/bharat/gtsam/gtsam-3.2.0/examples/CameraResectioning.cpp -o CMakeFiles/CameraResectioning.dir/CameraResectioning.cpp.s

examples/CMakeFiles/CameraResectioning.dir/CameraResectioning.cpp.o.requires:
.PHONY : examples/CMakeFiles/CameraResectioning.dir/CameraResectioning.cpp.o.requires

examples/CMakeFiles/CameraResectioning.dir/CameraResectioning.cpp.o.provides: examples/CMakeFiles/CameraResectioning.dir/CameraResectioning.cpp.o.requires
	$(MAKE) -f examples/CMakeFiles/CameraResectioning.dir/build.make examples/CMakeFiles/CameraResectioning.dir/CameraResectioning.cpp.o.provides.build
.PHONY : examples/CMakeFiles/CameraResectioning.dir/CameraResectioning.cpp.o.provides

examples/CMakeFiles/CameraResectioning.dir/CameraResectioning.cpp.o.provides.build: examples/CMakeFiles/CameraResectioning.dir/CameraResectioning.cpp.o

# Object files for target CameraResectioning
CameraResectioning_OBJECTS = \
"CMakeFiles/CameraResectioning.dir/CameraResectioning.cpp.o"

# External object files for target CameraResectioning
CameraResectioning_EXTERNAL_OBJECTS =

examples/CameraResectioning: examples/CMakeFiles/CameraResectioning.dir/CameraResectioning.cpp.o
examples/CameraResectioning: examples/CMakeFiles/CameraResectioning.dir/build.make
examples/CameraResectioning: gtsam/libgtsam.so.3.2.0
examples/CameraResectioning: /usr/lib/x86_64-linux-gnu/libboost_program_options.so
examples/CameraResectioning: /usr/lib/x86_64-linux-gnu/libboost_serialization.so
examples/CameraResectioning: /usr/lib/x86_64-linux-gnu/libboost_system.so
examples/CameraResectioning: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
examples/CameraResectioning: /usr/lib/x86_64-linux-gnu/libboost_thread.so
examples/CameraResectioning: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
examples/CameraResectioning: /usr/lib/x86_64-linux-gnu/libboost_regex.so
examples/CameraResectioning: /usr/lib/x86_64-linux-gnu/libboost_timer.so
examples/CameraResectioning: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
examples/CameraResectioning: /usr/lib/libtbb.so
examples/CameraResectioning: /usr/lib/libtbbmalloc.so
examples/CameraResectioning: examples/CMakeFiles/CameraResectioning.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable CameraResectioning"
	cd /home/bharat/gtsam/gtsam-3.2.0/build/examples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/CameraResectioning.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
examples/CMakeFiles/CameraResectioning.dir/build: examples/CameraResectioning
.PHONY : examples/CMakeFiles/CameraResectioning.dir/build

examples/CMakeFiles/CameraResectioning.dir/requires: examples/CMakeFiles/CameraResectioning.dir/CameraResectioning.cpp.o.requires
.PHONY : examples/CMakeFiles/CameraResectioning.dir/requires

examples/CMakeFiles/CameraResectioning.dir/clean:
	cd /home/bharat/gtsam/gtsam-3.2.0/build/examples && $(CMAKE_COMMAND) -P CMakeFiles/CameraResectioning.dir/cmake_clean.cmake
.PHONY : examples/CMakeFiles/CameraResectioning.dir/clean

examples/CMakeFiles/CameraResectioning.dir/depend:
	cd /home/bharat/gtsam/gtsam-3.2.0/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/bharat/gtsam/gtsam-3.2.0 /home/bharat/gtsam/gtsam-3.2.0/examples /home/bharat/gtsam/gtsam-3.2.0/build /home/bharat/gtsam/gtsam-3.2.0/build/examples /home/bharat/gtsam/gtsam-3.2.0/build/examples/CMakeFiles/CameraResectioning.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : examples/CMakeFiles/CameraResectioning.dir/depend

