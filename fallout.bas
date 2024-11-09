�� � vim: ft=basic �
 �   : �  � GUESSES% �  F� � `�: :�� Populate the word list f�( WORDLENGTH% � ��(WORDS$()) ��2 PASSWORDIDX% � ��(WORDLISTLENGTH%) ��< PASSWORD$ � WORDS$(PASSWORDIDX%) ĄF CURRWORD% �  �P � OUTPUTLINES$(): :�� 15 lines because the bottom one we always do dynamically h�Z � PAPOSITIONS%(WORDLISTLENGTH%,WORDLENGTH%): :�� (number of words, length) ��d � LPOSTOWORD%(�) ��n � RPOSTOWORD%(�) ���� ���� ؅� "Welcome to ROBCO Industries (TM) Termlink" ޅ� ��� "Password Required" ��&� �0� 
�:� R��� ===== set up the vars representing the left and right text fields \��� � ���� " ","/","\","%","@","#","$","%","^","&","*","-","=","+",",",".",":",";" � GARBAGECHARS$() �� I �  �  : � GARBAGECHARS$(I) : � ��� I �  � 2 $�$  NEWCHAR$ � GARBAGECHARS$(��()) a�.  � NEWCHAR$ � LASTLCHAR$ � $ :� LASTLCHAR$ � NEWCHAR$ ��8  LSIDE$ � LSIDE$ � NEWCHAR$ ��B� ��LLSIDE$ � LSIDE$ � LSIDE$ � LSIDE$ � ��(LSIDE$, *) �VRSIDE$ � ��(LSIDE$,  ) � ��(LSIDE$, �)  ��� ===== sprinkle the words into the text fields N��RSIDEWORDCOUNT% � ��(WORDLISTLENGTH% � ) ���LSIDEWORDCOUNT% � WORDLISTLENGTH% � RSIDEWORDCOUNT% ���LCELLLENGTH% � ��((�) � LSIDEWORDCOUNT%) �RCELLLENGTH% � ��((�) � RSIDEWORDCOUNT%) %�� LSIDEPOS%(LSIDEWORDCOUNT%), RSIDEPOS%(RSIDEWORDCOUNT%) ��� the math here is (move over X cells) + (middle of cell) - (center the word) + (randomize a bit) ��"� I �  � LSIDEWORDCOUNT% �,  LSIDEPOS%(I) � (LCELLLENGTH% � (I�)) � ��(LCELLLENGTH% � ) � ��(��(WORDS$(I)) � ) � (��() � ) .�6  � J �  � WORDLENGTH% l�@    ��(LSIDE$, LSIDEPOS%(I)�J�, ) � ��(WORDS$(I), J, ) ��J    LPOSTOWORD%(LSIDEPOS%(I)�J�) � I ��T  � J ��^  � (� ��h� I Ҋr� I �  � RSIDEWORDCOUNT% ;�|  RSIDEPOS%(I) � (RCELLLENGTH% � (I�)) � ��(RCELLLENGTH% � ) � ��(��(WORDS$(I)) � ) � (��() � ) ���  ��(RSIDE$, RSIDEPOS%(I), WORDLENGTH%) � WORDS$(I�LSIDEWORDCOUNT%) ���  � J �  � WORDLENGTH% ً�    RPOSTOWORD%(RSIDEPOS%(I)�J�) � I�LSIDEWORDCOUNT% ㋤  � J   � � ���� I ,�'� ===== print the text fields at the right place ;�'TOPROW �  Z�$'� ��: :�� set HEXADDRESS% k�.'� I �  �  ��3'  PALOC � (TOPROW � I) � P �8'  � @ PALOC, "0x" ; ��(HEXADDRESS%) ; " " ; ��(LSIDE$, I� � , ) ; " 0x" ; ��(HEXADDRESS% � (�)) ; " " ; ��(RSIDE$, I� � , ); ?�B'  HEXADDRESS% � HEXADDRESS% �  G�L'� I o�V'� ��: :�� print attempts remaining ��`'� ��: :�� print the prompt �� N� ===== Set up the initial cursor location �*NCURX% � : CURY% � : CURSIDE% � : :�� CURSIDE% 0 = LEFT, 1 = RIGHT �4N� @� J�R� ===== Do the input loop and dispatch appropriately n�RKEYIN$ � �: � KEYIN$ � "" � R ��R� KEYIN$ � ��()  � � l�: � R :� � KEYIN$ � "h" � � l�: � R ��&R� KEYIN$ � ��()  � � Н: � R :� � KEYIN$ � "l" � � Н: � R @�0R� KEYIN$ � ��(
) � � ��: � R :� � KEYIN$ � "j" � � ��: � R ��:R� KEYIN$ � ��() � � �: � R :� � KEYIN$ � "k" � � �: � R ��DR� KEYIN$ � ��() � � CURRWORD% �  � � P� ���U� R Ə?�� ��@�� ===== sub to DTRT with the current cursor location b�J�� CURSIDE% �  � CURPALOC% � (CURY%�)�P �  � CURX% :� CURPALOC% � (CURY%�)�P �  � CURX% ��T�CURFIELDPOS% � (CURY%�) �  � CURX% �^�� CURSIDE% �  � CURCHAR$ � ��(LSIDE$, CURFIELDPOS%, ) :� CURCHAR$ � ��(RSIDE$, CURFIELDPOS%, ) 7�h�� ��(CURCHAR$) � A � � ȯ: � :� � ��(CURCHAR$) � Z � � ȯ: � ��r�� CURSIDE% �  � CHECKWORD% � LPOSTOWORD%(CURFIELDPOS%) :� CHECKWORD% � RPOSTOWORD%(CURFIELDPOS%) ڑ|�� CHECKWORD% ��  � � �: CURRWORD% � CHECKWORD%: � �� ����� ���� ===== handle "cursor down" ���� @ CURPALOC%, CURCHAR$; o���� CURY% �  � CURY% � CURY% �  :� � CURSIDE% �  � CURSIDE% � : CURY% �  y�� @� �̜� ���� ===== handle "cursor up" ���� @ CURPALOC%, CURCHAR$; ��� CURY% �  � CURY% � CURY% �  :� � CURSIDE% �  � CURSIDE% � : CURY% �  �&�� @� �0�� =�l�� ===== handle "cursor left" Z�v�� @ CURPALOC%, CURCHAR$; ����� CURX% �  � CURX% � CURX% �  :� � CURSIDE% �  � CURSIDE% � : CURX% �  ����� @� ����� ݓН� ===== handle "cursor right" ��ڝ� @ CURPALOC%, CURCHAR$; K�䝋 CURX% �  � CURX% � CURX% �  :� � CURSIDE% �  � CURSIDE% � : CURX% �  U� @� [���� ��(�� ===== fill a two-dimensional array with lists of "print @" locations for LSIDE ˔2�RAWPOS% � LSIDEPOS%(I) �<�CURROW% � ��(RAWPOS% � ) �  �F�CURCOL% � (RAWPOS% � ��(RAWPOS% � ) � ) V�K�� CURCOL% �  � CURCOL% � : CURROW% � CURROW% �  p�P�� J �  � WORDLENGTH% ��Z�  PAPOSITIONS%(I, J) � (CURROW% � P) �  � CURCOL% ĕd�  CURCOL% � CURCOL% �  ��n�  � CURCOL% �  � CURCOL% � : CURROW% � CURROW% �  �x�� J ���� a��� ===== fill a two-dimensional array with lists of "print @" locations for RSIDE |��RAWPOS% � RSIDEPOS%(I) ��$�CURROW% � ��(RAWPOS% � ) �  ϖ.�CURCOL% � (RAWPOS% � ��(RAWPOS% � ) � ) �3�� CURCOL% �  � CURCOL% � : CURROW% � CURROW% �  !�8�� J �  � WORDLENGTH% j�B�  PAPOSITIONS%(I�LSIDEWORDCOUNT%, J) � (CURROW% � P) �  � CURCOL% ��L�  CURCOL% � CURCOL% �  ��V�  � CURCOL% �  � CURCOL% � : CURROW% � CURROW% �  ȗ`�� J Ηj�� ���� ===== highlight the word pointed to by CURRWORD% and put it lower-right B��PALOC � ((TOPROW � ) � P) � * f��� @ PALOC, �(WORDLENGTH%, " "); ���� J �  � WORDLENGTH% ՘ �  � @ PAPOSITIONS%(CURRWORD%, J), ��() � ��(WORDS$(CURRWORD%), J, ) � ��(); �*�  � @ PALOC, ��(WORDS$(CURRWORD%), J, ); �4�  PALOC � PALOC �  #�>�� J )�H�� c�૏ ===== UN-highlight the word pointed to by CURRWORD% }�ꫂ J �  � WORDLENGTH% ����  � @ PAPOSITIONS%(CURRWORD%, J), ��(WORDS$(CURRWORD%), J, ); ș��� J Ι�� �ȯ� ===== Highlight a single character and clear any selected word >�ү� @ CURPALOC%, ��();CURCHAR$;��(); T�ܯGUESS$ � CURCHAR$ ^�母 � p��CURRWORD% �  z���� �� ���� ����� ===== initialize HEXADDRESS% ����� ĳ Ӛ��� TODO Get a better list of these )���� Don't make any of these between 0 and 4096 or HEX$ will format the screen badly [�ĳ� -17232,-15568,-1338,20992,-2480,20464,-2816 ��γ� J �  � ��(): :�� RND(X) should be X = number of DATA, above ��س  � HEXADDRESS% ��ⳃ J ��쳎 ꛘ�� ===== print remaining-guesses line ���� @ �, "Attempts Remaining: "; ���� J �  �  ;���  PALOC � � � (J � ) ����  � J �� GUESSES% � � @ PALOC, " " ; ��() ; " " ; ��(); :� � @ PALOC, "  "; ����� J ��ʷ� ޜ��� ===== rotate / push the "stack" of right-hand output lines ����� J �  �  � � ���  OUTPUTLINES$(J) � OUTPUTLINES$(J�) &���� J E���OUTPUTLINES$() � NEWLINE$ K���� ��h�� ===== print the right-hand lines and the prompt ��r�� J �  �  ��w�  PALOC � (( � J) � P) � ) ם|�  � @ PALOC, OUTPUTLINES$(J); ݝ��� 7���� ===== sometimes we GOSUB into the middle, here, if we just want to print the prompt N���PALOC � �P � ) x���� @ PALOC, ">" ; �(WORDLENGTH%, " "); ֞��� @ PALOC, ">" ; GUESS$;: :�� want both PRINT lines to land the cursor in the right place ܞ��� ��PÏ ===== process a guess +�ZË CURRWORD% � PASSWORDIDX% � �: �"YOU WIN!": � J�d�GUESS$ � WORDS$(CURRWORD%) [�n�MATCHES% �  t�xÂ J �  � ��(GUESS$) ����  � ��(GUESS$, J, ) � ��(PASSWORD$, J, ) � MATCHES% � MATCHES% �  ş�Ã J ៖�NEWLINE$ � ">" � GUESS$ 럠Í �� ���NEWLINE$ � ">Entry denied." ��Í �� G���NEWLINE$ � ">Likeness=" � ��(��(MATCHES%), ) Q��Í �� p��Í h�: :�� print the lines ����GUESSES% � GUESSES% �  ���Í ��: :�� Decrement guesses blocks ��Í ��: :�� repoint the cursor to bottom right 0�ċ GUESSES% �  � �: �"OUT OF GUESSES!  PASSWORD WAS: " ; PASSWORD$: � 6�_� S�`� ===== IMPORT WORD LIST ��j�WORDLISTCOUNT% � : :�� the number of word lists ̡t� ��(WORDLISTCOUNT%) � H�,��,�,t�,��: :�� Set up the DATA �~� WORDLISTLENGTH%  ��� WORDS$(WORDLISTLENGTH%) #���ROTATOR% � ��(WORDLISTLENGTH%) A��� J �  � WORDLISTLENGTH% _���  WORDIDX% � J � ROTATOR% ����  � WORDIDX% � WORDLISTLENGTH% � WORDIDX% � WORDIDX% � WORDLISTLENGTH% â��  � WORDS$(WORDIDX%) ˢ�� J Ѣ�� ,�H� ===== WORD LISTS, each list begins with a number representing the length of the list 6�R� \� ��\� 15,TAKES,KNOWN,KICKS,STARK,BOOTS,BATON,CLEAR,CRIME,WASTE,CLOSE,SWORD,SLAVE,FARGO,MAYBE,MALES ��f� ���� �� ��� 15,SPIES,JOINS,TIRES,TRICK,TRIED,SKIES,TERMS,THIRD,FRIES,PRICE,TRITE,TANKS,THICK,TRIBE,TEXAS ��� �� � �� 15,PACED,EARLY,FIRST,LUCID,FRONT,HEAVY,PARTY,BADLY,BASIS,SNUFF,STUDY,QUICK,ROUND,FRIES,TRUNK ��$� ��t� ~� �~� 15,HEAVY,PRICE,GLARE,PEACE,UNION,ODDLY,NIGHT,DEMON,BLOAT,AWARE,HAPPY,EXTRA,MINOR,HEADS,MONTH ���� ��� �� e��� 15,PERKY,ENVOY,ADULT,NYLON,ROCKS,SAVED,CLOSE,TRAIN,SHARE,FRESH,BASIS,TRULY,SLEEP,ENTER,RIGHT k���   