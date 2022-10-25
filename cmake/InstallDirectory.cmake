macro(InstallDirectory Dir Destination)
    install(DIRECTORY ${Dir}
            DESTINATION ${Destination}
    )
endmacro()