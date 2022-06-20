//
// Created by thornbem on 05/05/22.
//

#include "mock_canHandler.h"
#include "log4cpp/Category.hh"
#include "log4cpp/Appender.hh"
#include "gtest/gtest.h"

using ::testing::AtLeast;

TEST(TestTest, canTestSomething) {
    int canId = 100;
    log4cpp::Category& logger = log4cpp::Category::getRoot();

    MockcanHandler can = MockcanHandler( &logger, canId);
    EXPECT_CALL(can, getCanId())
        .Times(AtLeast(1));


}