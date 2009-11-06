.PHONY: all

all:
	greg ../../grammar/nagaqueen.leg > nagaqueen.c
	gcc -g -D_BSD_SOURCE nagaqueen.c -c -o nagaqueen.o
	ooc -g -gc=dynamic fromfile.ooc nagaqueen.o
