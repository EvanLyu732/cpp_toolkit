# trigger spdlog
macro(enable_logging LOG_MODULE BIND_PORT SEND_PORT)

    set(LOG_MODULE "test_spdlog")
    set(BIND_PORT 6782)
    set(SEND_PORT 7893)

    configure_file(${CMAKE_SOURCE_DIR}/comm/log/test_struct.hpp.in ${CMAKE_SOURCE_DIR}/comm/log/test_struct.hpp @ONLY)
#    configure_file(${CMAKE_SOURCE_DIR}/test_struct.hpp.in ${CMAKE_SOURCE_DIR}/test_struct.hpp @ONLY)

    find_package(spdlog REQUIRED)
    find_package(Boost REQUIRED COMPONENTS system)

endmacro()
