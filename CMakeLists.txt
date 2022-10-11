cmake_minimum_required(VERSION 3.15 FATAL_ERROR)
project(cpp_toolkits)

set(CMAKE_CXX_STANDARD 17)

# Build Log Module Required
find_package(spdlog REQUIRED)
#find_package(Boost REQUIRED)

include_directories(comm)