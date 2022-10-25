macro(InstallModule MODULE)
    include(GNUInstallDirs)
    include(${CMAKE_SOURCE_DIR}/cmake/colorPrint.cmake)
    log(==============================================)
    log(Ready to install module: ${MODULE}            )
    log(==============================================)

    set(CMAKE_INSTALL_BINDIR /usr/local/bin/${PROJECT_NAME})
    set(CMAKE_INSTALL_LIBDIR /usr/local/lib/${PROJECT_NAME})
    set(CMAKE_INSTALL_INCLUDEDIR /usr/local/include/${PROJECT_NAME})

    install(TARGETS ${MODULE}
            EXPORT ${MODULE}-targets
            RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}"
            LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}"
            ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}"
            PRIVATE_HEADER DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
            PUBLIC_HEADER  DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
    )

    install(EXPORT ${MODULE}-targets
            DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/cpp_toolkits"
            NAMESPACE cpp-toolkits::
            FILE ${MODULE}-target.cmake
    )
endmacro()