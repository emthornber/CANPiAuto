//
// Created by thornbem on 05/05/22.
//

#ifndef CANPIAUTO_MOCK_SESSIONHANDLER_H
#define CANPIAUTO_MOCK_SESSIONHANDLER_H

#include "mock_canHandler.h"
#include "sessionHandler.h"
#include "utils.h"

#include "gmock/gmock.h" // brings in gMock

class MocksessionHandler : public sessionHandler {
public:
    MocksessionHandler(log4cpp::Category *logger, nodeConfigurator *config, MockcanHandler* can)
            : sessionHandler(logger, config, can) {};
    MocksessionHandler& operator= (const MocksessionHandler&);
    MocksessionHandler(const MocksessionHandler&);
    MOCK_METHOD(void, start, (), (override));
    MOCK_METHOD(void, stop, (), (override));
};
#endif //CANPIAUTO_MOCK_SESSIONHANDLER_H
