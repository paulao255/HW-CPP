cmake_minimum_required(VERSION 4.2.2)
project(HW-CPP LANGUAGES CXX VERSION 20260128)
set(CMAKE_CXX_STANDARD 98) # 98 for C++98, 11 for C++11, 14 for C++14, 17 for C++17, 20 for C++20, 23 for C++23 and 26 for C++26.
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_FLAGS "-fdiagnostics-color=always -Wall -Wextra -Wpedantic -Wshadow -Wconversion -Wsign-conversion -Wformat=2 -Wnull-dereference -Wcast-align -Wpointer-arith -Wundef -v -O3 -funroll-loops -flto -mtune=native -march=native")
add_executable(executable ../src/Main.cpp)
set_target_properties(executable PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
