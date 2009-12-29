nagaqueen: a peg grammar for ooc
================================

why a grammar?
--------------

  - for rock, our new compiler http://github.com/nddrylliog/rock
  - for you to learn the language
  - for your next project to parse ooc easily

does it work?
-------------

it parses a basic set of the ooc language, and it's updated
frequently as we make progress on rock as well

what is peg/leg/greg?
---------------------

greg is _why's re-entrant fork of Ian Piumarta's peg/leg, then forked
again by nddrylliog to fix a few bugs (since _why is gone) and add features.

peg and leg are tools for generating recursive-descent parsers.
for more infos, see http://piumarta.com/software/peg

how to test it?
---------------

  - install greg: http://github.com/nddrylliog/greg
  - run 'make test'
  - PROFIT!

don't be shy. open the grammar, modify it to see the effects.
it can't hurt, and is actually pretty simple to understand =)

have fun!
