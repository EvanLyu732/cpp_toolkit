macro(enableDoxygen PROJECT_DIR OUTPUT_DIR)
    log(==============================)
    log("Ready to build documentation")
    log(==============================)

    if (NOT Doxygen_FOUND)
        find_package(Doxygen REQUIRED dot mscgen dia)
    endif ()

    set(INPUT ${PROJECT_DIR})
    set(RECURSIVE YES)
    set(OUTPUT_DIRECTORY ${OUTPUT_DIR})

    set(DOXYGEN_GENERATE_HTML YES)
    set(DOXYGEN_GENERATE_MAN NO)

    file(REMOVE ${PROJECT_DIR}/doc/Doxyfile)

    configure_file(${PROJECT_DIR}/comm/doc/Doxyfile.in
            ${PROJECT_DIR}/comm/doc/Doxyfile
            @ONLY
            )

    set(DOXYGEN_IN ${PROJECT_DIR}/comm/doc/Doxyfile)

    add_custom_target(
            doc_doxygen ALL
            COMMAND ${DOXYGEN_EXECUTABLE} ${DOXYGEN_IN}
            COMMENT "Generate API documentation with Doxygen"
            VERBATIM
    )
endmacro()