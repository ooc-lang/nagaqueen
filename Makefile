.PHONY: all

all:
	leg nagaqueen.leg > nagaqueen.c
	gcc -std=c99 nagaqueen.c -o nagaqueen
