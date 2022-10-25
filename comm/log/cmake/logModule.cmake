project(log)
add_library(log INTERFACE)
add_library(cpp-toolkits::log ALIAS log)

target_include_directories(log INTERFACE
        $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/comm/log/include>
        $<INSTALL_INTERFACE:log/include>
)

############# INSTALL MODULE ###########################
include(${PROJECT_SOURCE_DIR}/cmake/InstallModule.cmake)
InstallModule(log)



