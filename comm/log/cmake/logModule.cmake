project(log)
add_library(log INTERFACE)
add_library(cpp-toolkits::log ALIAS log)

target_include_directories(log INTERFACE
        $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/comm/log/include>
        $<INSTALL_INTERFACE:log/include>
        )


############# INSTALL MODULE ###########################
include(${PROJECT_SOURCE_DIR}/cmake/all.cmake)
InstallModule(log)

#file(GLOB HEADER
#
#)
InstallDirectory("${PROJECT_SOURCE_DIR}/comm/log/include" "/usr/local/include/cpp_toolkits/log")



