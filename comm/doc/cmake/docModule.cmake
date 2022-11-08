project(doc)
add_library(doc INTERFACE)
add_library(cpp-toolkits::doc ALIAS doc)

target_include_directories(doc INTERFACE
        $<BUILD_INTERFACE:${CMAKE_SOURCE_DIR}/comm/doc>
        $<INSTALL_INTERFACE:doc>
        )

############# INSTALL MODULE ###########################
include(${PROJECT_SOURCE_DIR}/cmake/all.cmake)
#InstallModule(doc)
