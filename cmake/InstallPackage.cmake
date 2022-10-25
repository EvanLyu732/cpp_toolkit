macro(installPackage)
    include(GNUInstallDirs)
    include(GenerateExportHeader)
    include(CMakePackageConfigHelpers)
    log(==============================================)
    log(Ready to install package: cpp_toolkits        )
    log(==============================================)

    configure_package_config_file(
            "${PROJECT_SOURCE_DIR}/cmake/Config.cmake.in"
            "${PROJECT_SOURCE_DIR}/cmake/cpp_toolkitsConfig.cmake"
            INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/cpp_toolkits
            PATH_VARS
                CMAKE_INSTALL_LIBDIR
    )

    write_basic_package_version_file(
            ${PROJECT_SOURCE_DIR}/cmake/cpp_toolkitsConfigVersion.cmake
            COMPATIBILITY SameMajorVersion
    )

    ############# Install Packge ##################################
    install(FILES ${PROJECT_SOURCE_DIR}/cmake/cpp_toolkitsConfigVersion.cmake
            DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/cpp_toolkits"
    )
    ############# Install Packge ##################################
    install(FILES ${PROJECT_SOURCE_DIR}/cmake/cpp_toolkitsConfig.cmake
            DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/cpp_toolkits"
            )
endmacro()