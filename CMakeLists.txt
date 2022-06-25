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

add_library(log4cpp SHARED IMPORTED)
set_property(TARGET log4cpp PROPERTY
		IMPORTED_LOCATION "/usr/lib/x86_64-linux-gnu/liblog4cpp.so.5.0.6")
add_library(pthread SHARED IMPORTED)
set_property(TARGET pthread PROPERTY
		IMPORTED_LOCATION "/usr/lib/x86_64-linux-gnu/libpthread.so")

target_compile_options(canpi PRIVATE -c -Wall -fpermissive -lm -g)
target_include_directories(canpi PUBLIC /usr/include)
target_include_directories(canpi PUBLIC /usr/local/include)
target_link_directories(canpi PRIVATE /usr/local/lib
		/usr/lib)
target_link_libraries(canpi PUBLIC log4cpp pthread)

add_executable(testcfg
        tests/test.cpp)

target_compile_options(testcfg PRIVATE -Wall -Wextra -Wpedantic)

add_executable(testregexp
        tests/testregex.cpp)

target_compile_options(testregexp PRIVATE -Wall -Wextra -Wpedantic)

enable_testing()

add_executable( canmsg_test
		tests/CANsprintf.cpp tests/CANostream.cpp tests/CANostream.h)

target_link_libraries(canmsg_test
		gtest_main )

#[[
add_executable(canmsg_typemock
		src/Client.cpp
		src/tcpClientGridConnect.cpp
		src/tcpClientGridConnect_unittest.cpp)

target_link_libraries(canmsg_typemock
		-no-pie
		/usr/lib64/typemock/libisolator.a
		log4cpp
		gtest_main)
]]

include(GoogleTest)
gtest_discover_tests(canmsg_test)
