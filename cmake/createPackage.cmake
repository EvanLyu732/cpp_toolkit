set(CPACK_PACKAGE_NAME "cpp-toolkits")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "a cpp toolkits contain common utilities")
set(CPACK_GENERATOR "DEB")

# TODO: eg. libspdlog and so oe
#set(CPACK_DEBIAN_PACKAGE_DEPENDS)

set(CPACK_CMAKE_GENERATOR Ninja)
set(CPACK_PACKAGE_VENDOR "zheng.lv")
set(CPACK_VERBATIM_VARIABLES YES)
set(CPACK_PACKAGE_INSTALL_DIRECTORY ${CPACK_PACKAGE_NAME})
set(CPACK_OUTPUT_FILE_PREFIX "${CMAKE_SOURCE_DIR}/outputs")
set(CPACK_PACKAGING_INSTALL_PREFIX "/opt/cpp-toolkits")

set(CPACK_PACKAGE_VERSION_MAJOR ${PROJECT_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${PROJECT_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${PROJECT_VERSION_PATCH})

set(CPACK_DEBIAN_PACKAGE_CONTROL_EXTRA
        ${PROJECT_SOURCE_DIR}/deb/preinst
        ${PROJECT_SOURCE_DIR}/deb/prerm
        ${PROJECT_SOURCE_DIR}/deb/postinst
        ${PROJECT_SOURCE_DIR}/deb/postrm
)

set(CPACK_PACKAGE_CONTACT "zhengshushu1997@gmail.com")
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "evanlyu")

set(CPACK_DEBIAN_FILE_NAME DEB-DEFAULT)
set(CPACK_COMPONENTS_GROUPING ALL_COMPONENTS_IN_ONE)
set(CPACK_DEB_COMPONENT_INSTALL YES)

include(CPack)

log_debug(==========================================)
# From https://github.com/retifrav/cmake-cpack-example.git
log_debug(Component to pack: ${CPACK_COMPONENTS_ALL})
log_debug(==========================================)
