## FALLOUT.BAS

### What is it?

An implementation of the terminal hacking / password guessing game from the [Fallout](https://fallout.bethesda.net/en/games) series of games, written in LS-DOS/TRSDOS 6 BASIC to run on an actual or emulated TRS-80 Model 4/4P.

It most closely resembles the minigame in Fallout 4, by design.  The conceit is that the program is a "ROBCO Terminal Hacking Trainer" that allows the player to practice terminal hacking at selectable difficulties.

It is intended to run either under LS-DOS/TRSDOS 6 interpreted BASIC or via [Misosys' EnhComp BASIC compiler](https://www.tim-mann.org/misosys.html#down).  It only will work on a Model 4/4P, as it requires 80x24 video mode.

### Why?

If you have to ask....

### What are these files?

``fallout.cmd`` - The compiled program, using [Misosys' EnhComp BASIC Compiler](https://www.tim-mann.org/misosys.html#down).  This is experimental, but if it works for you, it's going to be the best experience.

``fallout.bas`` - The tokenized BASIC file for LS-DOS/TRSDOS 6 BASIC.  This will work for sure, but will be slower and less responsive than the compiled version, and slightly harder to use.

``fallout.txt`` - The BASIC source code.  This is for if you want to [hack on it yourself](https://github.com/emersonrp/fallout.bas?tab=readme-ov-file#i-want-to-hack-on-it), though you can also use it to run the program in BASIC if you don't mind waiting a few extra seconds at startup.

### What works?

Pretty much everything:
* Setting up the "memory field" with the correct number and length words, depending on player INT and terminal difficulty
* Navigating the "memory field" using the arrow keys or vi-style <kbd>h</kbd><kbd>j</kbd><kbd>k</kbd><kbd>l</kbd>
* Selecting a guess or nugget by hitting <kbd>Enter</kbd> or <kbd>Space</kbd>
* Displaying how many matches there are
* Ticking down your number of guesses
* Selecting the start of ``{}[]()<>`` pairs ("nuggets") to "remove dud" and "reset guesses"
* Notifying you when you win or lose

### What's different from the real game?

Some little stuff:
* In actual Fallout, a word can "split" between the end of the left field and the start of the right.  The trainer can't do that.  I have no current plans to fix this.
* The vi-style navigation keys are not supported in the actual game, sadly;  neither is <kbd>Space</kbd> to select.  I flip-flopped on whether to add this but eventually decided to indulge myself.
* The trainer's word-layout randomizer is much less sophisticated than I'm sure the real game's is, so it can be slow, especially when trying to place a large number of long words.  In the compiled version, expect a few seconds delay as it lays out the field.  In the interpreted version, this can take up to ten seconds.
* The word lists are drawn from actual word lists displayed on actual terminals in actual Fallout; that is to say, the trainer doesn't algorithmically choose from a giant pool of words.  Some randomization and stirring is done, but if you play this enough, you might see repeats of word clusters.  The password itself is always randomly picked from the wordlist, so even if you notice repeats, the answer isn't likely to be the same.
* When selecting a nugget the trainer will immediately de-highlight the nugget;  in the real game it remains highlighted until you move off of it.  I will probably not fix this.
* There's not juicy lore or valuable information or door/gun controls presented after successfully hacking.  I might try to do something about this, but we only have so much RAM to work with.

### How do I use this?

You'll want to copy either ``fallout.cmd`` or ``fallout.bas`` to your TRS-80 Model 4 environment.  ``fallout.cmd`` should work in most situations;  ``fallout.bas`` requires the BASIC supplied with LS-DOS 6 or TRSDOS 6[^1].

If you are running in an emulator, you have all sorts of options for getting files into and out of the emulated TRS-80.  Check your emulator's documentation.  Most likely you'll use [trstools](http://www.trs-80emulators.com/trstools/) or something similar to create a virtual floppy image containing the program file(s).

If you want to play with this on an actual Model 4 (and, after all, who doesn't?), it's more complicated to get the program file of your choice ('CMD' or 'BAS') onto the actual machine.  In case you're not familiar with this process already, options include:

1. Use [trstools](http://www.trs-80emulators.com/trstools/) to copy the program file(s) to a floppy image.  Then one of:
    * Use a DOS-based emulator that can (sometimes[^2]) write a TRS-80 floppy using a PC's 5.25" drive, such as [David Keil's](http://cpmarchives.classiccmp.org/trs80/mirrors/www.discover-net.net/~dmkeil/trs80/model4.htm), or [Matthew Reed's](http://www.trs-80emulators.com/m4/).  You can then mount the floppy image in the emulator, and copy files to the real floppy drive.  Check out [Tim Mann's discussion of this process](https://www.tim-mann.org/trs80faq.html#[7]).
    * Use a [Gotek](https://github.com/GrantMeStrength/TRS80gotek/tree/master) to access/mount the floppy image on the TRS-80.
2. Use a [FreHD](https://www.vecoven.com/trs80/trs80.html) to boot a hard drive image from an SD card;  use the FreHD-supplied ``IMPORT2/CMD`` command to copy the program file from the SD card onto the "hard drive."  To do this, copy the program file(s) onto the SD card, then from the FreHD-enabled TRS-80, type ``IMPORT2 FALLOUT.CMD`` or ``IMPORT2 FALLOUT.BAS`` as appropriate.  <i>(Note: do <b>NOT</b> use the ``-n`` switch when importing the CMD or BAS file[^3].</i>)
3. Connect the TRS-80's serial port to a modern computer via a null modem cable, and do [an elaborate dance](https://www.vintagevolts.com/getting-software-running-on-my-trs-80-model-iv/) to get the program file(s) transferred via XMODEM.
4. Type the contents of ``fallout.txt`` into the TRS-80 by hand (don't do this, ugh).

Once you have your program file(s) available to your real or emulated Model 4, if you want to use ``FALLOUT/CMD`` then you can simply type ``FALLOUT`` at the DOS Ready prompt.  If you want to use ``FALLOUT/BAS`` then you can start the program by typing ``BASIC FALLOUT/BAS`` at the DOS Ready prompt.  See below if you want to use ``FALLOUT/TXT``.

### I want to hack on it!

My current process is that I'm using [trs80gp](http://48k.ca/trs80gp.html), booted from its [FreHD](https://www.vecoven.com/trs80/trs80.html) support into an LS-DOS image that contains FreHD's ``IMPORT2/CMD``.  I keep ``fallout.txt`` in the fake-SD-card directory, from which I edit it using vim.

When I'm ready to test, on the emulated TRS-80, I do:
```
  IMPORT2 -n FALLOUT.TXT
```
...which slurps up the file from the fake-SD-card directory, changes the end-of-line characters to be correct for the TRS-80[^3], and names it ``FALLOUT/TXT`` on the TRS-80.  Then:
```
  BASIC FALLOUT/TXT
```
and after it has loaded and parsed/tokenized the file, off it goes, and I can test my changes.

Once I'm satisfied with my changes, from inside BASIC, I'll:
```
  SAVE FALLOUT/BAS
```
to create the tokenized BASIC file, then exit to LS-DOS via ``SYSTEM``, then:
```
  BC FALLOUT/TXT
```
to compile ``FALLOUT/CMD``.  This requires having installed [Misosys' EnhComp BASIC Compiler](https://www.tim-mann.org/misosys.html#down) onto the LS-DOS image.  I then run ``FALLOUT`` from the LS-DOS prompt to test my changes and to verify that it works at all.  The compiler is a little finicky and can break during the compile, or can output a crashy program, so I typically test the compiled program pretty thoroughly to make sure I haven't introduced any new crashes or weirdness.


Your mileage may vary;  if you want to do this on a real TRS-80, you'll need to use one of the schemes mentioned above in [How do I use this?](https://github.com/emersonrp/fallout.bas?tab=readme-ov-file#how-do-i-use-this) to get ``fallout.txt`` onto the machine.


### This is awesome!

Thanks!  I'm enjoying the conceit and re-learning how to make ancient BASIC do things.

### This is terrible!

I know!  It's gonna get better.  Found a bug?  Have a request?  [File an issue](https://github.com/emersonrp/fallout.bas/issues)!

### What's next?

* Possibly do something more interesting when you win or lose, RAM permitting
* Possibly save a tiny config file containing the last-selected settings and maybe win/lose stats... possibly

### ATTENTION RETRO HACKERS!

I have a couple issues I'd like to fix that are sorta beyond my current understanding.  There's just a handful of people in the world that might be able to help me, but if you're here looking at this, it makes it immensely more likely you're one of them.

My primary issue is that the compiled version of the program doesn't display the blinking cursor at all.  I've hacked in a fake cursor using a reverse-video "space" character, but it's less sexy than actually having the real blinking cursor.  If you have any insight as to why the EnhComp-compiled version of the code would disable the display of the cursor, or more specifically, how to re-enable it, let me know.

A second question is whether the upper 64K of "banked" RAM in a 128K machine is available to BASIC somehow.  I'm imagining not, that this would require dipping into assembly language, which is out of scope for me, but I'd love to hear about it if I'm wrong.

R Pickett emerson@hayseed.net


[^1]: I develop on LS-DOS 6, and don't test on TRSDOS, but as best I can tell, the BASIC supplied with TRSDOS 6 is the same as that supplied with LS-DOS 6.  If you find something not working on TRSDOS, please open an issue.

[^2]: The details of this are beyond the scope of this README, but only some PC 5.25" drives, using some floppy controllers, will successfully work to read/write actual TRS-80 disks in a DOS-based TRS-80 emulator.  A USB-to-floppy adapter like a Greaseweazle will <b>NOT</b> work.  You need an actual 34-pin floppy connection from a supported motherboard or controller card to an actual 5.25" floppy drive.  You're gonna need a retro PC.

[^3]: The ``-n`` switch to ``IMPORT2/CMD`` translates end-of-line characters during the import.  This is needed for plain ASCII files, but will corrupt binary files.  You will <b>NOT</b> want to use this switch when importing either the 'CMD' or 'BAS' file;  you <b>WILL</b> want to use it when importing the 'TXT' file.

