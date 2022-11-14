macro(InstallFiles Module Files Destination)
    install(FILES ${Files}
            DESTINATION ${Destination}
            COMPONENT ${Module}-${Files}
    )
    cpack_add_component(${Module}-${Files})
endmacro()
