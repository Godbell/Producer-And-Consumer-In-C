cmake_minimum_required(VERSION 3.17)
project(MyShell C)

set(CMAKE_C_STANDARD 99)

add_executable(MyShell synch_mutex.c synch_semaphore.c)