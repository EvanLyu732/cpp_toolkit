cmake_minimum_required(VERSION 3.20 FATAL_ERROR)
project(cpp_toolkits)
set(VERSION 0.0.1)

###########################
#  General include        #
###########################
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
include(all)

###############################
# Setting cmake               #
###############################
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED  ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON CACHE INTERNAL "")

add_compile_options(-fvisibility=hidden)
add_compile_options(-fvisibility-inline-hidden)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Werror")
set(CMAKE_GENERATOR "Ninja" CACHE INTERNAL "" FORCE)
set(PROJECT_VERSION unreleased)

log(=========================================)
log(Using generator: ${CMAKE_GENERATOR})
log(=========================================)

###########################
# Static check for format #
###########################
find_program(CLANG_TIDY_EXECUTABLE NAMES "clang-tidy" REQUIRED)
set(CMAKE_CXX_CLANG_TIDY "clang-tidy")
set(CLANG_TIDY_CMD "${CMAKE_CXX_CLANG_TIDY}" "-check=-*,modernize-*")

set_property(GLOBAL PROPERTY
        CXX_CLANG_TIDY ${CLANG_TIDY_CMD}
)

###########################
#  Generate Documentation #
###########################
include(${PROJECT_SOURCE_DIR}/comm/doc/cmake/enableDoxygen.cmake)
enableDoxygen(${PROJECT_SOURCE_DIR} ${PROJECT_SOURCE_DIR}/doc)

###########################
#   Testing    begin      #
###########################

#include(${PROJECT_SOURCE_DIR}/comm/traits)

###########################
#   Install    begin      #
###########################
log(==================================)
log(Install begin)
log(==================================)

include(${PROJECT_SOURCE_DIR}/comm/log/cmake/logModule.cmake)
include(${PROJECT_SOURCE_DIR}/comm/doc/cmake/docModule.cmake)

installPackage()


###############################
#   Create cmake package      #
###############################
include(createPackage)



