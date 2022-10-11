cmake_minimum_required(VERSION 3.15 FATAL_ERROR)
project(cpp_toolkits)

set(CMAKE_CXX_STANDARD 17)
set(PROJECT_VERSION unreleased)

###########################
#  Generate Documentation #
###########################


# Make this module a install cmake module

# Provide a apt install way

include_directories(comm/log)
include_directories(comm/traits)

include(GNUInstallDirs)
include(CMakePackageConfigHelpers)

install(
        EXPORT cpp_toolkits
        DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/cpp_toolkits
        NAMESPACE cpp_toolkits::
        FILE cpp_toolkits.cmake
)

configure_package_config_file(
        "Config.cmake.in"
        "cpp_toolkitsConfig.cmake"
        INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/cpp_toolkits
        PATH_VARS
            CMAKE_INSTALL_LIBDIR
)


write_basic_package_version_file(
        ${PROJECT_SOURCE_DIR}/cpp_toolkitsConfigVersion.cmake
        COMPATIBILITY SameMajorVersion
)
