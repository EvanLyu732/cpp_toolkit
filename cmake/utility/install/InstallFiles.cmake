macro(InstallFiles Module Files Destination)
    install(FILES ${Files}
            DESTINATION ${Destination}
            COMPONENT ${Module}-${Files}
    )
    list(APPEND CPACK_ADD_TARGETS ${Module}-${Files})
endmacro()
