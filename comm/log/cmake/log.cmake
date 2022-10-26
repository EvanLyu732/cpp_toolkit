# Parameter:
#    LOG MODULE: folder name
#    BIND_PORT: network sinker register port
#    SEND_PORT: network sinker publish port

macro(find_log_deps)
    if (NOT Threads_FOUND)
        find_package(Threads REQUIRED)
    endif ()
    if (NOT spdlog_FOUND)
        find_package(spdlog REQUIRED)
    endif ()
    if (NOT Boost_FOUND)
        find_package(Boost REQUIRED COMPONENTS system)
    endif ()
endmacro()


macro(log_setup TARGET)
    find_log_deps()
    target_link_libraries(TARGET ${TARGET} PRIVATE
            Threads::Threads
            spdlog::spdlog
            ${Boost_LIBRARIES}
    )
endmacro()


macro(enable_logging LOG_MODULE BIND_PORT SEND_PORT)
    find_log_deps()
    set(LOG_MODULE LOG_MODULE)
    set(BIND_PORT BIND_PORT)
    set(SEND_PORT SEND_PORT)

    # if this file is installed; then cp installed file to log.h location; else configure_file directly

    # replace this line with your spdlog.hpp location. example
    configure_file(${CMAKE_SOURCE_DIR}/include/spdlog.hpp.in ${CMAKE_SOURCE_DIR}/include/spdlog.hpp @ONLY)
endmacro()

