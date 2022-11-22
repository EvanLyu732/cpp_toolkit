cmake_minimum_required(VERSION 3.10 FATAL_ERROR)
project(test_cpp_toolkits)

add_compile_options(-std=c++17)
add_compile_options(-lstdc++fs)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_COMPILER /usr/bin/g++-11)

find_package(cpp_toolkits REQUIRED COMPONENTS log)

add_executable(test_log_module
  main.cpp
)

# The correct way should be set cmake prefix path, but for demo usage
# simply include log module cmake.
include(/usr/local/lib/cmake/cpp_toolkits/log.cmake)

# find required lib for log module
find_log_deps()

# setup target dependencies using this macro
log_setup(test_cpp_toolkits)


