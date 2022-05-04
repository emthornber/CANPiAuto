cmake_minimum_required(VERSION 3.14)
project(CANPiAuto
        VERSION 0.1.0
        DESCRIPTION "A CBUS interface"
        LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 11)

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
        src/opcodes.h
        src/sessionHandler.cpp
        src/sessionHandler.h
        src/tcpClient.cpp
        src/tcpClient.h
        src/tcpClientGridConnect.cpp
        src/tcpClientGridConnect.h
        src/tcpServer.cpp
        src/tcpServer.h
        src/test.cpp
        src/testregex.cpp
        src/Turnout.cpp
        src/Turnout.h
        src/utils.h)


target_compile_options(canpi PRIVATE -Wall -Wextra -Wpedantic)
target_link_libraries(canpi PUBLIC log4cpp pthread)
