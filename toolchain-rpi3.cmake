SET(MAKE_SYSTEM_NAME Linux)
SET(MAKE_SYSTEM_VERSION 1)

# Define toolchain directory
SET(TOOLCHAIN_DIR $ENV{HOME}/Work/ct-ng/armv8-rpi3-linux-gnueabihf)

# Specify the cross compiler
SET(CMAKE_C_COMPILER   ${TOOLCHAIN_DIR}/bin/armv8-rpi3-linux-gnueabihf-gcc)
SET(CMAKE_CXX_COMPILER ${TOOLCHAIN_DIR}/bin/armv8-rpi3-linux-gnueabihf-g++)

# Where is the target environment
SET(CMAKE_FIND_ROOT_PATH ${TOOLCHAIN_DIR}/armv8-rpi3-linux-gnueabihf/sysroot)

# Adjust default behaviour of the FIND_xxx() commands :
#
# search programs in the host environment
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

# search headers and libraries in the target environment
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY BOTH)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE BOTH)

