macro(fetchlibs LIB_NAME URL GIT_TAG)
    include(FetchContent)
    FetchContent_Declare(
            ${LIB_NAME}
            GIT_REPOSITORY ${URL}
            GIT TAG ${GIT_TAG}
    )
    FetchContent_MakeAvailable(${LIB_NAME})
endmacro()