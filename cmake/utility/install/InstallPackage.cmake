macro(installPackage)
    include(GNUInstallDirs)
    include(GenerateExportHeader)
    include(CMakePackageConfigHelpers)

    set(PROJECT_NAME cpp_toolkits)

    log(==============================================)
    log(Ready to install package: cpp_toolkits        )
    log(==============================================)

    configure_package_config_file(
            "${PROJECT_SOURCE_DIR}/cmake/Package-Config.cmake.in"
            "${PROJECT_SOURCE_DIR}/cmake/cpp_toolkits-config.cmake"
            INSTALL_DESTINATION lib/cmake/${PROJECT_NAME}
            PATH_VARS
                CMAKE_INSTALL_LIBDIR
    )

    write_basic_package_version_file(
            ${PROJECT_SOURCE_DIR}/cmake/cpp_toolkits-config-version.cmake
            VERSION ${VERSION}
            COMPATIBILITY AnyNewerVersion
    )

    set(PACKAGE_CONFIG_CMAKE ${PROJECT_SOURCE_DIR}/cmake/cpp_toolkits-config-version.cmake)
    set(PACKAGE_CONFIG_VERSION_CMAKE ${PROJECT_SOURCE_DIR}/cmake/cpp_toolkits-config.cmake)

    ############# Install Packge ##################################
    install(FILES ${PACKAGE_CONFIG_CMAKE} ${PACKAGE_CONFIG_VERSION_CMAKE}
            DESTINATION lib/cmake/${PROJECT_NAME}
            COMPONENT ${PROJECT_NAME}
    )


#    export(
#            EXPORT "${PROJECT_NAME}-targets"
#            FILE "${CMAKE_CURRENT_BINARY_DIR}/cmake/${PROJECT_NAME}-targets.cmake"
#            NAMESPACE ${PROJECT_NAME}::
#    )
endmacro()