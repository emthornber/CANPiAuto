//
// Created by thornbem on 05/05/22.
//

#include "mock_tcpServer.h"
#include "log4cpp/Category.hh"
#include "log4cpp/Appender.hh"

#include "gtest/gtest.h"

using ::testing::AtLeast;

TEST(TestServer, serverTestSomething) {
    log4cpp::Category& logger = log4cpp::Category::getRoot();

    MockcanHandler can = MockcanHandler(&logger, 100);
    MocktcpServer srv = MocktcpServer(&logger, 5550, can, session, GRID);
    EXPECT_CALL(srv, getClientType())
        .Times(AtLeast(1));
}