#!/bin/sh
greg grammar/nagaqueen.leg > test/nagaqueen.c
OOC_LIBS=$OOC_LIBS:$PWD/test rock -v test/printexceptions.use
