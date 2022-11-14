macro(InstallDirectory Module Dir Destination)
    install(DIRECTORY ${Dir}
            DESTINATION ${Destination}
            COMPONENT ${Module}-${Dir}
    )
    cpack_add_component(${Module}-${Dir})
endmacro()