cmake_minimum_required(VERSION 3.14)
project(CANPiAuto
        VERSION 0.1.0
        DESCRIPTION "A CBUS interface"
        LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 11)

include(FetchContent)
FetchContent_Declare(
	googletest
	URL https://github.com/google/googletest/archive/refs/tags/release-1.11.0.zip
)
FetchContent_MakeAvailable(googletest)

add_executable(canpi
        src/canHandler.cpp
        src/canHandler.h
        src/Client.cpp
        src/Client.h
        src/edSession.cpp
        src/edSession.h
        src/frameCAN.cpp
        src/frameCAN.h
        src/gpio.cpp
        src/gpio.h
        src/main.cpp
        src/msgdata.h
        src/nodeConfigurator.cpp
        src/nodeConfigurator.h
        src/opc_codes.cpp
        src/opc_codes.h
        src/opcodes.h
        src/sessionHandler.cpp
        src/sessionHandler.h
        src/tcpClient.cpp
        src/tcpClient.h
        src/tcpClientGridConnect.cpp
        src/tcpClientGridConnect.h
        src/tcpServer.cpp
        src/tcpServer.h
        src/Turnout.cpp
        src/Turnout.h
        src/utils.h)

target_compile_options(canpi PRIVATE -c -Wall -fpermissive -lm -g)
target_include_directories(canpi PRIVATE /usr/local/include /usr/include)
target_link_directories(canpi PRIVATE /usr/local/lib /usr/lib)
target_link_libraries(canpi PUBLIC log4cpp pthread)

add_executable(testcfg
        src/test.cpp)

target_compile_options(testcfg PRIVATE -Wall -Wextra -Wpedantic)

add_executable(testregexp
        src/testregex.cpp)

target_compile_options(testregexp PRIVATE -Wall -Wextra -Wpedantic)

enable_testing()

add_executable( hello_test
    src/hello_test.cpp)

target_link_libraries(hello_test
    gtest_main)

include(GoogleTest)
gtest_discover_tests(hello_test)

