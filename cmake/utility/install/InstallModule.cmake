macro(InstallModule MODULE)
    include(GNUInstallDirs)
    include(CMakePackageConfigHelpers)
    set(PROJECT_NAME cpp_toolkits)
    set(MODULE_NAME MODULE)

    log(==============================================)
    log(Ready to install module: ${MODULE}            )
    log(==============================================)

    set(CMAKE_INSTALL_BINDIR bin/${PROJECT_NAME})
    set(CMAKE_INSTALL_LIBDIR lib/${PROJECT_NAME})
    set(CMAKE_INSTALL_INCLUDEDIR include/${PROJECT_NAME})

    install(TARGETS ${MODULE}
            EXPORT ${MODULE}-targets
            COMPONENT ${MODULE}
            RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}"
            LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}"
            ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}"
            PRIVATE_HEADER DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
            PUBLIC_HEADER  DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}/${MODULE}"
            INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
    )

    log_debug(------------------ Debug Beginning -----------------------------)
    log_debug( Export targets, file: "${MODULE}-targets.cmake"                )
    log_debug(----------------------------------------------------------------)

    install(EXPORT ${MODULE}-targets
            FILE ${PROJECT_NAME}-${MODULE}-targets.cmake
            NAMESPACE ${PROJECT_NAME}::
            DESTINATION lib/cmake/${PROJECT_NAME}
    )

    configure_package_config_file("${PROJECT_SOURCE_DIR}/comm/${MODULE}/cmake/${MODULE}-config.cmake.in"
            "${CMAKE_BINARY_DIR}/${PROJECT_NAME}-${MODULE}-config.cmake"
            INSTALL_DESTINATION lib/cmake/cpp_toolkits/${MODULE}
    )

#    configure_file("${PROJECT_SOURCE_DIR}/comm/${MODULE}/cmake/${MODULE}-config.cmake.in"
#            "${CMAKE_BINARY_DIR}/${PROJECT_NAME}-${MODULE}-config.cmake"
#            @ONLY
#    )

    write_basic_package_version_file(
            "${CMAKE_BINARY_DIR}/${PROJECT_NAME}-${MODULE}-config-version.cmake"
            VERSION ${VERSION}
            COMPATIBILITY AnyNewerVersion
    )

    install(
        FILES
          "${CMAKE_BINARY_DIR}/${PROJECT_NAME}-${MODULE}-config.cmake"
          "${CMAKE_BINARY_DIR}/${PROJECT_NAME}-${MODULE}-config-version.cmake"
        DESTINATION lib/cmake/cpp_toolkits
        COMPONENT ${MODULE}
    )

    cpack_add_component(${MODULE})
    log(==============================================)
    log(Cpack adding module component: ${MODULE}      )
    log(==============================================)
endmacro()