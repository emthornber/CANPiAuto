cmake_minimum_required(VERSION 3.16)
project("CANPiAuto"
        VERSION 0.1.0
        DESCRIPTION "A CBUS interface"
        LANGUAGES CXX
)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include(CTest)

add_subdirectory(canpi)
#add_subdirectory(hello_test)
#add_subdirectory(testing)
#add_subdirectory(testregex)
