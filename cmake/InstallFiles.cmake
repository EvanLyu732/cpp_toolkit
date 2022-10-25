macro(InstallFiles Files Destination)
    install(FILES ${Files}
            DESTINATION ${Destination}
    )
endmacro()
