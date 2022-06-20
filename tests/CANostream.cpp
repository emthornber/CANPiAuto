//
// Created by thornbem on 05/05/22.
//
/*
The GridConnect protocol encodes messages as an ASCII string of up to 24 characters in one of two forms:
 :ShhhhNd0d1d2d3d4d5d6d7; where 'hhhh' is the two byte (11 useful bits) header and the 'S' indicates a standard CAN frame.
 :XhhhhhhhhNd0d1d2d3d4d5d6d7; The X indicates an extended CAN frame.
Strict Gridconnect protocol allows a variable number of header characters e.g. a header value of 0x123 could be encoded
as S123, X123, S0123 or X00000123.
However MERG hardware uses a fixed 4 or 8 byte header when sending GridConnectMessages to the computer.
The 11 bit standard header is left justified in these 4 bytes.
The 29 bit standard header is sent as <11 bit SID><0><1><0>< 18 bit EID>
In position 6 or 10 'N' or 'R' indicates a Normal or Remote frame.
d0 - d7 are the (up to) 8 data bytes
*/
#include "CANostream.h"
