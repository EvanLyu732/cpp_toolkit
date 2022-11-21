project(log)

set(LOG_MODULE_HDRS
        "${PROJECT_SOURCE_DIR}/comm/log/include/log.h"
        "${PROJECT_SOURCE_DIR}/comm/log/include/native_log.hpp"
        "${PROJECT_SOURCE_DIR}/comm/log/include/spdlog.hpp"
        "${PROJECT_SOURCE_DIR}/comm/log/include/.spdlog.toml"
        )

add_library(log INTERFACE
        ${LOG_MODULE_HDRS}
        )


set_target_properties(log PROPERTIES
        PUBLIC_HEADER
        "${LOG_MODULE_HDRS}"
        )

add_library(cpp-toolkits::log ALIAS log)

include(all)

findPackage(spdlog)
findPackage(Threads)

if (NOT Boost_FOUND)
    find_package(Boost REQUIRED COMPONENTS system)
endif ()

add_dependencies(log
        spdlog::spdlog
        Threads::Threads
        )

target_include_directories(log INTERFACE
        $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/comm/log/include>
        $<INSTALL_INTERFACE:cpp_toolkits/log>
        )

include(all)

#set_target_properties(log PROPERTIES
#        IMPORTED_GLOBAL TRUE
#)

target_link_libraries(log INTERFACE
        spdlog::spdlog
        Boost::boost
        Threads::Threads
        )

############# INSTALL MODULE ###########################
InstallModule(log)

#file(GLOB HEADER
#
#)
#InstallDirectory("${PROJECT_SOURCE_DIR}/comm/log/include" "/usr/local/include/cpp_toolkits/log")



