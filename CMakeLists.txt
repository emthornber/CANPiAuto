cmake_minimum_required(VERSION 3.16)
project("CANPiAuto"
        VERSION 0.1.0
        DESCRIPTION "A CBUS interface"
        LANGUAGES CXX
)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Cannot run any tests as we are cross-compiling for armv6 (RPiZeroW)
#include(CTest)

add_subdirectory(canpi)
