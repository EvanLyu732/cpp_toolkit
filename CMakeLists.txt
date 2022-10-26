cmake_minimum_required(VERSION 3.10 FATAL_ERROR)
project(cpp_toolkits)

set(CMAKE_CXX_STANDARD 17)
set(PROJECT_VERSION unreleased)


###########################
# Static check for format #
###########################


###########################
#  General include        #
###########################
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")
include(all)

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



