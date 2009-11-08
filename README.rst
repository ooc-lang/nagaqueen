nagaqueen: a peg grammar for ooc
================================

why a grammar?
--------------

  - for rock, our new compiler
  - for you to learn the language
  - for your next project to parse ooc easily

does it work?
-------------

nagaqueen is a work in progress, so if it doesn't
parse everything, don't sweat it, there should be
improvements every now and then.

what is peg/leg/greg?
---------------------

greg is _why's re-entrant fork of Ian Piumarta's peg/leg, then forked
again by nddrylliog to fix a few bugs (since _why is gone)

it's a modern parser generator based on the PEG paper,
allowing to define a grammar in a simple and straight-forward way

get it while it's hot: http://github.com/nddrylliog/greg/

(update: greg seems more problematic than I imagined. We're now
using http://github.com/nddrylliog/peg-leg/ until further notice.

the grammar should still work with greg with only a few modifications,
but the leg-generated code seems more stable.)

how to test it?
---------------

  - install peg-leg or greg
  - run 'make test'
  - PROFIT!

don't be shy. open the grammar, modify it to see the effects.
it can't hurt, and is actually pretty simple to understand =)

have fun!
