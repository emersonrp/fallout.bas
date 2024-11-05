## FALLOUT/BAS

##### What is it?

A partial implementation of the password guessing game / puzzle from the Fallout series of games, written in TRSDOS 6 / LS-DOS BASIC to run on an actual TRS-80 Model 4.

##### Why?

If you have to ask....

##### What works?

* Highlighting guesses with the up and down arrow keys
* Selecting a guess by hitting ENTER
* Displaying how many matches there are
* Notifying you when you win (by exiting)

##### What doesn't?

* Ticking down your number of guesses
* Having more than one set of words
* Any of the "remove duds" or "refill guesses" functionality from the original game
* Being at all speedy or responsive.

##### How do I use this?

Currently, I only supply FALLOUT.BAS which is an ASCII listing of the game.  You'll need to:

* Get this into your TRS-80 somehow
* Change the EOL from Unix to TRS-80 conventions
* Run it!

My current process is that I'm using trs80gp, booted from its FreHD support into a FreHD-aware LS-DOS.  I keep FALLOUT.BAS in the fake-SD-card directory, from which I edit it using vim.  In the emulator, when I'm ready to test, I do:
```
  import2 -n fallout.bas
```
...which slurps up the file from the fake-SD-card directory, doing EOL translations along the way.  Then:
```
  basic
```
and once BASIC has loaded,
```
  run "fallout/bas"
```
and after it has loaded the file, off it goes.


##### "This is awesome!"

Thanks!  I'm enjoying the conceit and re-learning how to make ancient BASIC do things.

##### "This is terrible!"

I know!  It's gonna get better.

##### What's next?

* Fix things in the "What doesn't?" list above
* Get more lists of words
* Do something more interesting when you win
* Possibly have it ask at start-time how many words or what length or...?
* Possibly (likely) shim a bit of Z80 assembly in there to speed up the initial setup loops and so forth


R Pickett emerson@hayseed.net
