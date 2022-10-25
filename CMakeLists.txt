cmake_minimum_required(VERSION 3.10 FATAL_ERROR)
project(cpp_toolkits)

set(CMAKE_CXX_STANDARD 17)
set(PROJECT_VERSION unreleased)

###########################
#  General include        #
###########################
include(${CMAKE_SOURCE_DIR}/cmake/all.cmake)

###########################
#  Generate Documentation #
###########################
#enableDoxygen()


#include(${PROJECT_SOURCE_DIR}/comm/traits)

###########################
#   Install    begin      #
###########################
log(==================================)
log(Install begin)
log(==================================)
installPackage()
include(${PROJECT_SOURCE_DIR}/comm/log/cmake/logModule.cmake)



