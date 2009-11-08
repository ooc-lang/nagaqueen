.PHONY: all

all:
	leg ../../grammar/nagaqueen.leg > nagaqueen.c
	gcc -g -D_BSD_SOURCE nagaqueen.c -c -o nagaqueen.o
	ooc -g -gc=static fromfile.ooc nagaqueen.o
