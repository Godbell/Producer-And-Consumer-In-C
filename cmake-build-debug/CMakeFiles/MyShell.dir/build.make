# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.19

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
CMAKE_COMMAND = /cygdrive/c/Users/김종하/AppData/Local/JetBrains/CLion2021.1/cygwin_cmake/bin/cmake.exe

# The command to remove a file.
RM = /cygdrive/c/Users/김종하/AppData/Local/JetBrains/CLion2021.1/cygwin_cmake/bin/cmake.exe -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /cygdrive/c/Users/김종하/Documents/Programming/Producer-And-Consumer-In-C

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /cygdrive/c/Users/김종하/Documents/Programming/Producer-And-Consumer-In-C/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/MyShell.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/MyShell.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/MyShell.dir/flags.make

CMakeFiles/MyShell.dir/synch_mutex.c.o: CMakeFiles/MyShell.dir/flags.make
CMakeFiles/MyShell.dir/synch_mutex.c.o: ../synch_mutex.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/cygdrive/c/Users/김종하/Documents/Programming/Producer-And-Consumer-In-C/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/MyShell.dir/synch_mutex.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/MyShell.dir/synch_mutex.c.o -c /cygdrive/c/Users/김종하/Documents/Programming/Producer-And-Consumer-In-C/synch_mutex.c

CMakeFiles/MyShell.dir/synch_mutex.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/MyShell.dir/synch_mutex.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /cygdrive/c/Users/김종하/Documents/Programming/Producer-And-Consumer-In-C/synch_mutex.c > CMakeFiles/MyShell.dir/synch_mutex.c.i

CMakeFiles/MyShell.dir/synch_mutex.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/MyShell.dir/synch_mutex.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /cygdrive/c/Users/김종하/Documents/Programming/Producer-And-Consumer-In-C/synch_mutex.c -o CMakeFiles/MyShell.dir/synch_mutex.c.s

CMakeFiles/MyShell.dir/synch_semaphore.c.o: CMakeFiles/MyShell.dir/flags.make
CMakeFiles/MyShell.dir/synch_semaphore.c.o: ../synch_semaphore.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/cygdrive/c/Users/김종하/Documents/Programming/Producer-And-Consumer-In-C/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/MyShell.dir/synch_semaphore.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/MyShell.dir/synch_semaphore.c.o -c /cygdrive/c/Users/김종하/Documents/Programming/Producer-And-Consumer-In-C/synch_semaphore.c

CMakeFiles/MyShell.dir/synch_semaphore.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/MyShell.dir/synch_semaphore.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /cygdrive/c/Users/김종하/Documents/Programming/Producer-And-Consumer-In-C/synch_semaphore.c > CMakeFiles/MyShell.dir/synch_semaphore.c.i

CMakeFiles/MyShell.dir/synch_semaphore.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/MyShell.dir/synch_semaphore.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /cygdrive/c/Users/김종하/Documents/Programming/Producer-And-Consumer-In-C/synch_semaphore.c -o CMakeFiles/MyShell.dir/synch_semaphore.c.s

# Object files for target MyShell
MyShell_OBJECTS = \
"CMakeFiles/MyShell.dir/synch_mutex.c.o" \
"CMakeFiles/MyShell.dir/synch_semaphore.c.o"

# External object files for target MyShell
MyShell_EXTERNAL_OBJECTS =

MyShell.exe: CMakeFiles/MyShell.dir/synch_mutex.c.o
MyShell.exe: CMakeFiles/MyShell.dir/synch_semaphore.c.o
MyShell.exe: CMakeFiles/MyShell.dir/build.make
MyShell.exe: CMakeFiles/MyShell.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/cygdrive/c/Users/김종하/Documents/Programming/Producer-And-Consumer-In-C/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable MyShell.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/MyShell.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/MyShell.dir/build: MyShell.exe

.PHONY : CMakeFiles/MyShell.dir/build

CMakeFiles/MyShell.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/MyShell.dir/cmake_clean.cmake
.PHONY : CMakeFiles/MyShell.dir/clean

CMakeFiles/MyShell.dir/depend:
	cd /cygdrive/c/Users/김종하/Documents/Programming/Producer-And-Consumer-In-C/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /cygdrive/c/Users/김종하/Documents/Programming/Producer-And-Consumer-In-C /cygdrive/c/Users/김종하/Documents/Programming/Producer-And-Consumer-In-C /cygdrive/c/Users/김종하/Documents/Programming/Producer-And-Consumer-In-C/cmake-build-debug /cygdrive/c/Users/김종하/Documents/Programming/Producer-And-Consumer-In-C/cmake-build-debug /cygdrive/c/Users/김종하/Documents/Programming/Producer-And-Consumer-In-C/cmake-build-debug/CMakeFiles/MyShell.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/MyShell.dir/depend

