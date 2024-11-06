10 CLS
20 RANDOM
30 PRINT
40 PRINT "Welcome to ROBCO Industries (TM) Termlink"
50 PRINT
60 PRINT "Password Required"
70 PRINT
80 PRINT "Attempts Remaining: "
90 GUESSES% = 4
100 GOSUB 47000
110 PRINT
900 REM - get the words - TODO need more word sets
905 RESTORE 910
910 DATA TAKES,KNOWN,KICKS,STARK,BOOTS,BATON,CLEAR,CRIME,WASTE,CLOSE,SWORD,SLAVE,FARGO,MAYBE,MALES
920 DIM WORDS$(15)
930 FOR I = 1 TO 15
940     READ WORDS$(I)
950 NEXT
960 WORDLENGTH% = LEN(WORDS$(1))
970 PASSWORDIDX% = RND(15)
980 PASSWORD$ = WORDS$(PASSWORDIDX%)
1000 REM - set up the vars representing the left and right text fields
1005 RESTORE 1010
1010 DATA " ","/","\","!","@","#","$","%","^","&","*","-","=","+",",",".",":",";"
1020 DIM GARBAGECHARS$(18)
1030 FOR I = 1 to 18
1040     READ GARBAGECHARS$(I)
1050 NEXT
1055 REM - currently this loop takes ~ 4 seconds.  That's not terrible but faster would be better
1060 FOR I = 1 TO 12*16
1070     NEWLCHAR$ = GARBAGECHARS$(RND(18))
1080     IF NEWLCHAR$ = LASTLCHAR$ THEN 1070 ELSE LASTLCHAR$ = NEWLCHAR$
1090     LSIDE$ = LSIDE$ + NEWLCHAR$
1100 NEXT
1110 RSIDE$ = RIGHT$(LSIDE$, 6*16) + LEFT$(LSIDE$, 6*16)
1500 REM - sprinkle the words into the text fields
1501 REM - TODO maybe?  If we have word lists of different lengths, algorithmically divide up the field?
1505 DIM PAPOSITIONS%(15,WORDLENGTH%) ' (number of words, length) TODO put those in vars
1509 RESTORE 1510
1510 DATA 14,50,66,95,108,128,154,174
1520 FOR I = 1 TO 8
1530     READ LSIDEPOS%(I)
1540     LSIDEPOS%(I) = LSIDEPOS%(I) + RND(7) - 4
1550     MID$(LSIDE$, LSIDEPOS%(I), LEN(WORDS$(I))) = WORDS$(I)
1555     GOSUB 41000
1560 NEXT
1570 DATA 18,40,66,85,100,138,164
1580 FOR I = 1 TO 7
1590     READ RSIDEPOS%(I)
1600     RSIDEPOS%(I) = RSIDEPOS%(I) + RND(7) - 4
1610     MID$(RSIDE$, RSIDEPOS%(I), LEN(WORDS$(I+8))) = WORDS$(I+8)
1615     GOSUB 42000
1620 NEXT
10000 REM - print the text fields at the right place
10010 TOPROW = 7
10020 GOSUB 40100
10025 HEXADDRESS = HEXADDRS!(RND(7))
10030 FOR I = 0 TO 15
10040     PRINT @ (TOPROW + I, 0), "0x" + HEX$(HEXADDRESS) + " " + MID$(LSIDE$, I*12 + 1, 12) + " 0x" + HEX$(HEXADDRESS + (12*16)) + " " + MID$(RSIDE$, I*12 + 1, 12);
10050     HEXADDRESS = HEXADDRESS + 12
10060 NEXT I
10070 GOSUB 49040 ' print the prompt
10100 REM - Set up the array to keep track of the output lines to the right
10200 DIM OUTPUTLINES$(15) ' 15 lines because the bottom one we always do dynamically
20000 REM - Set up the first word as our current highlighted one.
20010 CURRWORD% = 1
20020 GOSUB 43000
21000 REM - Do the input loop and dispatch appropriately
21020 KEYIN$ = INPUT$(1)
21030 IF KEYIN$ = CHR$(10) THEN GOSUB 44000: GOSUB 45000: GOSUB 43000
21040 IF KEYIN$ = CHR$(11) THEN GOSUB 44000: GOSUB 46000: GOSUB 43000
21050 IF KEYIN$ = CHR$(13) THEN GOSUB 50000
21999 GOTO 21020
39999 END
40000 REM --- subroutine to pick a more random char from garbagechars
40010 NEWCHAR$ = GARBAGECHARS$(RND(18))
40020 IF NEWCHAR$ = LASTCHAR$ THEN 40010
40030 LASTCHAR$ = NEWCHAR$
40040 RETURN
40100 REM -- subroutine to initialize the list of hex addresses
40110 RESTORE 40120
40111 REM TODO Get a better list of these
40112 REM Don't make any of these less than 4096 or HEX$ will format the screen badly
40120 DATA 48304,49968,64198,20992,63056,20464,62720
40130 FOR J = 1 TO 7
40140     READ HEXADDRS!(J)
40150 NEXT J
40160 RETURN
41000 REM -- subroutine to fill a two-dimensional array with lists of "print @" locations for LSIDE
41010 RAWPOS% = LSIDEPOS%(I)
41020 CURROW% = (RAWPOS% \ 12) + 7
41030 CURCOL% = (RAWPOS% MOD 12)
41035 IF CURCOL% = 0 THEN CURCOL% = 12: CURROW% = CURROW% - 1
41040 FOR J = 1 to WORDLENGTH%
41050     PAPOSITIONS%(I, J) = (CURROW% * 80) + 6 + CURCOL%
41060     CURCOL% = CURCOL% + 1
41070     IF CURCOL% > 12 THEN CURCOL% = 1: CURROW% = CURROW% + 1
41080 NEXT J
41090 RETURN
42000 REM -- subroutine to fill a two-dimensional array with lists of "print @" locations for RSIDE
42010 RAWPOS% = RSIDEPOS%(I)
42020 CURROW% = (RAWPOS% \ 12) + 7
42030 CURCOL% = (RAWPOS% MOD 12)
42035 IF CURCOL% = 0 THEN CURCOL% = 12: CURROW% = CURROW% - 1
42040 FOR J = 1 to WORDLENGTH%
42050     PAPOSITIONS%(I+8, J) = (CURROW% * 80) + 26 + CURCOL%
42060     CURCOL% = CURCOL% + 1
42070     IF CURCOL% > 12 THEN CURCOL% = 1: CURROW% = CURROW% + 1
42080 NEXT J
42090 RETURN
43000 REM - highlight the word pointed to by CURRWORD% and put it lower-right
43005 PRINT @ (TOPROW + 15, 42), STRING$(WORDLENGTH%, " ");
43010 FOR J = 1 to WORDLENGTH%
43020     PRINT @ PAPOSITIONS%(CURRWORD%, J), CHR$(16) + MID$(WORDS$(CURRWORD%), J, 1) + CHR$(17);
43030     PRINT @ (TOPROW + 15, 41 + J), MID$(WORDS$(CURRWORD%), J, 1);
43040 NEXT J
43050 RETURN
44000 REM - UN-highlight the word pointed to by CURRWORD%
44010 FOR J = 1 to WORDLENGTH%
44020     PRINT @ PAPOSITIONS%(CURRWORD%, J), MID$(WORDS$(CURRWORD%), J, 1);
44030 NEXT J
44040 RETURN
45000 REM - Increment CURRWORD%, wrapping around
45010 CURRWORD% = CURRWORD% + 1
45020 IF CURRWORD% = 16 THEN CURRWORD% = 1
45030 RETURN
46000 REM - Decrement CURRWORD%, wrapping around
46010 CURRWORD% = CURRWORD% - 1
46020 IF CURRWORD% = 0 THEN CURRWORD% = 15
46030 RETURN
47000 REM - print remaining-guesses blocks
47020 FOR J = 1 to 4
47030     IF J <= GUESSES% THEN PRINT @ (5, 17 + (J * 2)), " " + CHR$(16) + " " + CHR$(17); ELSE PRINT @ (5, 17 + (J * 2)), "  ";
47040 NEXT J
47050 RETURN
48000 REM - rotate / push the "stack" of right-hand output lines
48010 FOR J = 15 TO 2 STEP -1
48020   OUTPUTLINES$(J) = OUTPUTLINES$(J-1)
48030 NEXT J
48040 OUTPUTLINES$(1) = NEWLINE$
48050 RETURN
49000 REM - print the right-hand lines and the prompt
49010 FOR J = 1 TO 15
49020   PRINT @ (22 - J, 41), OUTPUTLINES$(J);
49030 NEXT
49040 PRINT @ (22, 41), ">" + GUESS$;
49050 RETURN
50000 REM ===== Subroutine to process a guess
50010 IF CURRWORD% = PASSWORDIDX% THEN PRINT: PRINT"YOU WIN!": END
50020 GUESS$ = WORDS$(CURRWORD%)
50030 MATCHES% = 0
50040 FOR J = 1 TO LEN(GUESS$)
50050     IF MID$(GUESS$, J, 1) = MID$(PASSWORD$, J, 1) THEN MATCHES% = MATCHES% + 1
50060 NEXT J
50070 NEWLINE$ = ">" + GUESS$
50080 GOSUB 48000
50090 NEWLINE$ = ">Entry denied."
50100 GOSUB 48000
50110 NEWLINE$ = ">Likeness=" + RIGHT$(STR$(MATCHES%), 1)
50120 GOSUB 48000
50130 GOSUB 49000 ' print the lines
50150 GUESSES% = GUESSES% - 1
50160 GOSUB 47000 ' Decrement guesses blocks
50170 GOSUB 49040 ' repoint the cursor to bottom right
50180 IF GUESSES% = 0 THEN PRINT: PRINT"OUT OF GUESSES!": END
59999 RETURN
