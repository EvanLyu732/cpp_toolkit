macro(findPackage PackageName)
    if (NOT ${PackageName}_FOUND)
        log(=====================================)
        log(Start to find package: ${PackageName})
        log(=====================================)
        find_package(${PackageName} REQUIRED)
    endif()
endmacro()