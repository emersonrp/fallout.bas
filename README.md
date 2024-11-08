## FALLOUT/BAS

### What is it?

A partial implementation of the password guessing game / puzzle from the Fallout series of games, written in LS-DOS 6 BASIC to run on an actual or emulated TRS-80 Model 4.

It is intended to run either under LS-DOS Interpreted basic or via the EnhComp BASIC compiler.

### Why?

If you have to ask....

### What are these files?

``fallout.cmd`` - Actual compiled version of the program using Misosys' EnhComp BASIC Compiler.  This is experimental, but if it is working, it's probably the best bet.  <i><b>Not yet actually supplied - there's at least one bug I want to crush first.</b></i>
``fallout.bas`` - The tokenized BASIC file for LS-DOS 6 BASIC.  This will work for sure, but will be slower and less responsive than the compiled version.
``fallout.txt`` - The BASIC source code.  This is for if you want to hack on it yourself, though you can also use it to run the program in BASIC if you don't mind waiting a few extra seconds at startup.

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

You'll want to copy either ``fallout.cmd`` or ``fallout.bas`` to your TRS-80 environment.  ``fallout.cmd`` should work in most situations;  ``fallout.bas`` requires the BASIC supplied with LS-DOS 6.  TRSDOS 6 BASIC might work, or it might not;  I don't test that, let me know!

If you are running in an emulator, you have all sorts of options for getting files into and out of the emulated TRS-80.  Check your emulator's documentation.

If you want to play with this on an actual Model 4 (and, after all, who doesn't?), it's more complicated:

* Get the program file of your choice ('cmd' or 'bas') into your Model 4 somehow - options include:
  1. Use [trstools](http://www.trs-80emulators.com/trstools/) to copy FALLOUT.BAS to a floppy image.  Then one of:
    * Use a DOS-based emulator such as [David Kell's](http://cpmarchives.classiccmp.org/trs80/mirrors/www.discover-net.net/~dmkeil/trs80/model4.htm) that can write actual TRS-80 floppies on a PC 5.25" drive (sometimes).
    * Use a [Gotek](https://github.com/GrantMeStrength/TRS80gotek/tree/master) to access/mount the floppy image on the TRS-80.
  2. Use a [FreHD](https://www.vecoven.com/trs80/trs80.html) to boot an LS-DOS hard drive image;  use the included ``import2/cmd`` command to copy the program file from the SD card onto the "hard drive."  See "I want to hack on it!" below for more details.
  3. Connect the TRS-80's serial port to a modern computer via a null modem cable, and do [an elaborate dance](https://www.vintagevolts.com/getting-software-running-on-my-trs-80-model-iv/) to get the file transferred via XMODEM.
* Run it via LS-DOS 6 BASIC.

### I want to hack on it!

My current process is that I'm using [trs80gp](http://48k.ca/trs80gp.html), booted from its [FreHD](https://www.vecoven.com/trs80/trs80.html) support into an LS-DOS image that contains FreHD's ``import2/cmd``.  I keep ``FALLOUT.TXT`` in the fake-SD-card directory, from which I edit it using vim.

When I'm ready to test, on the emulated TRS-80, I do:
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

Your mileage may vary;  if you want to do this on a real TRS-80 and don't have access to a FreHD, you'll likely need to use one of the other schemes mentioned above to get ``FALLOUT.TXT`` onto the machine.

``FALLOUT.TXT`` is in "mac" format with respect to EOL characters, which is the same format the TRS-80 used.  If you save it with any other EOL format, the TRS-80 will likely barf when you try to use it.

<i>vim users on non-Macs:  Add "set ffs=mac,unix,dos" to your vimrc to make vim do the right thing (this won't work in an in-file modeline for bootstrapping reasons).</i>


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
* Actually supply compiled ``FALLOUT.CMD`` file once the weird bug is crushed


R Pickett emerson@hayseed.net
