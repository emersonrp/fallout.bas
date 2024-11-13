�� � vim: ft=basic �
 �   : � S� � BREAK � ?�: :�� Compiler honors this, interpreter ignores it n�d � ===== STARTUP SCREEN ��n INTELLIGENCE% �  ��x DIFFICULTY% �  ��� CONTROL% �  ��� INTWARNING% �  Ä� � ��� � @ P,  "Welcome to ROBCO Industries(TM) Termlink" $�� � @ P�, "Terminal Hacking Trainer" H�� � @ P� � !, "SELECT OPTIONS" R�� � X ��� � @ P� � , "[Enter] or [Space] to begin"; ��� � @ �P, ""; ���KEYIN$ � �: � KEYIN$ � "" � � �� KEYIN$ � ��()  � � & :� � KEYIN$ � "h" � � & ,��� KEYIN$ � ��()  � � � :� � KEYIN$ � "l" � � � r��� KEYIN$ � ��(
) � CONTROL% �  :� � KEYIN$ � "j" � CONTROL% �  ���� KEYIN$ � ��() � CONTROL% �  :� � KEYIN$ � "k" � CONTROL% �  ��� KEYIN$ � ��() � � :� � KEYIN$ � " " � � ���� X: � � ��� handle go-right v��� CONTROL% �  � INTELLIGENCE% � INTELLIGENCE% � :  � INTELLIGENCE% �  � INTELLIGENCE% �  χ� CONTROL% �  � DIFFICULTY% � DIFFICULTY% � :  � DIFFICULTY% �  � DIFFICULTY% �  E�� DIFFICULTY% �  � � INTELLIGENCE% �  � INTELLIGENCE% � : INTWARNING% � : :�� requires int 4 for hacker perks K�� `�&� handle go-left ��0� CONTROL% �  � INTELLIGENCE% � INTELLIGENCE% � :  � INTELLIGENCE% �  � INTELLIGENCE% �  �:� CONTROL% �  � DIFFICULTY% � DIFFICULTY% � :  � DIFFICULTY% �  � DIFFICULTY% �  ��D� INTELLIGENCE% �  � � DIFFICULTY% �  � DIFFICULTY% � : INTWARNING% � : :�� requires int 4 for hacker perks ��N� ډX� Print the "Intelligence" line; highlight control if appropriate �b� @ P� � , "Player Intelligence: "; ��();"<";��();" "; =�l� CONTROL% �  � � ��(); o�v� INTELLIGENCE% �� 
 � � "   "; :� � "    "; ���� ��(INTELLIGENCE%);"    "; ���� CONTROL% �  � � ��(); ʊ�� " ";��();">";��() ��� Print the "Difficulty" line; highlight control if appropriate R��� @ P� � , "Terminal Difficulty: "; ��();"<";��();" "; q��� CONTROL% �  � � ��(); ���� DIFFICULTY% �  � � "  Novice  "; :� � DIFFICULTY% �  � � " Advanced "; :� � DIFFICULTY% �  � � "  Expert  "; :� � "  Master  "; ��� CONTROL% �  � � ��(); 5��� " ";��();">";��() [� � Print the INT warning if needed ڌ*� INTWARNING% �  � � @ P� � , "Higher difficulty terminals require at least 4 INT"; :� � @ P �  � , �(2, " "); �4INTWARNING% �  �>� @ �P, ""; �H� 6��� ===== Print the top lines of the game UI <��� u��� @ P,  "Welcome to ROBCO Industries (TM) Termlink" ���� @ �, "Password Required" 卬� @ �, ��(); " "; ��(); ��();: :�� fake cursor for compiled version -��� ===== set up the vars representing the left and right text fields O��GUESSES% � : MAXGUESSES% �  u��� `�: :�� Populate the word list ���WORDLENGTH% � ��(WORDS$()) ��PASSWORDIDX% � ��(WORDLISTLENGTH%) �PASSWORD$ � WORDS$(PASSWORDIDX%) �CURWORD% �  G�$� OUTPUTLINES$(): :�� 15 lines because the bottom one we always do dynamically ��.� PAPOSITIONS%(WORDLISTLENGTH%,WORDLENGTH%): :�� (number of words, length) �8� LWORDTOPOS%(WORDLISTLENGTH%, WORDLENGTH%), RWORDTOPOS%(WORDLISTLENGTH%, WORDLENGTH%) �B� LPOSTOWORD%(�), RPOSTOWORD%(�) ��LHEXADDRESS! � ��(�� ) � ��(�) �  : � HEXADDRESS! � � � HEXADDRESS! � HEXADDRESS! �    � ��VGUESSISNUGGET% �  ��`DUD$ � �(WORDLENGTH%, ".") �j� GARBAGECHARS$ contains double of most things to make []{}()<> less likely O�tGARBAGECHARS$ �  "/\%@#$%^*-=+,.:;?_/\%@#$%^*-=+,.:;?_[]{}()<>" `�~� I �  � 2 ���  NEWCHAR$ � ��(GARBAGECHARS$, ��(��(GARBAGECHARS$)), ) ڑ�  � NEWCHAR$ � LASTLCHAR$ � � :� LASTLCHAR$ � NEWCHAR$ ���  LSIDE$ � LSIDE$ � NEWCHAR$ ��� 8��LSIDE$ � LSIDE$ � LSIDE$ � LSIDE$ � ��(LSIDE$, *) e��RSIDE$ � ��(LSIDE$,  ) � ��(LSIDE$, �) ϒ� ===== add nuggets explicitly, just sprinkle some of them in there and let them land where they may. �NUGGSIDE% �  ��(� I �  � � �  6�2  I � I � ��() � : :�� randomize locations a little M�<  NUGGIDX% � ��() ��F  NEWNUGGET$ � ��("[{<(",NUGGIDX%,) � ��(LSIDE$, ��(��(LSIDE$)), ��()�) � ��("]}>)",NUGGIDX%,) %�P  � NUGGSIDE% �  � ��(LSIDE$, I, ��(NEWNUGGET$)) � NEWNUGGET$ :� ��(RSIDE$, I, ��(NEWNUGGET$)) � NEWNUGGET$ E�Z  NUGGSIDE% �  � NUGGSIDE% M�d� I ���� ===== sprinkle the words into the text fields ���� LSIDEPOS%(WORDLISTLENGTH%), RSIDEPOS%(WORDLISTLENGTH%) ܔ�� I �  � WORDLISTLENGTH% 	�  TESTPOS% � ��(� � WORDLISTLENGTH%) G�  � ��() � ",�: :�� randomly pick right or left side Y�"  � Left side ��,  � LPOSTOWORD%(TESTPOS%) �  � : :�� overlaps or abuts another word on the left �6  � TESTPOS% �  � � LPOSTOWORD%(TESTPOS%�) �  � : :�� too close to another word on the left |�@  � LPOSTOWORD%(TESTPOS%�WORDLENGTH%) �  � : :�� overlaps or abuts another word on the right ��J  � TESTPOS% � WORDLENGTH% � � LPOSTOWORD%(TESTPOS%�WORDLENGTH%�) �  � : :�� too close to another word on the right �T  LSIDEPOS%(I) � TESTPOS% 3�^  � J �  � WORDLENGTH% ]�h    LPOSTOWORD%(LSIDEPOS%(I)�J�) � I ��r    LWORDTOPOS%(I, J) � LSIDEPOS%(I)�J� �|    ��(LSIDE$, LSIDEPOS%(I)�J�) � ��(WORDS$(I),J,): :�� do this in here because enhcomp demands it ���  � J 	��  � (� ��  �  (��  � Right side {��  � RPOSTOWORD%(TESTPOS%) �  � : :�� too close to another word on the left ᘸ  � TESTPOS% �  � � RPOSTOWORD%(TESTPOS%�) �  � : :�� too close to another word on the left A��  � RPOSTOWORD%(TESTPOS%�WORDLENGTH%) �  � : :�� too close to another word on the right ���  � TESTPOS% � WORDLENGTH% � � RPOSTOWORD%(TESTPOS%�WORDLENGTH%�) �  � : :�� too close to another word on the right ܙ�  RSIDEPOS%(I) � TESTPOS% ���  � J �  � WORDLENGTH% "��    RPOSTOWORD%(RSIDEPOS%(I)�J�) � I O��    RWORDTOPOS%(I, J) � RSIDEPOS%(I)�J� ���    ��(RSIDE$, RSIDEPOS%(I)�J�) � ��(WORDS$(I),J,): :�� do this in here because enhcomp demands it   � J Κ  � � ֚� I �'� ===== print the text fields at the right place 8�'� @ �, " ";: :�� clear the fake cursor I�$'� I �  �  b�.'  PALOC � (I�) � P �8'  � @ PALOC, "0x" ; ��(HEXADDRESS!) ; " " ; ��(LSIDE$, I� � , ) ; " 0x" ; ��(HEXADDRESS! � (�)) ; " " ; ��(RSIDE$, I� � , ); �B'  HEXADDRESS! � HEXADDRESS! �  �L'� I O�V'� ��: :�� reprint "attempts remaining" line o�`'� ��: :�� print the prompt �� N� ===== Set up the initial cursor location �*NCURX% � : CURY% � : CURSIDE% � : :�� CURSIDE% 0 = LEFT, 1 = RIGHT �4N� @� *�R� ===== Do the input loop and dispatch appropriately N�RKEYIN$ � �: � KEYIN$ � "" � R ��R� KEYIN$ � ��()  � � �� :� � KEYIN$ � "h" � � �� ��&R� KEYIN$ � ��()  � � `� :� � KEYIN$ � "l" � � `� ��0R� KEYIN$ � ��(
) � � 4� :� � KEYIN$ � "j" � � 4� .�:R� KEYIN$ � ��() � � �� :� � KEYIN$ � "k" � � �� ��DR� KEYIN$ � ��() � � CURWORD% � � � � ,� :� � GUESSISNUGGET% �  � � 8� :� � CURWORD% �  � � P� :� � ,� �NR� KEYIN$ � " " � � CURWORD% � � � � ,� :� � GUESSISNUGGET% �  � � 8� :� � CURWORD% �  � � P� :� � ,� ��U� R J�?��: � "Terminal hacking training ended.": � ��@�� ===== sub to DTRT with the current cursor location ߟC�� print / unhighlight our current thingie before we change around where CURPALOC points A�E�� GUESSISNUGGET% �  � � @ CURPALOC%, GUESS$;: GUESSISNUGGET% �  :� � @ CURPALOC%, CURCHAR$; j�G�� CURWORD% �  � � �: CURWORD% �  ��J�CURFIELDPOS% � (CURY%�) �  � CURX% ��T�� CURSIDE% �  � CURPALOC% � (CURY%�)�P �  � CURX% :� CURPALOC% � (CURY%�)�P �  � CURX% ]�^�� CURSIDE% �  � CURCHAR$ � ��(LSIDE$, CURFIELDPOS%, ) :� CURCHAR$ � ��(RSIDE$, CURFIELDPOS%, ) ��h�� CURSIDE% �  � CURWORD% � LPOSTOWORD%(CURFIELDPOS%) :� CURWORD% � RPOSTOWORD%(CURFIELDPOS%) �|�� CURWORD% �  � � WORDS$(CURWORD%) �� DUD$ � � �: � �� :� � ȯ J���� CURWORD% �� � � � CURCHAR$ � "{" � ENDCHAR$ � "}": � ��: � ����� CURWORD% �� � � � CURCHAR$ � "[" � ENDCHAR$ � "]": � ��: � Т��� CURWORD% �� � � � CURCHAR$ � "<" � ENDCHAR$ � ">": � ��: � ���� CURWORD% �� � � � CURCHAR$ � "(" � ENDCHAR$ � ")": � ��: � X���� ��(CURCHAR$) � A � � ȯ: � :� � ��(CURCHAR$) � Z � � ȯ: � ^�� ���� ===== SET CURY and CURX from CURFIELDPOS - this is for exiting a word to the right or left ��CURY% � ��(CURFIELDPOS% � ) �  ��CURX% � CURFIELDPOS% � ((CURY%�) � ) A�&�� CURX% �  � CURX% � : CURY% � CURY% �  G�0�� h�4�� ===== handle "cursor down" ��>�� CURY% �  � CURY% � CURY% �  ��H�� @� ��R�� ����� ===== handle "cursor up" ढ�� CURY% �  � CURY% � CURY% �  ꤬�� @� 𤶞� ���� ===== handle "cursor left" ���� CURWORD% �  � � CURSIDE% �  � CURFIELDPOS% � LWORDTOPOS%(CURWORD%, ): � � :� CURFIELDPOS% � RWORDTOPOS%(CURWORD%, ): � � ��� CURX% �  � CURX% � CURX% �  :� � CURSIDE% �  � CURSIDE% � : CURX% �  ��� @� ��$�� �`�� ===== handle "cursor right" ��j�� CURWORD% �  � � CURSIDE% �  � CURFIELDPOS% � LWORDTOPOS%(CURWORD%, WORDLENGTH%): � � :� CURFIELDPOS% � RWORDTOPOS%(CURWORD%, WORDLENGTH%): � � �t�� CURX% �  � CURX% � CURX% �  :� � CURSIDE% �  � CURSIDE% � : CURX% �  �~�� @� ���� l�(�� ===== fill a two-dimensional array with lists of "print @" locations for LSIDE ��2�RAWPOS% � LSIDEPOS%(I) ��<�CURROW% � ��(RAWPOS% � ) �  ڧF�CURCOL% � (RAWPOS% � ��(RAWPOS% � ) � ) �K�� CURCOL% �  � CURCOL% � : CURROW% � CURROW% �  ,�P�� J �  � WORDLENGTH% d�Z�  PAPOSITIONS%(I, J) � (CURROW% � P) �  � CURCOL% ��d�  CURCOL% � CURCOL% �  ��n�  � CURCOL% �  � CURCOL% � : CURROW% � CURROW% �  ¨x�� J Ȩ��� ��� ===== fill a two-dimensional array with lists of "print @" locations for RSIDE 8��RAWPOS% � RSIDEPOS%(I) [�$�CURROW% � ��(RAWPOS% � ) �  ��.�CURCOL% � (RAWPOS% � ��(RAWPOS% � ) � ) é3�� CURCOL% �  � CURCOL% � : CURROW% � CURROW% �  ݩ8�� J �  � WORDLENGTH% �B�  PAPOSITIONS%(I, J) � (CURROW% � P) �  � CURCOL% 2�L�  CURCOL% � CURCOL% �  l�V�  � CURCOL% �  � CURCOL% � : CURROW% � CURROW% �  t�`�� J z�j�� Ǫ��� ===== highlight the word pointed to by CURWORD% and put it lower-right ��PALOC � ( � P) � * ��� @ PALOC, "            ";: :�� clear the prompt area 6��� J �  � WORDLENGTH% �� �  � @ PAPOSITIONS%(CURWORD%, J), ��() � ��(WORDS$(CURWORD%), J, ) � ��(); ��*�  � @ PALOC, ��(WORDS$(CURWORD%), J, ); Ϋ4�  PALOC � PALOC �  ֫>�� J (�H�� @ PALOC, ��(); " "; ��(); ��();: :�� fake cursor for compiled version .�R�� g�૏ ===== UN-highlight the word pointed to by CURWORD% �嫋 CURWORD% ��  � � ��ꫂ J �  � WORDLENGTH% ڬ��  � @ PAPOSITIONS%(CURWORD%, J), ��(WORDS$(CURWORD%), J, ); ���� J ��� -�ȯ� ===== Highlight a single character and clear any selected word b�ү� @ CURPALOC%, ��(); CURCHAR$; ��(); ��(); x�ܯGUESS$ � CURCHAR$ ��母 � ��� CURWORD% �  � CURWORD% �  ����� �� ���� ���� ===== Detect nuggets, make sure they're not already used, highlight them 7���� �: :�� unhighlight the last word we were on ����� CURSIDE% �  � TESTWORD% � LPOSTOWORD%(CURFIELDPOS%) :� TESTWORD% � RPOSTOWORD%(CURFIELDPOS%) �ĳ� TESTWORD% � � � � ȯ: �: :�� We have used this nugget already A�ɳ� (CURFIELDPOS% � (��(CURFIELDPOS% � ) � )) �  � � ȯ: �::�� started at EOL, bail out f�γINCRX% � : TESTNUGG$ � CURCHAR$ ��سNUGGETPOS% � CURFIELDPOS% � INCRX% �ⳋ (NUGGETPOS% � (��(NUGGETPOS% � ) � )) �  � � ȯ: �::�� hit EOL, bail out F�쳋 CURSIDE% �  � TESTCHAR$ � ��(LSIDE$, NUGGETPOS%, ) :� TESTCHAR$ � ��(RSIDE$, NUGGETPOS%, ) ����� TESTCHAR$ � ENDCHAR$ � TESTNUGG$ � TESTNUGG$ � TESTCHAR$: � �� : �: :�� found end marker, append, highlight nugget � �� ��(TESTCHAR$) �� A � � ��(TESTCHAR$) �� Z � � ȯ: �: :�� hit a letter, bail out s�
�TESTNUGG$ � TESTNUGG$ � TESTCHAR$: :�� OK, add the character and move to the next one ���INCRX% � INCRX% �  ���� س 걤�� ===== Highlight detected nugget, push it into GUESS, update lower-right prompt ���GUESS$ � TESTNUGG$: GUESSISNUGGET% �  >���� @ CURPALOC%, ��();GUESS$;��(); H�µ� �� N�̵� z���� ===== print "attempts remaining" line ����� @ �, "Attempts Remaining: "; ����� J �  �  ˲��  PALOC � � � (J � ) ���  � J �� GUESSES% � � @ PALOC, " " ; ��() ; " " ; ��(); :� � @ PALOC, "  "; '���� J -�ʷ� n���� ===== rotate / push the "stack" of right-hand output lines ����� J �  �  � � ����  OUTPUTLINES$(J) � OUTPUTLINES$(J�) ����� J ճ��OUTPUTLINES$() � NEWLINE$ ۳��� �h�� ===== print the right-hand lines and the prompt "�r�� J �  �  E�w�  PALOC � (( � J) � P) � ) ��|�  � OUTPUTLINES$(J) �� "" � � @ PALOC, OUTPUTLINES$(J);�( � ��(OUTPUTLINES$(J)), " "); ����� ���� ===== sometimes we GOSUB into the middle, here, if we just want to print the prompt ���PALOC � �P � ) W���� @ PALOC, ">               ";: :�� clear the line, then: ����� @ PALOC, ">" ; GUESS$; ��(); " "; ��(); ��();: :�� fake cursor for compiled version ��¿� ٵPÏ ===== process a guess ��Z�GUESS$ � WORDS$(CURWORD%) e�dË CURWORD% � PASSWORDIDX% � YOUWON% � : NEWLINE$ � ">"�GUESS$: � ��: GUESS$ � "Accepted.": � h�: � � v�n�MATCHES% �  ��xÂ J �  � ��(GUESS$) ض��  � ��(GUESS$, J, ) � ��(PASSWORD$, J, ) � MATCHES% � MATCHES% �  ඌÃ J ����NEWLINE$ � ">" � GUESS$ ��Í �� &���NEWLINE$ � ">Entry denied." 0��Í �� b���NEWLINE$ � ">Likeness=" � ��(��(MATCHES%), ) l��Í �� ���Í h�: :�� print the lines ����GUESSES% � GUESSES% �  ط�Í ��: :�� reprint "attempts remaining" line 
��Í ��: :�� repoint the cursor to bottom right !��Ë GUESSES% �  � � e�ď ELSE we are out of guesses, just fall through to the next bit ��đ @ PALOC, ">Init lockdown."; ��ď ===== print results, wait for input *�"ċ YOUWON% �  � � @ �, "*** HACKING SUCCESSFUL! ***   " :� � @ �, "OUT OF ATTEMPTS!  PASSWORD WAS: " ; PASSWORD$ y�,�PALOC � �P � ) � ��(GUESS$) � : � @ PALOC, " ": :�� clear fake cursor ��6đ @ �P, "<ENTER> or <SPACE> for more training, <BREAK> to end."; �@�KEYIN$ � �: � KEYIN$ � "" � @� �Jċ KEYIN$ � ��() � � :� � KEYIN$ � " " � � :� @� "�DŎ ?�8Ǐ ===== process a nugget [�B�NEWLINE$ � ">" � GUESS$ �LǍ ��: :�� push line onto stack ںVǑ @ CURPALOC%, GUESS$;: :�� un-highlight the nugget TODO the real game doesn't do this O�`Ǒ @ CURPALOC%, ��();CURCHAR$;��();: :�� re-highlight the current position TODO the real game doesn't do this »jǋ CURSIDE% �  � LPOSTOWORD%(CURFIELDPOS%) � � :� RPOSTOWORD%(CURFIELDPOS%) � �: :�� tag this nugget as used O�tǋ ��() �  � �  � :� � �: :�� 20% chance of replenish guesses vs 80% remove dud TODO play some fallout and get the right percentages e�~�GUESS$ � CURCHAR$ w���CURWORD% � � ���Ǎ ��: :�� reprint the prompt with just the one character ���ǎ �,ɏ ===== "Error" on trying non-word character �6�NEWLINE$ � ">" � GUESS$ ,�@ɍ ��: :�� push line onto stack D�J�NEWLINE$ � ">Error" h�Tɍ ��: :�� push line onto stack ��^ɍ h�: :�� print the right-side lines and re-prompt ��hɎ Ľ ˏ ===== Replenish guesses �*�NEWLINE$ � ">Tries reset." �4ˍ ��: :�� push line onto stack "�\�GUESSES% � MAXGUESSES% S�fˍ ��: :�� reprint "attempts remaining" line i�p�GUESS$ � CURCHAR$ ��zˍ h�: :�� print the right-side lines and prompt ���ˎ ��Ϗ ===== Remove a dud ��DUD% � ��(WORDLISTLENGTH%): � DUD% � PASSWORDIDX% � � :� � WORDS$(DUD%) � DUD$ � � 0��WORDS$(DUD%) � DUD$ ��&ϋ RSIDEPOS%(DUD%) �  � ��(RSIDE$, RSIDEPOS%(DUD%),WORDLENGTH%) � DUD$ :� ��(LSIDE$, LSIDEPOS%(DUD%),WORDLENGTH%) � DUD$ ȿ0�OLDCURWORD% � CURWORD% ܿ:�CURWORD% � DUD% -�Dύ �: :�� un-highlight (and therefore re-display the now-DUD$) current word H�N�CURWORD% � OLDCURWORD% g�X�NEWLINE$ � ">Dud removed." ��bύ ��: :�� push line onto stack ��lύ h�: :�� reprint right-side lines and prompt ��_� �`� ===== IMPORT WORD LIST - GOTO the correct word-length entry point j�j� DIFFICULTY% � t�,~�,��,
�: :�� dispatch to difficulty pickers or directly to Master ��t� ��() � ��,��: :�� four or five letter words for Novice ��~� ��() � ��,��: :�� six or seven letter words for Advanced -� ��() � ��,��: :�� eight or nine letter words for Expert {� ��() � R�,f�,z�,��,��,��,��,��: :�� four-letter lists (Novice) �� T� �¦� ��() � ��,�,$�,8�,L�,`�,t�,��: :�� five-letter lists (Novice) �°� T� ,ú� ��() � ��,��,��,��,��,
�,�,2�: :�� six-letter lists (Advanced) 6��� T� ���� ��() � P�,d�,x�,��,��,��,��,��: :�� seven-letter lists (Advanced) ���� T� ���� ��() � ��,�,"�,6�,J�,^�,r�,��: :�� eight letter lists (Expert) ���� T� 8��� ��() � ��,��,��,��,��,�,�,0�: :�� nine letter lists (Expert) B� � T� ��
� ��() � N�,b�,v�,��,��,��,��,��: :�� ten letter lists (Master) ��� T� ��T� ===== DATA selected, import the DATA into WORDS$() ��^� AWLENGTH% ��h� ALLWORDS$(AWLENGTH%) �r� J �  � AWLENGTH% *�|�  � ALLWORDS$(J) 2ņ� J <Ő� �� ZŚ� WORDS$(WORDLISTLENGTH%) xŤ� J �  � WORDLISTLENGTH% �Ů�  GWIDX% � ��(AWLENGTH%) �Ÿ�  � ALLWORDS$(GWIDX%) � "" � �� ����  WORDS$(J) � ALLWORDS$(GWIDX%) ����  ALLWORDS$(GWIDX%) � "" ��� J 	��� ?ƀ� ===== GET WORDLISTLENGTH% BASED ON INTELLIGENCE IƊ� �� WƔ� DW%() zƞ� 20,18,17,15,14,12,11,9,8,6,6 �ƨ� J �  � : � DW%(J): � J �Ʋ�WORDLISTLENGTH% � DW%(INTELLIGENCE%) �Ƽ� ��H� ===== FOUR-LETTER WORD LISTS ��R� \�: � f�\� 20,POST,TALE,BELT,PLOT,SETS,JOIN,GATE,GAIN,EARN,PAID,SLID,NOTE,TALK,FOLD,WAKE,CASE,SIDE,WANE,BUSY,SASH s�f� p�: � ��p� 20,BUSY,SASH,DAIS,DEEP,SOUL,BEAM,LAKE,EACH,BEEN,FEET,IDEA,DECK,RAID,FULL,NEXT,SORT,SHOP,RELY,SAME,HUGE ��z� ��: � ZȄ� 20,SAME,HUGE,WALK,POST,SALT,CORN,IRON,GAIN,CODE,SHOT,RATE,SKIN,NAIL,WORD,HAIR,RARE,CARE,PAYS.SEND,CORE gȎ� ��: � �Ș� 20,SEND,CORE,MATE,GANG,DANK,GAVE,FOOD,GRAY,BONE,MAZE,SLUM,GLOW,SLID,CASE,SURE,DONE,SUNG,ABLE,CURE,PETS �Ȣ� ��: � Nɬ� 20,CURE,PETS,MAKE,HUTS,WHEN,BEEN,JUST,HOME,GAME,SEEM,TILE,TARP,LAKE,TURN,EARN,PAIN,THIN,EYES.SAND,NEAR [ɶ� ��: � ���� 20,SAND,NEAR,TEST,RATS,LAKE,EGOS,DUEL,LIES,ARMS,TALE,WEST,PUSH,FUSE,CAGE,TRAP,TYPE,LESS,BUNK.PICK,CAGE ���� ��: � B��� 20,PICK,CAGE,WARD,WOOD,CITY,WEAK,FIRE,HIGH,PETS,WERE,FIVE,SEEK,HERO,RUSE,NEWS,MASS,BALL,CORE,ADDS,PATH O��� ��: � ���� 20,ADDS,PATH,TALK,CALL,MANY,MAKE,POLE,PUSH,PANS,DENY,SETS,MAZE,BOSS,GUTS,COST,DUTY,PETS,ROLL,POST,TALE ���� ===== FIVE-LETTER WORD LISTS ���� �: � m�� 20,HIRED,PULLS,CLAWS,HILLS,CELLS,WORKS,TILES,HOLES,SANDS,RUMOR,SIDES,KINDS,SURGE,SENSE,HEART,JAMES,RAIDS,CRIED,BLAST,SPANS z�� �: � ��� 20,BLAST,SPANS,DEMON,SWEPT,LIGHT,DEITY,TRIED,THROW,DIARY,LEVEL,TELLS,SPREE,LOVED,LISTS,HALLS,WIRES,RIVAl,MAKES,CANDY,MODEL �$� .�: � ��.� 20,CANDY,MODEL,DRIED,IDEAS,SHEER,STAKE,HOLDS,RANGE,UPSET,LORDS,EAGER,STERN,RIVAL,CRUDE,SPEAR,TRACT,HORDE,FRUIT,FLASH,VALUE ��8� B�: � �B� 20,FLASH,VALUE,CLOUD,CRUDE,TRIPS,BLEND,LOVES,ALLOW,HORDE,REPEL,LEAST,SPANS,MEATS,HOPES,CODES,OASIS,LIVES,BOOST.FARMS,FACES $�L� V�: � ��V� 20,FARMS,FACES,EARLY,HIDES,QUEST,BUILD,CARDS,FLUID,HOWLS,CASES,TYPED,TAKES,BOOKS,ENEMY,TANKS,HOLDS,WIRES,MAKES,DRAWN,LEAVE ��`� j�: � 3�j� 20,DRAWN,LEAVE,HENCE,CLEAN,SPEND,ROCKY,PARTY,CANDY,CACHE,LOOMS,PLACE,CLOCK,AGREE,PICKS,GUARD,HOLDS,VENOM,PRONE,DARED,LIGHT @�t� ~�: � ��~� 20,DARED,LIGHT,LASER,FOYER,LUCKY,TEAMS,THIEF,BOOTS,POWER,HANDS,TOXIC,TYPES,NEVER,MOVED,ROCKY,TIRED,HAVEN,TYPED,CAUSE,SEVER �Έ� ��: � Oϒ� 20,CAUSE,SEVER,WROTE,SINCE,LUCKY,GOODS,LEAST,SEEMS,NEARS,AGAIN,TRASH,LASER,TELLS,WORDS,SEEDS,LANDS,CLUMP,ROOMS,HIRED,PULLS qϜ� ===== SIX-LETTER WORD LISTS ~Ϧ� ��: � �ϰ� 15,DEMEAN,BUNKER,PROVED,THOUGH,ARGUED,HACKER,PREFER,MINUTE,WISHES,DAGGER,CHASED,BOOTHS,DIPPED,SIRENS,FENDED �Ϻ� ��: � o��� 15,GEIGER,MOSTLY,PATROL,BACKED,WANTED,CARVED,BREWER,MONGOL,BITTEN,LATEST,SUDDEN,PISTOL,ATTEND,MENIAL,BOTTLE |��� ��: � ���� 15,VISION,PROPER,JUSTIN,BETTER,PLENTY,ANSWER,MANNED,DENIES,FIERCE,FILTHY,FILLED,SLAVES,DEFEND,BOTTOM,CENTER ���� ��: � m��� 15,WEAKEN,KATANA,SQUARE,JACKET,TONGUE,SYSTEM,INTACT,MELTED,GENTLY,GLANCE,LEADER,NAILED,OPENLY,AFRAID,SONICS z���  �: � �� �� 15,WINTER,BROKEN,MODELS,EASIER,SPEARS,DEMEAN,GEIGER,UPROAR,KISSED,CREATE,STUFFS,CHOICE,SENSED,STONES,PLAYER ��
�� �: � k��� 15,PREFER,CRIMES,CRAVEN,LOSING,REOPEN,MODELS,FORCES,LIGHTS,WEAPON,RADIOS,RESULT,CAUSED,FLOORS,KATANA,BEFELL x��� (�: � ��(�� 15,BROKEN,WANDER,FLUENT,LEADER,GARDEN,TUNNEL,JACKAL,INSULT,JACKET,FACING,LOCALS,BORDER,SECRET,KNIGHT,PRISON ��2�� <�: � i�<�� 15,WILDLY,SHOVEL,RUSTED,WANTED,BOOTED,LOCALS,SHELLS,HUNTED,NEARBY,HEALED,FORCES,NORMAL,CRATES,BORDER,BARBED ��F�� ===== SEVEN-LETTER WORD LISTS ��P�� Z�: � �Z�� 15,GENGHIS,RUNDOWN,TAKINGS,CARRIED,SKETCHY,TUNNELS,BROUGHT,ALREADY,WRITING,URANIUM,REMAINS,DRESSES,COMMITS,OVERRUN,KITCHEN (�d�� n�: � ��n�� 15,NOTICED,STARTED,PLOTTED,CONQUER,HANDLES,STAINED,STATING,CREATED,BUNDLED,SMARTER,FOREVER,BLESSED,ASSUMED,CRAFTED,RETIRED ��x�� ��: � 7Ղ�� 15,KNIGHTS,TURRETS,BECOMES,CONTACT,TORCHES,SCRIBES,DAGGERS,CAREFUL,SIGNALS,PATTERN,LEGIONS,GANGERS,COUSINS,APPEARS,HARNESS DՌ�� ��: � �Ֆ�� 15,OPENING,TYRANNY,WHISPER,TATTOOS,ORLEANS,THEATRE,CREATED,BECAUSE,AFRRONT,THIEVES,OVERSEE,HOSTILE,INVADED,BARRENS,STAYING �ՠ�� ��: � S֪�� 15,ANNOYED,SECRETS,SUBJECT,COLLECT,PLAGUED,ESCORTS,TURRETS,QUALIFY,FILTERS,SOMEONE,MACHETE,CONSIST,ATTEMPT,NOTHING,INVOLVE `ִ�� ��: � �־�� 15,VARYING,FORBADE,BEEPING,MELISSA,ANYTIME,COPYING,KNIGHTS,TOWARDS,STORAGE,OFFICES,HANDLES,WEALTHY,CONFIRM,EXPRESS,PROCEED ����� ��: � o���� 15,EXACTLY,JUNGLES,OUTPOST,ATTENDS,OVERALL,BENEFIT,TALENTS,GREETED,BUNDLED,TRADING,HUNDRED,RAMPAGE,JOURNAL,BENCHES,FAVORED |���� ��: � ����� 15,INHUMAN,SMASHED,AMALGAM,INSTEAD,STREETS,CROWDED,POPULAR,COCHISE,ENABLES,EMBRACE,SECTION,RESIDES,MASSIVE,COPYING,REASONS !���� ===== EIGHT-LETTER WORD LISTS .���� �: � ��� 15,CHAMPION,SEARCHED,SPLINTER,CEREMONY,DESIGNED,POSSIBLY,PARANOIA,HALLWAYS,SHIELDED,CORRODED,COMPUTER,SOLITARY,STATUARY,SUFFERED,DUNGEONS ��� �: � [�� 15,PROGRESS,MISSIONS,PROMISES,DESIGNED,PLOTTING,EXTENDED,RUSTLING,GOVERNOR,FORAGING,DESOLATE,TRAINING,CORRIDOR,LOCATION,TENSIONS,THOUSAND h�"� ,�: � ��,� 15,FAMILIES,CONNECTS,DYNAMITE,NOWADAYS,CITADELS,PROMISES,JUNKTOWN,PORTIONS,DEFENDED,BONEYARD,LAUNCHER,INTRUDER,FOLLOWED,GRIEVOUS,CONQUERS �6� @�: � ��@� 15,RANSACKS,HIDEAWAY,PATIENTS,BUSINESS,HIDEOUTS,AGREEING,CHEMICAL,GATHERED,FIREARMS,REPTILES,SHIELDED,RECEIVES,CONFINED,ACTIVELY,BELIEVES ��J� T�: � 2�T� 15,KNEECAPS,REMUSTER,DECLARED,CARRYING,PROVIDES,LANGUAGE,PLEASURE,PAINTING,CANISTER,PRODUCED,MECHANIC,TWITCHES,ACTUALLY,ENGINEER,DISLIKED ?�^� h�: � ��h� 15,WILDFIRE,LAUNCHER,BLINKING,BARRACKS,JUNKTOWN,HARDWARE,SHACKLES,STANDARD,STEALTHY,SOUTHERN,CONTENTS,SCORPION,STEMMING,NORTHERN,OVERSEES ��r� |�: � l�|� 15,CHAMPION,ARSENALS,ALTERING,DEBATING,PASSKEYS,TIAJUANA,CHAMBERS,COMPUTER,EGYPTIAN,MANSIONS,MATERIAL,STUNNERS,ANYWHERE,DISPROVE,SYNOPSIS y܆� ��: � 	ݐ� 15,STRONGER,FIERCELY,PLEASANT,CHILDREN,IMPURITY,PRIORITY,FIREARMS,SCORPION,ELEMENTS,AGREEING,EXPANDED,LOYALIST,PURCHASE,RETRIEVE,CROSSBOW ,ݚ� ===== NINE-LETTER WORD LISTS 9ݤ� ��: � �ݮ� 15,FINALIZES,APOLOGIZE,RELIGIONS,DETERMINE,SEPARATED,VAPORIZES,UNDERWENT,SALVATION,FOOTSTEPS,OPERATION,TRAVELING,BELIEVING,BELONGING,RESIDENCE,STATIONED �ݸ� ��: � ���� 15,AMBITIONS,PLUNDERED,TRAVELERS,DIFFERENT,SCATTERED,FLAVORING,PERSONNEL,FIREFIGHT,BELIEVING,SITUATION,HISTORIES,TRIUMPHED,GATHERING,BANDOLEER,TERRIFIED ���� ��: � 0��� 15,WANDERING,MARAUDING,SHAMBLING,SOMETHING,SECLUSION,RETREATED,IMPORTANT,STUMBLING,BANDOLEER,ELSEWHERE,BATHROOMS,REPAIRING,CANISTERS,SANCTUARY,BELONGING =��� ��: � ���� 15,PROJECTOR,KNOWLEDGE,PRIMITIVE,MENTIONED,FORBIDDEN,OCCUPYING,PROLONGED,RADIATION,REALISTIC,THEREFORE,INVENTORS,IMPROVING,COLLECTED,REVERENCE,LOCKPICKS ���� ��: � ���� 15,SOMETHING,POSSESSES,CREATURES,BARTERING,INVENTORS,BATTERIES,WILLINGLY,WANDERING,PARTICLES,MUTATIONS,HURRIEDLY,PACIFISTS,MECHANISM,REPRESSED,BLOODSHED ��� �: � 4�� 15,GLADIATOR,DELIMITER,CLUSTERED,AGREEMENT,DEFENSIVE,STUMBLING,COURTYARD,CERTAINLY,RETURNING,ADDRESSED,DEVELOPED,REPRESSED,INITIATES,PLUNDERED,SECRETIVE A�� &�: � ��&� 15,TELEPHONE,REARGUARD,LISTENING,ASCENSION,SOUTHWARD,WASTELAND,SOUTHEAST,SLITHERED,GRAPPLING,KNOWLEDGE,OVERTHROW,FLATTENED,REPRESSED,GLADIATOR,MICROWAVE ��0� :�: � ��:� 15,ELIMINATE,AUTOMATED,POISONING,COMPANIES,APOLOGIZE,EMERGENCY,GLADIATOR,INNOCENTS,MENTIONED,POSSESSES,PREPARING,PAINTINGS,BUILDINGS,ENCOUNTER,HAPPINESS ��D� ===== TEN-LETTER WORD LISTS ��N� X�: � i�X� 15,INITIATION,STARVATION,CHALLENGED,ADMIRATION,PROSPERITY,FUNCTIONAL,LEADERLESS,ACTIVITIES,CONTENDING,MEDITATION,SUNGLASSES,RESEMBLING,PEACEFULLY,SCANDALOUS,DOMINATION v�b� l�: � $�l� 15,SKYSCRAPER,RETALIATED,NECROPOLIS,VEGETABLES,OVERLOOKED,REPUTATION,EXPLOSIVES,SUSPICIOUS,FLOURISHED,CONSIDERED,CHALLENGED,ESPECIALLY,MECHANICAL,UNFAITHFUL,DESTROYING 1�v� ��: � ��� 15,POSSESSION,GENERATION,ARBITRATOR,CONTAINERS,CONSIDERED,REFERENCES,BOBBLEHEAD,STRETCHING,ACCUSATION,DISCIPLINE,ABSOLUTELY,APPROACHES,INITIATION,CONDUCTING,COMMISSION ��� ��: � ��� 15,RECRUITING,UNDERSTAND,CEREMONIES,RECUPERATE,HISTORICAL,AGGRESSIVE,DEFINITELY,APPROACHES,TECHNICIAN,PROCLAIMED,PROCESSION,ADMIRATION,THEMSELVES,ACTIVITIES,EXPLOSIVES ��� ��: � U�� 15,VEGETABLES,REASONABLY,CONTENDING,SUNGLASSES,SACRIFICES,ABSOLUTELY,SURROUNDED,THEREAFTER,HEIGHTENED,DECIMATING,BINOCULARS,DEPARTMENT,APPROACHES,FOOTPRINTS,ADVANTAGES b�� ��: � �� 15,PROTECTIVE,DEPARTMENT,APPROACHES,UNDERSTAND,CROSSROADS,ENVISIONED,RECUPERATE,OBLITERATE,DELIVERING,TREATMENTS,HESITATION,REPUTATION,DETERMINED,WIDESPREAD,RESISTANCE ��� ��: � ���� 15,BUSINESSES,HYPERLIGHT,SURRENDERS,CONDUCTING,PERFORMERS,DESCENDENT,PROCESSING,REMEMBERED,QUANTITIES,SCAVENGING,BENEVOLENT,FUNCTIONAL,HEIGHTENED,MONITORING,VEGETABLES ���� ��: � ���� 15,CONTENTING,DISCOVERED,RANSACKING,POSSESSION,SPECIALIZE,DELIVERING,PERCENTAGE,SCAVENGING,SKYSCRAPER,SACRIFICES,OUTRAGEOUS,INTENTIONS,HISTORICAL,CASUALTIES,ABSOLUTELY   