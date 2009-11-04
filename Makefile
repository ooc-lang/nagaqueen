.PHONY: all test

all:
	greg nagaqueen.leg > nagaqueen.c
	gcc -std=c99 -D_BSD_SOURCE -g nagaqueen.c -o nagaqueen

test:
	make all && ./test.sh
