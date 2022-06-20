//
// Created by thornbem on 05/05/22.
//
/*
The GridConnect protocol encodes messages as an ASCII string of up to 24 characters in one of two forms:

 :ShhhhNd0d1d2d3d4d5d6d7;

where
 'S' indicates a standard CAN frame
 'hhhh' is the hex representation of the two byte (11 useful bits) header

 :XhhhhhhhhNd0d1d2d3d4d5d6d7;
where
 'X' indicates an extended CAN frame.
 'hhhhhhhh' is the hex representation of the four byte (29 useful bits) header

Strict Gridconnect protocol allows a variable number of header characters e.g. a header value of 0x123 could be encoded
as S123, X123, S0123 or X00000123.
However MERG hardware uses a fixed 4 or 8 byte header when sending GridConnectMessages to the computer.
The 11 bit standard header is left justified in these 4 bytes.
The 29 bit standard header is sent as <11 bit SID><0><1><0>< 18 bit EID>
In position 6 or 10 'N' or 'R' indicates a Normal or Remote frame.
d0 - d7 are the (up to) 8 data bytes
*/
void tcpClientGridConnect::canMessage(int canid, const char *msg, int dlc) {
    //test to send data to client tcp
    int nbytes;
    int tempcanid;
    stringstream ss;
    if (running == 0) {
        logger->error("Can grid client stopping. Not sending message to clients.");
        return;
    }
    try {
        char buf[100];
        memset(buf, 0, sizeof(buf));
        sprintf(buf, "canid:%d data:%02x %02x %02x %02x %02x %02x %02x %02x\n", canid, msg[0], msg[1], msg[2], msg[3],
                msg[4], msg[5], msg[6], msg[7]);
        logger->debug("[%d] Tcp grid client received cbus message: %s", id, buf);
        /*
        The GridConnect protocol encodes messages as an ASCII string of up to 24 characters of the form:
        :ShhhhNd0d1d2d3d4d5d6d7;
        The S indicates a standard CAN frame
        :XhhhhhhhhNd0d1d2d3d4d5d6d7;
        The X indicates an extended CAN frame hhhh is the two byte header N or R indicates a normal
        or remote frame, in position 6 or 10 d0 - d7 are the (up to) 8 data bytes
        */
        memset(buf, 0, sizeof(buf));
        byte h2, h1;
        int s;
        char frametype = 'N'; //should be N or R
        char t[3];
        //set frame type
        if ((canid & CAN_RTR_FLAG) == CAN_RTR_FLAG) frametype = 'R';

        //do the parse based on the extended or std frame
        if ((canid & CAN_EFF_FLAG) == CAN_EFF_FLAG) {
            //extended frame
            tempcanid = canid & CAN_EFF_MASK;
            tempcanid = tempcanid << 3;
            ss.clear();
            ss.str();
            ss << ":X";

            /*
             * we have to set some bits to present to the grid
             * the reason is the CBUS implementation that includes
             * the RTR and the extended frame in the bytes of cangrid message
             * not just based on the "X" and "R" indication
             * The extended frame has the format of
             *
             * Field name and length in bits
             *
             * Identifier A = 11  First part of the (unique) identifier which also represents the message priority
             * Substitute remote request (SRR) = 1 Must be recessive (1)
             * Identifier extension bit (IDE)= 1 Must be recessive (1) for extended frame format with 29-bit identifiers
             * Identifier B (green) = 18 Second part of the (unique) identifier which also represents the message priority
             * Remote transmission request (RTR) = 1   Must be dominant (0) for data frames and recessive (1) for remote request frames (see Remote Frame, below)
             * Total size is 32 bits
             * Bits
             * 1 2 3 4    5 6 7 8   9 10 11 12   13  14 15 16   17 18 19 20   21 22 23 24   25 26 27 28   29 30 31 32
             * A A A A    A A A A   A A  A  1    IDE B  B  B    B  B  B  B    B  B  B  B    B  B  B  B    B  B  B  RTR
             *
             * We need to set the bits 12 13 and 32 and shift the other bits properly
             *
             * The bits from the linux stack are
             * Bits
             * 1 2 3 4    5 6 7 8   9 10 11 12   13 14 15 16   17 18 19 20 21   22 23 24 25   26 27 28   29 30  31  32
             * A A A A    A A A A   A A  A  B    B  B  B  B    B  B  B  B  B    B  B  B  B    B  B  B    B  ERR RTR IDE
             */

            /*
             * first highest byte of the 4. no need to fix - bits 1 to 8
             */
            h1 = tempcanid >> 24;
            sprintf(t, "%02X", h1);
            ss << t;

            /*
             * second highest byte of the 4.
             */
            h1 = tempcanid >> 16;
            sprintf(t, "%02X", h1);
            ss << t;

            //third highest byte of the 4
            h1 = tempcanid >> 8;
            sprintf(t, "%02X", h1);
            ss << t;

            //fourth highest byte of the 4
            sprintf(t, "%02X", h1);
            ss << t;

            ss << frametype;
            for (int i = 0; i < dlc; i++) {
                sprintf(t, "%02X", msg[i]);
                ss << t;
            }
            ss << ";";
            s = 28 - (8 - dlc) * 2; // max msg + \n - data size offset
        } else {
            //standard frame
            tempcanid = canid & CAN_SFF_MASK;
            h2 = tempcanid << 5;
            h1 = tempcanid >> 3;

            ss.clear();
            ss.str();
            ss << ":S";
            sprintf(t, "%02X", h1);
            ss << t;
            sprintf(t, "%02X", h2);
            ss << t;
            ss << frametype;
            for (int i = 0; i < dlc; i++) {
                sprintf(t, "%02X", msg[i]);
                ss << t;
            }
            ss << ";";
            s = 24 - (8 - dlc) * 2; // max msg + \n - data size offset
        }

        logger->debug("[%d] Grid server sending grid message to client: %s", id, ss.str().c_str());
        if (running == 0) {
            logger->error("Can grid client stoping. Not sending message to clients.");
            return;
        }
        nbytes = write(client_sock, ss.str().c_str(), s);
        if (nbytes != s) {
            logger->warn("Bytes written does not match the request. Request size %d, written %d", s, nbytes);
        }
    }
    catch (runtime_error &ex) {
        logger->debug("[%d] Grid client failed to process the can message", id);
    }
    catch (...) {
        logger->debug("[%d] Grid client failed to process the can message. Unexpected error.", id);
    }
}
