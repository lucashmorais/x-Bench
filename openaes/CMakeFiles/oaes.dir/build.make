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

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/mino/Documents/unicamp/MC723/lab1/openaes

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/mino/Documents/unicamp/MC723/lab1/openaes

# Include any dependencies generated for this target.
include CMakeFiles/oaes.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/oaes.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/oaes.dir/flags.make

CMakeFiles/oaes.dir/src/oaes.c.o: CMakeFiles/oaes.dir/flags.make
CMakeFiles/oaes.dir/src/oaes.c.o: src/oaes.c
	$(CMAKE_COMMAND) -E cmake_progress_report /home/mino/Documents/unicamp/MC723/lab1/openaes/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building C object CMakeFiles/oaes.dir/src/oaes.c.o"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -o CMakeFiles/oaes.dir/src/oaes.c.o   -c /home/mino/Documents/unicamp/MC723/lab1/openaes/src/oaes.c

CMakeFiles/oaes.dir/src/oaes.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/oaes.dir/src/oaes.c.i"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -E /home/mino/Documents/unicamp/MC723/lab1/openaes/src/oaes.c > CMakeFiles/oaes.dir/src/oaes.c.i

CMakeFiles/oaes.dir/src/oaes.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/oaes.dir/src/oaes.c.s"
	/usr/bin/cc  $(C_DEFINES) $(C_FLAGS) -S /home/mino/Documents/unicamp/MC723/lab1/openaes/src/oaes.c -o CMakeFiles/oaes.dir/src/oaes.c.s

CMakeFiles/oaes.dir/src/oaes.c.o.requires:
.PHONY : CMakeFiles/oaes.dir/src/oaes.c.o.requires

CMakeFiles/oaes.dir/src/oaes.c.o.provides: CMakeFiles/oaes.dir/src/oaes.c.o.requires
	$(MAKE) -f CMakeFiles/oaes.dir/build.make CMakeFiles/oaes.dir/src/oaes.c.o.provides.build
.PHONY : CMakeFiles/oaes.dir/src/oaes.c.o.provides

CMakeFiles/oaes.dir/src/oaes.c.o.provides.build: CMakeFiles/oaes.dir/src/oaes.c.o

# Object files for target oaes
oaes_OBJECTS = \
"CMakeFiles/oaes.dir/src/oaes.c.o"

# External object files for target oaes
oaes_EXTERNAL_OBJECTS =

oaes: CMakeFiles/oaes.dir/src/oaes.c.o
oaes: CMakeFiles/oaes.dir/build.make
oaes: liboaes_lib.a
oaes: CMakeFiles/oaes.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking C executable oaes"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/oaes.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/oaes.dir/build: oaes
.PHONY : CMakeFiles/oaes.dir/build

CMakeFiles/oaes.dir/requires: CMakeFiles/oaes.dir/src/oaes.c.o.requires
.PHONY : CMakeFiles/oaes.dir/requires

CMakeFiles/oaes.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/oaes.dir/cmake_clean.cmake
.PHONY : CMakeFiles/oaes.dir/clean

CMakeFiles/oaes.dir/depend:
	cd /home/mino/Documents/unicamp/MC723/lab1/openaes && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mino/Documents/unicamp/MC723/lab1/openaes /home/mino/Documents/unicamp/MC723/lab1/openaes /home/mino/Documents/unicamp/MC723/lab1/openaes /home/mino/Documents/unicamp/MC723/lab1/openaes /home/mino/Documents/unicamp/MC723/lab1/openaes/CMakeFiles/oaes.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/oaes.dir/depend
