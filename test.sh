#!/bin/sh
mkdir -p bin
greg grammar/nagaqueen.leg > bin/nagaqueen.c
gcc -std=c99 -D_OOC_USE_GC bin/nagaqueen.c -c -o bin/nagaqueen.o
rock -sourcepath=source:test printexceptions bin/nagaqueen.o -o=bin/printexceptions -v
