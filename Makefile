CC=g++
LIB= -Wl,-Bdynamic -llog4cpp -lpthread
CFLAGS= -c -Wall -lm -std=c++11 -g -I/usr/include
LDFLAGS= -L/usr/lib
SOURCES=main.cpp canHandler.cpp tcpServer.cpp tcpClient.cpp edSession.cpp Client.cpp tcpClientGridConnect.cpp Turnout.cpp gpio.cpp nodeConfigurator.cpp frameCAN.cpp sessionHandler.cpp
OBJECTS=$(SOURCES:.cpp=.o)
EXECUTABLE=canpi

all: $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@ $(LIB)

.cpp.o:
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm -f *.o
	rm -f canpi
