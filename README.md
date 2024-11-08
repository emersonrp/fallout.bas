## FALLOUT/BAS

### What is it?

A partial implementation of the password guessing game / puzzle from the Fallout series of games, written in LS-DOS 6 BASIC to run on an actual or emulated TRS-80 Model 4.

It is intended to run either under LS-DOS Interpreted basic or via the EnhComp BASIC compiler.

### Why?

If you have to ask....

### What works?

* Navigating the "memory field" using the arrow keys
* Selecting a guess by hitting ENTER
* Displaying how many matches there are
* Ticking down your number of guesses
* Notifying you when you win or lose (by exiting)

### What doesn't?

* Having more than one set of words
* Any of the "remove duds" or "refill guesses" functionality from the original game
* The compiled version sometimes does something weird with sprinkling partial words into the fields.  It's a bug, but possibly in the compiler.  Experimenting with workarounds.

### How do I use this?

Currently, I supply ``FALLOUT.BAS``, the tokenized ready-to-run BASIC program, and ``FALLOUT.TXT``, the BASIC source code.  Either will work, but if you're just wanting to play it, ``FALLOUT.BAS`` is your path to victory.

* Get ``FALLOUT.BAS`` into your Model 4 somehow - options include:
  1. Use [trstools](http://www.trs-80emulators.com/trstools/) to copy FALLOUT.BAS to a floppy image.  Then one of:
    * Use a DOS-based emulator such as [David Kell's](http://cpmarchives.classiccmp.org/trs80/mirrors/www.discover-net.net/~dmkeil/trs80/model4.htm) that can write actual TRS-80 floppies on a PC 5.25" drive (sometimes).
    * Use a [Gotek](https://github.com/GrantMeStrength/TRS80gotek/tree/master) to access/mount the floppy image on the TRS-80.
  2. Use a [FreHD](https://www.vecoven.com/trs80/trs80.html) to boot an LS-DOS hard drive image;  use the included ``import2/cmd`` command to copy ``FALLOUT.BAS`` from the SD card onto the "hard drive."  See "I want to hack on it!" below for more details.
  3. Connect the TRS-80 via its serial port and do [an elaborate dance](https://www.vintagevolts.com/getting-software-running-on-my-trs-80-model-iv/) to get it transferred via XMODEM.
* Run it via LS-DOS 6 BASIC.

### I want to hack on it!

My current process is that I'm using [trs80gp](http://48k.ca/trs80gp.html), booted from its [FreHD](https://www.vecoven.com/trs80/trs80.html) support into an LS-DOS image that contains FreHD's ``import2/cmd``.  I keep ``FALLOUT.TXT`` in the fake-SD-card directory, from which I edit it using vim.  In the emulator, when I'm ready to test, I do:
```
  import2 fallout.txt
```
...which slurps up the file from the fake-SD-card directory, and names it "``FALLOUT/TXT``" on the TRS-80.  Then:
```
  basic
```
and once BASIC has loaded,
```
  run "fallout/txt"
```
and after it has loaded and parsed/tokenized the file, off it goes.

Your mileage may vary;  you'll likely need to use one of the other schemes mentioned above if you don't have access to a FreHD.

``FALLOUT.TXT`` is in "mac" format with respect to EOL characters, which is the same format the TRS-80 used.  If you save it with any other EOL format, the TRS-80 will barf when you try to use it.

vim users on non-Macs:  Add "set ffs=mac,unix,dos" to your vimrc to make vim do the right thing (this won't work in an in-file modeline for bootstrapping reasons).


### "This is awesome!"

Thanks!  I'm enjoying the conceit and re-learning how to make ancient BASIC do things.

### "This is terrible!"

I know!  It's gonna get better.

### What's next?

* Fix things in the "What doesn't?" list above
* Make it honor vim keys for navigation, just because
* Play some Fallout to get more lists of words, clarify the behavior, make it more correct
* Do something more interesting when you win or lose
* Possibly have it ask at start-time how many words or what length or...?
* Supply compiled ``FALLOUT.CMD`` file


R Pickett emerson@hayseed.net
