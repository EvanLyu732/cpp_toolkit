macro(InstallDirectory Module Dir Destination)
    install(DIRECTORY ${Dir}
            DESTINATION ${Destination}
            COMPONENT ${Module}-${Dir}
    )
    list(APPEND CPACK_ADD_TARGETS ${Module}-${Dir})
endmacro()