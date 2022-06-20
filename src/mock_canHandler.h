//
// Created by thornbem on 04/05/22.
//

#ifndef CANPIAUTO_MOCK_CANHANDLER_H
#define CANPIAUTO_MOCK_CANHANDLER_H

#include "canHandler.h"
#include "gmock/gmock.h" // brings in gMock

class MockcanHandler : public canHandler {
public:
    MockcanHandler(log4cpp::Category *logger, int canId) : canHandler(logger, canId) {};
    MockcanHandler& operator= (const MockcanHandler&);
    MockcanHandler(const MockcanHandler&);
    MOCK_METHOD(int, start, (const char* iface), (override));
    MOCK_METHOD(void, stop, (), (override));
};
#endif //CANPIAUTO_MOCK_CANHANDLER_H
