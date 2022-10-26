cmake_minimum_required(VERSION 3.10 FATAL_ERROR)
project(cpp_toolkits)

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

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Werror")
set(CMAKE_GENERATOR "Unix Makefiles" CACHE INTERNAL "" FORCE)
set(PROJECT_VERSION unreleased)

log(=========================================)
log(Using generator: ${CMAKE_GENERATOR})
log(=========================================)

###########################
# Static check for format #
###########################
find_program(CLANG_TIDY_EXECUTABLE NAMES ".clang-tidy" REQUIRED)
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


#include(${PROJECT_SOURCE_DIR}/comm/traits)

###########################
#   Install    begin      #
###########################
log(==================================)
log(Install begin)
log(==================================)
installPackage()

include(${PROJECT_SOURCE_DIR}/comm/log/cmake/logModule.cmake)
include(${PROJECT_SOURCE_DIR}/comm/doc/cmake/docModule.cmake)



