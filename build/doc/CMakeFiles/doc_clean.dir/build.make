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

# Utility rule file for doc_clean.

# Include the progress variables for this target.
include doc/CMakeFiles/doc_clean.dir/progress.make

doc/CMakeFiles/doc_clean:
	$(CMAKE_COMMAND) -E cmake_progress_report /home/bharat/gtsam/gtsam-3.2.0/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold "Removing Doxygen documentation"
	cd /home/bharat/gtsam/gtsam-3.2.0/build/doc && cmake -E remove_directory /home/bharat/gtsam/gtsam-3.2.0/doc/latex
	cd /home/bharat/gtsam/gtsam-3.2.0/build/doc && cmake -E remove_directory /home/bharat/gtsam/gtsam-3.2.0/doc/html

doc_clean: doc/CMakeFiles/doc_clean
doc_clean: doc/CMakeFiles/doc_clean.dir/build.make
.PHONY : doc_clean

# Rule to build all files generated by this target.
doc/CMakeFiles/doc_clean.dir/build: doc_clean
.PHONY : doc/CMakeFiles/doc_clean.dir/build

doc/CMakeFiles/doc_clean.dir/clean:
	cd /home/bharat/gtsam/gtsam-3.2.0/build/doc && $(CMAKE_COMMAND) -P CMakeFiles/doc_clean.dir/cmake_clean.cmake
.PHONY : doc/CMakeFiles/doc_clean.dir/clean

doc/CMakeFiles/doc_clean.dir/depend:
	cd /home/bharat/gtsam/gtsam-3.2.0/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/bharat/gtsam/gtsam-3.2.0 /home/bharat/gtsam/gtsam-3.2.0/doc /home/bharat/gtsam/gtsam-3.2.0/build /home/bharat/gtsam/gtsam-3.2.0/build/doc /home/bharat/gtsam/gtsam-3.2.0/build/doc/CMakeFiles/doc_clean.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : doc/CMakeFiles/doc_clean.dir/depend

