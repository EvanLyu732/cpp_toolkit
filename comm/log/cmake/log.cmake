# Parameter:
#    LOG MODULE: folder name
#    BIND_PORT: network sinker register port
#    SEND_PORT: network sinker publish port

macro(enable_logging LOG_MODULE BIND_PORT SEND_PORT)
    if(NOT spdlog_FOUND)
        find_package(spdlog REQUIRED)
    endif()
    if(NOT Boost_FOUND)
        find_package(Boost REQUIRED COMPONENTS system)
    endif()

    set(LOG_MODULE LOG_MODULE)
    set(BIND_PORT BIND_PORT)
    set(SEND_PORT SEND_PORT)

    # if this file is installed; then cp installed file to log.h location; else configure_file directly

    # replace this line with your spdlog.hpp.in location. example
    configure_file(${CMAKE_SOURCE_DIR}/include/spdlog.hpp.in ${CMAKE_SOURCE_DIR}/include/spdlog.hpp @ONLY)
endmacro()

