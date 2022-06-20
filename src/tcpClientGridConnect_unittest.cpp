//
// Created by thornbem on 04/05/22.
//
#include "tcpClientGridConnect.h"

#include "typemock/Isolator.h"
#include "gtest/gtest.h"

namespace {

    int canid = 100;
    struct sockaddr_in client_addr;
    TEST(canmsgTests, FakeObjects) {
        log4cpp::Category* logger = FAKE_ALL<log4cpp::Category>();
        tcpServer* server = FAKE_ALL<tcpServer>();
        canHandler* can = FAKE_ALL<canHandler>();
        nodeConfigurator* config = FAKE_ALL<nodeConfigurator>();

        tcpClientGridConnect tcpCGC = tcpClientGridConnect(logger, server, can, STDOUT_FILENO, client_addr, canid, config);

    }
} // namespace