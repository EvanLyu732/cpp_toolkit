macro(installPackage)
    include(GNUInstallDirs)
    include(GenerateExportHeader)
    include(CMakePackageConfigHelpers)

    log(==============================================)
    log(Ready to install package: cpp_toolkits        )
    log(==============================================)

    configure_package_config_file(
            "${PROJECT_SOURCE_DIR}/cmake/Config.cmake.in"
            "${PROJECT_SOURCE_DIR}/cmake/cpp_toolkits-config.cmake"
            INSTALL_DESTINATION /usr/local/lib/cmake/cpp_toolkits
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
            DESTINATION /usr/local/lib/cmake/cpp_toolkits
    )
endmacro()