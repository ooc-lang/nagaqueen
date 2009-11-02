.PHONY: all test

all:
	leg nagaqueen.leg > nagaqueen.c
	gcc -std=c99 -D_BSD_SOURCE -g nagaqueen.c -o nagaqueen

test:
	make all && ./nagaqueen
