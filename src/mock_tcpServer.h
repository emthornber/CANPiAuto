//
// Created by thornbem on 05/05/22.
//

#ifndef CANPIAUTO_MOCK_TCPSERVER_H
#define CANPIAUTO_MOCK_TCPSERVER_H

#include "mock_canHandler.h"
#include "mock_sessionHandler.h"
#include "tcpServer.h"
#include "utils.h"

#include "gmock/gmock.h" // brings in gMock

class MocktcpServer : public tcpServer {
public:
    MocktcpServer(log4cpp::Category *logger, int port, MockcanHandler* can, MocksessionHandler *sessionHandler, CLIENT_TYPE clientType)
            : tcpServer(logger, port, can, sessionHandler, clientType) {};
    MocktcpServer& operator= (const MocktcpServer&);
    MocktcpServer(const MocktcpServer&);
    MOCK_METHOD(bool, start, (), (override));
    MOCK_METHOD(void, stop, (), (override));
};
#endif //CANPIAUTO_MOCK_TCPSERVER_H
