cmake_minimum_required(VERSION 3.14)
project(CANPiWi)

set(CMAKE_CXX_STANDARD 14)

file(GLOB SOURCES src/main/*.cpp src/main/*.h)
file(GLOB TESTSRC src/test/*.cpp)
file(GLOB HEADERS src/inc/*.h)

add_executable(CANPiWi ${SOURCES} ${HEADERS})

target_include_directories(CANPiWi PRIVATE . src/inc/)

target_compile_options(CANPiWi PRIVATE -Wall -std=c++11 -g)

target_link_libraries(CANPiWi log4cpp config pthread)

add_executable(test src/test/test.cpp ${HEADERS})

add_executable(testregex src/test/testregex.cpp)
