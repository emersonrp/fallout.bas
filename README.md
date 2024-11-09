## FALLOUT.BAS

### What is it?

A partial implementation of the terminal hacking / password guessing game / puzzle from the Fallout series of games, written in LS-DOS/TRSDOS 6 BASIC to run on an actual or emulated TRS-80 Model 4/4P.

It is intended to run either under LS-DOS/TRSDOS 6 Interpreted basic or via [Misosys' EnhComp BASIC compiler](https://www.tim-mann.org/misosys.html#down).  It only will work on a Model 4/4P, as it requires 80x24 video mode.

### Why?

If you have to ask....

### What are these files?

``fallout.cmd`` - Actual compiled version of the program using [Misosys' EnhComp BASIC Compiler](https://www.tim-mann.org/misosys.html#down).  This is experimental, but if it works for you, it's going to be the best experience.

``fallout.bas`` - The tokenized BASIC file for LS-DOS/TRSDOS 6 BASIC.  This will work for sure, but will be slower and less responsive than the compiled version, and slightly harder to use.

``fallout.txt`` - The BASIC source code.  This is for if you want to hack on it yourself, though you can also use it to run the program in BASIC if you don't mind waiting a few extra seconds at startup.

### What works?

* Navigating the "memory field" using the arrow keys or vi-style <kbd>h</kbd><kbd>j</kbd><kbd>k</kbd><kbd>l</kbd>
* Selecting a guess by hitting <kbd>Enter</kbd>
* Displaying how many matches there are
* Ticking down your number of guesses
* Notifying you when you win or lose (by exiting)

### What doesn't?

* Having enough wordsets
* Having wordsets of word length other than five characters
* Any of the "remove duds" or "refill guesses" functionality from the original game (WIP)

### How do I use this?

You'll want to copy either ``fallout.cmd`` or ``fallout.bas`` to your TRS-80 Model 4 environment.  ``fallout.cmd`` should work in most situations;  ``fallout.bas`` requires the BASIC supplied with LS-DOS 6 or TRSDOS 6[^1].

If you are running in an emulator, you have all sorts of options for getting files into and out of the emulated TRS-80.  Check your emulator's documentation.  Most likely you'll use [trstools](http://www.trs-80emulators.com/trstools/) or something similar to create a virtual floppy image containing the program file(s).

If you want to play with this on an actual Model 4 (and, after all, who doesn't?), it's more complicated to get the program file of your choice ('CMD' or 'BAS') onto the actual machine.  In case you're not familiar with this process already, options include:

1. Use [trstools](http://www.trs-80emulators.com/trstools/) to copy the program file(s) to a floppy image.  Then one of:
    * Use a DOS-based emulator that can (sometimes[^2]) write a TRS-80 floppy using a PC's 5.25" drive, such as [David Keil's](http://cpmarchives.classiccmp.org/trs80/mirrors/www.discover-net.net/~dmkeil/trs80/model4.htm), or [Matthew Reed's](http://www.trs-80emulators.com/m4/).  You can then mount the floppy image in the emulator, and copy files to the real floppy drive.  Check out [Tim Mann's discussion of this process](https://www.tim-mann.org/trs80faq.html#[7]).
    * Use a [Gotek](https://github.com/GrantMeStrength/TRS80gotek/tree/master) to access/mount the floppy image on the TRS-80.
2. Use a [FreHD](https://www.vecoven.com/trs80/trs80.html) to boot a hard drive image from an SD card;  use the FreHD-supplied ``import2/cmd`` command to copy the program file from the SD card onto the "hard drive."  See "I want to hack on it!" below for more details on this process.
3. Connect the TRS-80's serial port to a modern computer via a null modem cable, and do [an elaborate dance](https://www.vintagevolts.com/getting-software-running-on-my-trs-80-model-iv/) to get the program file(s) transferred via XMODEM.
4. Type the contents of ``fallout.txt`` into the TRS-80 by hand (don't do this, ugh).

Once you have your program file(s) available to your real or emulated Model 4, if you selected ``FALLOUT/CMD`` then you can simply type ``FALLOUT`` at the DOS Ready prompt.  If you selected ``FALLOUT/BAS`` then you need to start BASIC by typing ``BASIC`` at the DOS Ready prompt, then ``RUN "FALLOUT/BAS"`` once BASIC starts.  See below if you want to use ``FALLOUT/TXT``.

### I want to hack on it!

My current process is that I'm using [trs80gp](http://48k.ca/trs80gp.html), booted from its [FreHD](https://www.vecoven.com/trs80/trs80.html) support into an LS-DOS image that contains FreHD's ``import2/cmd``.  I keep ``fallout.txt`` in the fake-SD-card directory, from which I edit it using vim.

When I'm ready to test, on the emulated TRS-80, I do:
```
  IMPORT2 FALLOUT.TXT
```
...which slurps up the file from the fake-SD-card directory, and names it ``FALLOUT/TXT`` on the TRS-80.  Then:
```
  BASIC
```
and once BASIC has loaded,
```
  RUN "FALLOUT/TXT"
```
and after it has loaded and parsed/tokenized the file, off it goes.

Your mileage may vary;  if you want to do this on a real TRS-80 and don't have access to a FreHD, you'll likely need to use one of the other schemes mentioned above to get ``fallout.txt`` onto the machine.

``fallout.txt`` is in "mac" format with respect to EOL characters[^3], which is the same format the TRS-80 used.  If you edit locally and save it with any other EOL format, the TRS-80 will likely barf when you transfer it over and try to use it.  Beware any editor configuration that you might have that "helpfully" converts old files to modern conventions.

<i>vim users on non-Macs:  Add </i>``set ffs=mac,unix,dos``<i> to your .vimrc to make vim do the right thing when editing it locally (this won't work in an in-file modeline for bootstrapping reasons).</i>


### "This is awesome!"

Thanks!  I'm enjoying the conceit and re-learning how to make ancient BASIC do things.

### "This is terrible!"

I know!  It's gonna get better.

### What's next?

* Fix things in the "What doesn't?" list above
* Play some Fallout to get more lists of words, clarify the behavior, make it more correct
* Do something more interesting when you win or lose
* Possibly have it ask at start-time how many words or what length or...?

### ATTENTION RETRO HACKERS

I have a couple issues I'd like to fix that are sorta beyond my current understanding.  There's just a handful of people in the world that might be able to help me, but if you're here looking at this, it makes it immensely more likely you're one of them.

My current issue is that the compiled version of the program doesn't display the blinking cursor at all.  I've hacked in a fake cursor using a reverse-video "space" character, but it's less sexy than actually having the real blinking cursor.  If you have any insight as to why the EnhComp-compiled version of the code would disable the display of the cursor, or more specifically, how to re-enable it, let me know.  Thanks!


[^1]: I develop on LS-DOS 6, and don't test on TRSDOS, but to the best of my knowledge, the BASIC supplied with TRSDOS 6 is the same as that supplied with LS-DOS 6.  If you find something not working on TRSDOS, please open an issue.

[^2]: The details of this are beyond the scope of this README, but only some PC 5.25" drives, using some floppy controllers, will successfully work to read/write actual TRS-80 disks in a DOS emulator.  A USB-to-floppy adapter like a Greaseweazle will <b>NOT</b> work.  You need an actual 34-pin floppy connection from a supported motherboard or controller card to an actual 5.25" floppy drive.  You're gonna need a retro PC.

[^3]: That is, what vim calls "mac" which is the old CR-only EOL convention that Macs used prior to OSX, and that TRS-80s and C64s and Apple IIs and other ancient computers used.  It's a bit of a hassle, I know.

R Pickett emerson@hayseed.net
