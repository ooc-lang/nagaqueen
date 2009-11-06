.PHONY: all

all:
	greg ../../grammar/nagaqueen.leg > nagaqueen.c
	gcc -g -D_BSD_SOURCE nagaqueen-fromfile.c -c -o nagaqueen-fromfile.o
	ooc -g -gc=dynamic fromfile.ooc nagaqueen-fromfile.o
