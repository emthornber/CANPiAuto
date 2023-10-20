# This file will be configured to contain variables for CPack. These variables
# should be set in the CMake list file of the project before CPack module is
# included. The list of available CPACK_xxx variables and their associated
# documentation may be obtained using
#  cpack --help-variable-list
#
# Some variables are common to all generators (e.g. CPACK_PACKAGE_NAME)
# and some are specific to a generator
# (e.g. CPACK_NSIS_EXTRA_INSTALL_COMMANDS). The generator specific variables
# usually begin with CPACK_<GENNAME>_xxxx.


set(CPACK_BUILD_SOURCE_DIRS "/work;/work")
set(CPACK_CMAKE_GENERATOR "Unix Makefiles")
set(CPACK_COMPONENTS_GROUPING "ALL_COMPONENTS_IN_ONE")
set(CPACK_COMPONENT_UNSPECIFIED_HIDDEN "TRUE")
set(CPACK_COMPONENT_UNSPECIFIED_REQUIRED "TRUE")
set(CPACK_DEBIAN_FILE_NAME "DEB-DEFAULT")
set(CPACK_DEBIAN_PACKAGE_CONTROL_EXTRA "/work/canpi/scripts/postinst;/work/canpi/scripts/prerm")
set(CPACK_DEBIAN_PACKAGE_DEPENDS "log4cpp pthreads python3")
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "E M Thornber <enchanted.systems@btinternet.com>")
set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS "YES")
set(CPACK_DEB_COMPONENT_INSTALL "YES")
set(CPACK_DEFAULT_PACKAGE_DESCRIPTION_FILE "/usr/share/cmake-3.27/Templates/CPack.GenericDescription.txt")
set(CPACK_DEFAULT_PACKAGE_DESCRIPTION_SUMMARY "CANPiAuto built using CMake")
set(CPACK_DMG_SLA_USE_RESOURCE_FILE_LICENSE "ON")
set(CPACK_GENERATOR "TBZ2;TGZ;TXZ;TZ")
set(CPACK_IGNORE_FILES "/CVS/;/\\.svn/;/\\.bzr/;/\\.hg/;/\\.git/;\\.swp\$;\\.#;/#")
set(CPACK_INNOSETUP_ARCHITECTURE "x86")
set(CPACK_INSTALLED_DIRECTORIES "/work;/")
set(CPACK_INSTALL_CMAKE_PROJECTS "")
set(CPACK_INSTALL_DEFAULT_DIRECTORY_PERMISSIONS "OWNER_READ;OWNER_WRITE;OWNER_EXECUTE;GROUP_READ;GROUP_EXECUTE;WORLD_READ;WORLD_EXECUTE")
set(CPACK_INSTALL_PREFIX "/work/install")
set(CPACK_MODULE_PATH "/work/cmake")
set(CPACK_NSIS_DISPLAY_NAME "MERG-canpi")
set(CPACK_NSIS_INSTALLER_ICON_CODE "")
set(CPACK_NSIS_INSTALLER_MUI_ICON_CODE "")
set(CPACK_NSIS_INSTALL_ROOT "\$PROGRAMFILES")
set(CPACK_NSIS_PACKAGE_NAME "MERG-canpi")
set(CPACK_NSIS_UNINSTALL_NAME "Uninstall")
set(CPACK_OBJCOPY_EXECUTABLE "/usr/xcc/armv6-unknown-linux-gnueabihf/bin/armv6-unknown-linux-gnueabihf-objcopy")
set(CPACK_OBJDUMP_EXECUTABLE "/usr/xcc/armv6-unknown-linux-gnueabihf/bin/armv6-unknown-linux-gnueabihf-objdump")
set(CPACK_OUTPUT_CONFIG_FILE "/work/CPackConfig.cmake")
set(CPACK_OUTPUT_FILE_PREFIX "/work/_packages")
set(CPACK_PACKAGE_CONTACT "enchanted.systems@btinternet.com")
set(CPACK_PACKAGE_DEFAULT_LOCATION "/")
set(CPACK_PACKAGE_DESCRIPTION_FILE "/usr/share/cmake-3.27/Templates/CPack.GenericDescription.txt")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "MERG CBUS interface")
set(CPACK_PACKAGE_FILE_NAME "MERG-canpi-0.1.0-Source")
set(CPACK_PACKAGE_INSTALL_DIRECTORY "MERG-canpi")
set(CPACK_PACKAGE_INSTALL_REGISTRY_KEY "MERG-canpi")
set(CPACK_PACKAGE_NAME "MERG-canpi")
set(CPACK_PACKAGE_RELOCATABLE "true")
set(CPACK_PACKAGE_VENDOR "Enchanted Systems Limited")
set(CPACK_PACKAGE_VERSION "0.1.0")
set(CPACK_PACKAGE_VERSION_MAJOR "0")
set(CPACK_PACKAGE_VERSION_MINOR "1")
set(CPACK_PACKAGE_VERSION_PATCH "0")
set(CPACK_PACKAGING_INSTALL_PREFIX "/usr/local")
set(CPACK_READELF_EXECUTABLE "/usr/xcc/armv6-unknown-linux-gnueabihf/bin/armv6-unknown-linux-gnueabihf-readelf")
set(CPACK_RESOURCE_FILE_LICENSE "/work/canpi/LICENSE")
set(CPACK_RESOURCE_FILE_README "/work/canpi/README.md")
set(CPACK_RESOURCE_FILE_WELCOME "/usr/share/cmake-3.27/Templates/CPack.GenericWelcome.txt")
set(CPACK_RPM_PACKAGE_SOURCES "ON")
set(CPACK_SET_DESTDIR "OFF")
set(CPACK_SOURCE_GENERATOR "TBZ2;TGZ;TXZ;TZ")
set(CPACK_SOURCE_IGNORE_FILES "/CVS/;/\\.svn/;/\\.bzr/;/\\.hg/;/\\.git/;\\.swp\$;\\.#;/#")
set(CPACK_SOURCE_INSTALLED_DIRECTORIES "/work;/")
set(CPACK_SOURCE_OUTPUT_CONFIG_FILE "/work/CPackSourceConfig.cmake")
set(CPACK_SOURCE_PACKAGE_FILE_NAME "MERG-canpi-0.1.0-Source")
set(CPACK_SOURCE_RPM "OFF")
set(CPACK_SOURCE_TBZ2 "ON")
set(CPACK_SOURCE_TGZ "ON")
set(CPACK_SOURCE_TOPLEVEL_TAG "Linux-Source")
set(CPACK_SOURCE_TXZ "ON")
set(CPACK_SOURCE_TZ "ON")
set(CPACK_SOURCE_ZIP "OFF")
set(CPACK_STRIP_FILES "")
set(CPACK_SYSTEM_NAME "Linux")
set(CPACK_THREADS "1")
set(CPACK_TOPLEVEL_TAG "Linux-Source")
set(CPACK_VERBATIM_VARIABLES "YES")
set(CPACK_WIX_SIZEOF_VOID_P "4")

if(NOT CPACK_PROPERTIES_FILE)
  set(CPACK_PROPERTIES_FILE "/work/CPackProperties.cmake")
endif()

if(EXISTS ${CPACK_PROPERTIES_FILE})
  include(${CPACK_PROPERTIES_FILE})
endif()
