�� � vim: ft=basic �
 �   : � [� GUESSES% � : MAXGUESSES% � : :�� TODO make this difficulty-selectable �� � `�: :�� Populate the word list ��( WORDLENGTH% � ��(WORDS$()) Ȅ2 PASSWORDIDX% � ��(WORDLISTLENGTH%) �< PASSWORD$ � WORDS$(PASSWORDIDX%) ��F CURWORD% �  S�P � OUTPUTLINES$(): :�� 15 lines because the bottom one we always do dynamically ��Z � PAPOSITIONS%(WORDLISTLENGTH%,WORDLENGTH%): :�� (number of words, length) ��d � LWORDTOPOS%(WORDLISTLENGTH%, WORDLENGTH%), RWORDTOPOS%(WORDLISTLENGTH%, WORDLENGTH%) *�n � LPOSTOWORD%(�), RPOSTOWORD%(�) ��x HEXADDRESS! � ��(�� ) � ��(�) �  : � HEXADDRESS! � � � HEXADDRESS! � HEXADDRESS! �    � ��� GUESSISNUGGET% �  ǆ� DUD$ � �(WORDLENGTH%, ".") ͆�� ӆ�� �� "Welcome to ROBCO Industries (TM) Termlink" �� %�� "Password Required" +�&� N�0� ��(); " "; ��(); ��(); ���� ===== set up the vars representing the left and right text fields ��� GARBAGECHARS$ contains double of most things to make []{}()<> less likely *��GARBAGECHARS$ �  "/\%@#$%^*-=+,.:;?_/\%@#$%^*-=+,.:;?_[]{}()<>" ;�� I �  � 2 x�$  NEWCHAR$ � ��(GARBAGECHARS$, ��(��(GARBAGECHARS$)), ) ��.  � NEWCHAR$ � LASTLCHAR$ � $ :� LASTLCHAR$ � NEWCHAR$ ֈ8  LSIDE$ � LSIDE$ � NEWCHAR$ ܈B� �LLSIDE$ � LSIDE$ � LSIDE$ � LSIDE$ � ��(LSIDE$, *) @�VRSIDE$ � ��(LSIDE$,  ) � ��(LSIDE$, �) ��� ===== add nuggets explicitly, just sprinkle some of them in there and let them land where they may. ��NUGGSIDE% �  ։(� I �  � � �  �2  I � I � ��() � : :�� randomize locations a little (�<  NUGGIDX% � ��() ��F  NEWNUGGET$ � ��("[{<(",NUGGIDX%,) � ��(LSIDE$, ��(��(LSIDE$)), ��()�) � ��("]}>)",NUGGIDX%,)  �P  � NUGGSIDE% �  � ��(LSIDE$, I, ��(NEWNUGGET$)) � NEWNUGGET$ :� ��(RSIDE$, I, ��(NEWNUGGET$)) � NEWNUGGET$  �Z  NUGGSIDE% �  � NUGGSIDE% (�d� I \��� ===== sprinkle the words into the text fields ���RSIDEWORDCOUNT% � ��(WORDLISTLENGTH% � ) �LSIDEWORDCOUNT% � WORDLISTLENGTH% � RSIDEWORDCOUNT% ��LCELLLENGTH% � ��((�) � LSIDEWORDCOUNT%) $�RCELLLENGTH% � ��((�) � RSIDEWORDCOUNT%) a�� LSIDEPOS%(LSIDEWORDCOUNT%), RSIDEPOS%(RSIDEWORDCOUNT%) ˌ� TODO TODO TODO - the real game (F4, at least) sprinkles words pretty randomly.  Let's do that, too. .�� TODO TODO TODO - pick a spot, make sure it doesn't collide with another word, splat it there ��� the math here is (move over I-1 cells) + (middle of cell) - (center the word) + (randomize a bit) ��"� I �  � LSIDEWORDCOUNT% �,  LSIDEPOS%(I) � (LCELLLENGTH% � (I�)) � ��(LCELLLENGTH% � ) � ��(WORDLENGTH% � ) � (��() � ) 7�6  � J �  � WORDLENGTH% a�@    LPOSTOWORD%(LSIDEPOS%(I)�J�) � I ��E    LWORDTOPOS%(I, J) � LSIDEPOS%(I)�J� ��J    ��(LSIDE$, LSIDEPOS%(I)�J�) � ��(WORDS$(I),J,): :�� do this in here because enhcomp demands it �T  � J �^  � (� �h� I 3�r� I �  � RSIDEWORDCOUNT% ��|  RSIDEPOS%(I) � (RCELLLENGTH% � (I�)) � ��(RCELLLENGTH% � ) � ��(WORDLENGTH% � ) � (��() � ) ���  � J �  � WORDLENGTH% ���    RPOSTOWORD%(RSIDEPOS%(I)�J�) � I�LSIDEWORDCOUNT% ��    RWORDTOPOS%(I, J) � RSIDEPOS%(I)�J� ���    ��(RSIDE$, RSIDEPOS%(I)�J�) � ��(WORDS$(I�LSIDEWORDCOUNT%),J,): :�� do this in here because enhcomp demands it ���  � J ���  � � ���� I �'� ===== print the text fields at the right place ��'� @ �, " "; 
�'TOPROW �  �$'� I �  �  ;�.'  PALOC � (TOPROW � I) � P ʑ8'  � @ PALOC, "0x" ; ��(HEXADDRESS!) ; " " ; ��(LSIDE$, I� � , ) ; " 0x" ; ��(HEXADDRESS! � (�)) ; " " ; ��(RSIDE$, I� � , ); �B'  HEXADDRESS! � HEXADDRESS! �  ��L'� I �V'� ��: :�� print attempts remaining ?�`'� ��: :�� print the prompt n� N� ===== Set up the initial cursor location ��*NCURX% � : CURY% � : CURSIDE% � : :�� CURSIDE% 0 = LEFT, 1 = RIGHT ��4N� @� ��R� ===== Do the input loop and dispatch appropriately �RKEYIN$ � �: � KEYIN$ � "" � R d�R� KEYIN$ � ��()  � � ��: � R :� � KEYIN$ � "h" � � ��: � R ��&R� KEYIN$ � ��()  � � `�: � R :� � KEYIN$ � "l" � � `�: � R �0R� KEYIN$ � ��(
) � � 4�: � R :� � KEYIN$ � "j" � � 4�: � R 6�:R� KEYIN$ � ��() � � ��: � R :� � KEYIN$ � "k" � � ��: � R ��DR� KEYIN$ � ��() � � GUESSISNUGGET% �  � � 8� :� � CURWORD% �  � � P� :� � CURWORD% � � � � ,� �NR� KEYIN$ � " " � � GUESSISNUGGET% �  � � 8� :� � CURWORD% �  � � P� :� � CURWORD% � � � � ,� ��U� R �?�� P�@�� ===== sub to DTRT with the current cursor location ��C�� print our current thingie before we change around where CURPALOC points  �E�� GUESSISNUGGET% �  � � @ CURPALOC%, GUESS$;: GUESSISNUGGET% �  :� � @ CURPALOC%, CURCHAR$; )�G�� CURWORD% �  � � �: CURWORD% �  S�J�CURFIELDPOS% � (CURY%�) �  � CURX% ��T�� CURSIDE% �  � CURPALOC% � (CURY%�)�P �  � CURX% :� CURPALOC% � (CURY%�)�P �  � CURX% �^�� CURSIDE% �  � CURCHAR$ � ��(LSIDE$, CURFIELDPOS%, ) :� CURCHAR$ � ��(RSIDE$, CURFIELDPOS%, ) L�h�� CURCHAR$ � "{" � ENDCHAR$ � "}": � ��: � |�r�� CURCHAR$ � "[" � ENDCHAR$ � "]": � ��: � ��|�� CURCHAR$ � "<" � ENDCHAR$ � ">": � ��: � ܗ��� CURCHAR$ � "(" � ENDCHAR$ � ")": � ��: � !���� ��(CURCHAR$) � A � � ȯ: � :� � ��(CURCHAR$) � Z � � ȯ: � ����� CURSIDE% �  � CHECKWORD% � LPOSTOWORD%(CURFIELDPOS%) :� CHECKWORD% � RPOSTOWORD%(CURFIELDPOS%) 똤�� CHECKWORD% ��  � CURWORD% � CHECKWORD%: � WORDS$(CHECKWORD%) �� DUD$ � � �: � �� :� � ȯ 񘮜� R��� ===== SET CURY and CURX from CURFIELDPOS - this is for exiting a word to the right or left x��CURY% � ��(CURFIELDPOS% � ) �  ���CURX% � CURFIELDPOS% � ((CURY%�) � ) ԙ&�� CURX% �  � CURX% � : CURY% � CURY% �  ڙ0�� ��4�� ===== handle "cursor down"  �>�� CURY% �  � CURY% � CURY% �  *�H�� @� 0�R�� O���� ===== handle "cursor up" s���� CURY% �  � CURY% � CURY% �  }���� @� ����� ����� ===== handle "cursor left" ;��� CURWORD% �  � � CURSIDE% �  � CURFIELDPOS% � LWORDTOPOS%(CURWORD%, ): � � :� CURFIELDPOS% � RWORDTOPOS%(CURWORD%�LSIDEWORDCOUNT%, ): � � ���� CURX% �  � CURX% � CURX% �  :� � CURSIDE% �  � CURSIDE% � : CURX% �  ���� @� ��$�� ��`�� ===== handle "cursor right" i�j�� CURWORD% �  � � CURSIDE% �  � CURFIELDPOS% � LWORDTOPOS%(CURWORD%, WORDLENGTH%): � � :� CURFIELDPOS% � RWORDTOPOS%(CURWORD%�LSIDEWORDCOUNT%, WORDLENGTH%): � � ��t�� CURX% �  � CURX% � CURX% �  :� � CURSIDE% �  � CURSIDE% � : CURX% �  Ĝ~�� @� ʜ��� �(�� ===== fill a two-dimensional array with lists of "print @" locations for LSIDE :�2�RAWPOS% � LSIDEPOS%(I) ]�<�CURROW% � ��(RAWPOS% � ) �  ��F�CURCOL% � (RAWPOS% � ��(RAWPOS% � ) � ) ŝK�� CURCOL% �  � CURCOL% � : CURROW% � CURROW% �  ߝP�� J �  � WORDLENGTH% �Z�  PAPOSITIONS%(I, J) � (CURROW% � P) �  � CURCOL% 3�d�  CURCOL% � CURCOL% �  m�n�  � CURCOL% �  � CURCOL% � : CURROW% � CURROW% �  u�x�� J {���� О�� ===== fill a two-dimensional array with lists of "print @" locations for RSIDE ��RAWPOS% � RSIDEPOS%(I) �$�CURROW% � ��(RAWPOS% � ) �  >�.�CURCOL% � (RAWPOS% � ��(RAWPOS% � ) � ) v�3�� CURCOL% �  � CURCOL% � : CURROW% � CURROW% �  ��8�� J �  � WORDLENGTH% ٟB�  PAPOSITIONS%(I�LSIDEWORDCOUNT%, J) � (CURROW% � P) �  � CURCOL% ��L�  CURCOL% � CURCOL% �  /�V�  � CURCOL% �  � CURCOL% � : CURROW% � CURROW% �  7�`�� J =�j�� ����� ===== highlight the word pointed to by CURWORD% and put it lower-right ���PALOC � ((TOPROW � ) � P) � * ���� @ PALOC, �(, " ");: :�� "15" should be max possible wordlength + 1 ��� J �  � WORDLENGTH% h� �  � @ PAPOSITIONS%(CURWORD%, J), ��() � ��(WORDS$(CURWORD%), J, ) � ��(); ��*�  � @ PALOC, ��(WORDS$(CURWORD%), J, ); ��4�  PALOC � PALOC �  ��>�� J �H�� @ PALOC, ��(); " "; ��(); ��();: :�� DRY this up with 49040 maaaybe? �R�� E�૏ ===== UN-highlight the word pointed to by CURWORD% _�ꫂ J �  � WORDLENGTH% ����  � @ PAPOSITIONS%(CURWORD%, J), ��(WORDS$(CURWORD%), J, ); ����� J ���� �ȯ� ===== Highlight a single character and clear any selected word (�ү� @ CURPALOC%, ��(); CURCHAR$; ��(); ��(); >�ܯGUESS$ � CURCHAR$ H�母 � Y��CURWORD% �  c���� �� i��� ����� ===== Detect nuggets, make sure they're not already used, highlight them 죵�� �: :�� unhighlight the last word we were on P���� CURSIDE% �  � TESTWORD% � LPOSTOWORD%(CURFIELDPOS%) :� TESTWORD% � RPOSTOWORD%(CURFIELDPOS%) ��ĳ� TESTWORD% � � � � ȯ: �: :�� We have used this nugget already ��γINCRX% � : TESTNUGG$ � CURCHAR$ �سNUGGETPOS% � CURFIELDPOS% � INCRX% 7�ⳋ (NUGGETPOS% � (��(NUGGETPOS% � ) � )) �  � � ȯ: �::�� hit EOL, bail out ��쳋 CURSIDE% �  � TESTCHAR$ � ��(LSIDE$, NUGGETPOS%, ) :� TESTCHAR$ � ��(RSIDE$, NUGGETPOS%, ) ���� TESTCHAR$ � ENDCHAR$ � TESTNUGG$ � TESTNUGG$ � TESTCHAR$: � �� : �: :�� found end marker, append, highlight nugget n� �� ��(TESTCHAR$) �� A � � ��(TESTCHAR$) �� Z � � ȯ: �: :�� hit a letter, bail out Ȧ
�TESTNUGG$ � TESTNUGG$ � TESTCHAR$: :�� OK, add the character and move to the next one ��INCRX% � INCRX% �  ��� س ?���� ===== Highlight detected nugget, push it into GUESS, update lower-right prompt j���GUESS$ � TESTNUGG$: GUESSISNUGGET% �  ����� @ CURPALOC%, ��();GUESS$;��(); ��µ� �� ��̵� ̧��� ===== print remaining-guesses line 񧢷� @ �, "Attempts Remaining: "; ���� J �  �  ���  PALOC � � � (J � ) q���  � J �� GUESSES% � � @ PALOC, " " ; ��() ; " " ; ��(); :� � @ PALOC, "  "; y���� J �ʷ� ����� ===== rotate / push the "stack" of right-hand output lines ֨��� J �  �  � �  ���  OUTPUTLINES$(J) � OUTPUTLINES$(J�) ���� J '���OUTPUTLINES$() � NEWLINE$ -���� c�h�� ===== print the right-hand lines and the prompt t�r�� J �  �  ��w�  PALOC � (( � J) � P) � ) ��|�  � OUTPUTLINES$(J) �� "" � � @ PALOC, OUTPUTLINES$(J);�( � ��(OUTPUTLINES$(J)), " "); ����� T���� ===== sometimes we GOSUB into the middle, here, if we just want to print the prompt k���PALOC � �P � ) ����� @ PALOC, ">               ";: :�� clear the line, then: ���� @ PALOC, ">" ; GUESS$; ��(); " "; ��(); ��();: :�� drop the cursor in the right place �¿� -�PÏ ===== process a guess ��ZË CURWORD% � PASSWORDIDX% � PALOC � �P � ) � WORDLENGTH% � : � @ PALOC, " ": �"YOU WIN!": � ��d�GUESS$ � WORDS$(CURWORD%) ��n�MATCHES% �  ګxÂ J �  � ��(GUESS$) #���  � ��(GUESS$, J, ) � ��(PASSWORD$, J, ) � MATCHES% � MATCHES% �  +��Ã J G���NEWLINE$ � ">" � GUESS$ Q��Í �� q���NEWLINE$ � ">Entry denied." {��Í �� ����NEWLINE$ � ">Likeness=" � ��(��(MATCHES%), ) ���Í �� ֬�Í h�: :�� print the lines ���GUESSES% � GUESSES% �  ��Í ��: :�� Decrement guesses blocks L��Í ��: :�� repoint the cursor to bottom right ɭċ GUESSES% �  � PALOC � �P � ) � WORDLENGTH% � : � @ PALOC, " ": �"OUT OF GUESSES!  PASSWORD WAS: " ; PASSWORD$: � ϭĎ �8Ǐ ===== process a nugget �B�NEWLINE$ � ">" � GUESS$ ,�LǍ ��: :�� push line onto stack d�VǑ @ CURPALOC%, GUESS$;: :�� un-highlight the nugget ��`Ǒ @ CURPALOC%, ��();CURCHAR$;��();: :�� re-highlight the current position )�eǋ CURSIDE% �  � LPOSTOWORD%(CURFIELDPOS%) � � :� RPOSTOWORD%(CURFIELDPOS%) � �: :�� tag this nugget as used ��jǋ ��() �  � �  � :� � �: :�� 20% chance of replenish guesses vs 80% remove dud ��t�GUESSISNUGGET% �  ��~�GUESS$ � CURCHAR$ ����CURWORD% � � ���Ǎ ��: :�� reprint the prompt with just the one character ��ǎ 4�,ɏ ===== "Error" on retrying existing nugget P�6�NEWLINE$ � ">" � GUESS$ t�@ɍ ��: :�� push line onto stack ��J�NEWLINE$ � ">Error." ��Tɍ ��: :�� push line onto stack �^ɍ h�: :�� print the right-side lines and re-prompt �hɎ � ˏ ===== Replenish guesses ,�*�NEWLINE$ � ">Tries reset." P�4ˍ ��: :�� push line onto stack k�\�GUESSES% � MAXGUESSES% ��fˍ ��: :�� reprint guesses-left boxes ��p�GUESS$ � CURCHAR$ �zˍ h�: :�� print the right-side lines and prompt 汎ˎ ��Ϗ ===== Remove a dud Z��DUD% � ��(WORDLISTLENGTH%): � DUD% � PASSWORDIDX% � � :� � WORDS$(DUD%) � DUD$ � � r��WORDS$(DUD%) � DUD$ �!ϋ DUD% � LSIDEWORDCOUNT% � ��(RSIDE$, RSIDEPOS%(DUD%�LSIDEWORDCOUNT%),WORDLENGTH%) � DUD$ :� ��(LSIDE$, LSIDEPOS%(DUD%),WORDLENGTH%) � DUD$ �&�OLDCURWORD% � CURWORD% 1�0�CURWORD% � DUD% ��:ύ �: :�� un-highlight (and therefore re-display the now-DUD$) current word ��D�CURWORD% � OLDCURWORD% ��N�NEWLINE$ � ">Dud removed." �Xύ ��: :�� push line onto stack �bύ h�: :�� reprint right-side lines and prompt �_� a�`� ===== IMPORT WORD LIST - GOTO the correct word-length entry point ��j�WORDLISTCOUNT% � : :�� the number of five-letter word lists �t� ��(WORDLISTCOUNT%) � H�,��,�,t�,��,<�,��,�: :�� Pick a random list, point to the DATA �~� T� R��� WORDLISTCOUNT% = 8: ' the number of six-letter word lists ε�� ON RND(WORDLISTCOUNT%) GOSUB 61000,61100,61200,61300,61400,61500,61600,61700: ' Pick a random list, point to the DATA ߵ�� GOTO 60500 !��� WORDLISTCOUNT% = 8: ' the number of seven-letter word lists ���� ON RND(WORDLISTCOUNT%) GOSUB 61000,61100,61200,61300,61400,61500,61600,61700: ' Pick a random list, point to the DATA ���� GOTO 60500 ��� WORDLISTCOUNT% = 8: ' the number of eight-letter word lists l��� ON RND(WORDLISTCOUNT%) GOSUB 61000,61100,61200,61300,61400,61500,61600,61700: ' Pick a random list, point to the DATA }��� GOTO 60500 ��T� ===== DATA selected, import the DATA into WORDS$() ̷^� WORDLISTLENGTH% �h� WORDS$(WORDLISTLENGTH%) �r�ROTATOR% � ��(WORDLISTLENGTH%) +�|� J �  � WORDLISTLENGTH% I���  WORDIDX% � J � ROTATOR% ����  � WORDIDX% � WORDLISTLENGTH% � WORDIDX% � WORDIDX% � WORDLISTLENGTH% ����  � WORDS$(WORDIDX%) ���� J ���� �H� ===== WORD LISTS, each list begins with a number representing the length of the list  �R� \� ��\� 15,TAKES,KNOWN,KICKS,STARK,BOOTS,BATON,CLEAR,CRIME,WASTE,CLOSE,SWORD,SLAVE,FARGO,MAYBE,MALES ��f� ���� �� ���� 15,RANGE,REINS,EQUAL,MEANS,PENAL,JUDGE,STATE,MINUS,PRANK,WORRY,OUNCE,BEGUN,COVER,START,TRADE ���� �� � i�� 15,PACED,EARLY,FIRST,LUCID,FRONT,HEAVY,PARTY,BADLY,BASIS,SNUFF,STUDY,QUICK,ROUND,FRIES,TRUNK o�$� y�t� ~� ܺ~� 15,HEAVY,PRICE,GLARE,PEACE,UNION,ODDLY,NIGHT,DEMON,BLOAT,AWARE,HAPPY,EXTRA,MINOR,HEADS,MONTH ⺈� ��� �� O��� 15,PERKY,ENVOY,ADULT,NYLON,ROCKS,SAVED,CLOSE,TRAIN,SHARE,FRESH,BASIS,TRULY,SLEEP,ENTER,RIGHT U��� _�<�� F� »F�� 15,BLOWN,SCANT,WOMEN,SIZES,CLOTH,BONDS,STORE,BOARD,ORDER,AMONG,ARMOR,WISER,FAITH,SELLS,BLADE ȻP�� һ��� �� 5���� 15,TODAY,VIPER,TRIPS,CARRY,LOADS,MALES,CRIED,TILES,THINK,SLIDE,CAVES,POUCH,CALLS,WALLS,TRACK ;���� E�� � ��� 15,GLEAM,WEEKS,TIGHT,SLIPS,FLESH,RAISE,WEARS,SMALL,SWAMP,TRADE,STAFF,SHOTS,EXIST,RELAY,REFER ���   