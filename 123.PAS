{*****************************************************************************}
{**                         SWIFT FINDER                                    **}
{*****************************************************************************}

{-----------------------------------------------------------------------------}
{*FIND THE ANSWER FAST:
 *    THE FAMOUS RIDDLES:"IN THIS SENTENCE THE NUMBER OF OCCURENCES OF 0 IS ___
 *                       OF 1 __, OF 2 IS __ , OF 3 IS __ OF 4 IS __ OF 5 IS __
 *                        OF 6 __, OF 7 IS __ , OF 8 IS __ & OF 9 IS __.
 * THE AIM IS TO FIND A SET OF NUMBERS THEAT FILLS THIS SENTENCE SO THAT IT IS
 * TRUE!
 *-----------------------------------------------------------------------------}

{*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*}
{                                ALOGRITHM                                    }
{*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*}
{-----------------------------------------------------------------------------
A,B -> ARRAY
FLIP -> 0->B 1->A

FLIP=1
FILL A
100) IF FLIP=1 THEN SEARCH A -> PUT IN B
IF FLIP=2 THEN SEARCH B -> PUT IN A
IF CORRECT THEN STOP ELSE FLIP=3-FLIP TO 100
------------------------------------------------------------------------------}

PROGRAM FILL_;
TYPE
    A10=ARRAY[1..10] OF INTEGER;
    S5=STRING[5];
VAR
   A,B:A10;
   FLIP:INTEGER;
   NOM:STRING[12];
   F:TEXT;

PROCEDURE FIRST_SCR;

PROCEDURE WAIT;
VAR C:CHAR;
BEGIN
REPEAT READ(KBD,C) UNTIL C<>'';
END;

BEGIN
     HIGHVIDEO;
     WRITELN('              SWIFT FINDER - BY THE WIZARD OF SWIFT PROGRAMING (C)');
     WRITELN;
     LOWVIDEO;
     WINDOW(1,3,80,25);
     WRITELN('I HAVE A RIDDLE I LOVE TO ASK MY FRIENDS - ALL IT REQUIERS IS PATIENCE,AND THEY');
     WRITELN('CAN NOT SOLVE IT AND I - THE LAZY - CAN!');
     WRITELN;
     WRITELN('FILL THE BLANKS IN THIS SENTENCE SO THAT THE SENTENCE WILL BE TRUE:');
     WRITE('IN THIS SENTENCE THE NUMBER OF OCCUERENCES OF 0 IS ___ , OF 1 IS __ ,OF 2 IS __,');
     WRITELN('OF 3 IS __, OF 4 IS __, OF 5 IS __, OF 6 IS __, OF 7 IS __ , OF 8 IS __, & OF 9 IS __.');
     WAIT;CLRSCR;
     WRITELN('WHAT THIS PROGRAM DOES:');
     WRITELN('-----------------------');
     WRITELN('AFTER YOU FOUND THE TWO SOULTIONS THIS RIDDLE HAS , AND LOST THE PICE OF PAPER');
     WRITELN('YOU WROTE IT ON - YOU WANT TO FIND THE ANSWER FAST!');
     WRITELN('THIS PROGRAM FINDS - SOMETIMES!');
     WRITELN('YOU GIVE THE PROGRAM TEN NUMBERS - TO FILL THE BALNKS IN THE ANSWER AFTER THAT');
     WRITELN('THE PROGRAM COUNTS THE NUMBER OF TIME A CERTAIN NUMBER APPEARS,AND');
     WRITELN('PUTS THIS NUMBER IN THE CORRECT PLACE IN THE SENTENCE - IF THE SENTENCE IS TRUE');
     WRITE('THE PROGRAM STOPS , ELSE IT DOES THE SAME AGAIN - TILL IT FINDS A SOULTION - OR ');
     WRITELN('AT TIMES - FOREVER.');
     WAIT;WINDOW(1,1,80,25);
END;



PROCEDURE SHOW(D:A10);
VAR
   T:INTEGER;
BEGIN
     FOR T:=1 TO 10 DO BEGIN WRITE(D[T],','); WRITE(F,D[T],','); END;
     WRITELN(F);
     WRITELN;
END;

FUNCTION COUNT(A:S5;B:S5) :INTEGER;
VAR
   T:BYTE;
   Q:INTEGER;
BEGIN
     Q:=0;
     FOR T:=1 TO LENGTH(B) DO IF B[T]=A THEN Q:=Q+1;
     COUNT:=Q;
END;

PROCEDURE FILL(VAR R:A10);
VAR
   Y:1..10;
BEGIN
     FOR Y:=1 TO 10 DO BEGIN
                            IF Y=10 THEN WRITE('0 OCCURES ') ELSE WRITE(Y,' OCCURES ' );
                            READ(R[Y]);
                            IF R[Y]=1 THEN BEGIN GOTOXY(1,1+Y); CLREOL; WRITELN(Y,' OCCURES ONCE IN THE SENTENCE.'); END ELSE
                            IF R[Y]=2 THEN BEGIN GOTOXY(1,1+Y); CLREOL; WRITELN(Y,' OCCURES TWICE IN THE SENTENCE.'); END
                             ELSE
                            IF R[Y]=3 THEN BEGIN GOTOXY(1,1+Y); CLREOL; WRITELN(Y,' OCCURES THRICE IN THE SENTENCE.'); END
                             ELSE
                            WRITELN(' TIMES IN THE SENTENCE.');
                       END;
     FOR Y:=1 TO 10 DO WRITE(F,R[Y],',');
     WRITELN(F);
END;

PROCEDURE SandP(VAR X:A10; VAR Y:A10);
VAR
   A,B:1..10;
   C:INTEGER;
   WO,WOW:STRING[5];

BEGIN
     C:=0;
      FOR A:=1 TO 10 DO
          BEGIN
              FOR B:=1 TO 10 DO BEGIN
                                     STR(X[B],WOW);
                                     STR(A-1,WO);
                                     C:=C+COUNT(WO,WOW);
                                END;
              C:=C+1;
              Y[A]:=C;
              C:=0;
          END;
END;

FUNCTION CORRECT:BOOLEAN;

FUNCTION NUM(O:INTEGER;Q:A10):INTEGER;
VAR
    A:INTEGER;
    QO:INTEGER;
    WO,WOW:STRING[5];
BEGIN
     A:=0;
     FOR QO:=1 TO 10 DO BEGIN
                             STR(Q[QO],WOW);
                             STR(O,WO);
                             A:=A+COUNT(WO,WOW);
                        END;
     A:=A+1;
     NUM:=A;
END;


VAR
   W:INTEGER;
   Z,T:1..10;
   RES:BOOLEAN;
BEGIN
     W:=3-FLIP;
     RES:=TRUE;
     IF W=1 THEN
                FOR T:=1 TO 10 DO
                    IF NUM(T-1,B)<>B[T] THEN RES:=FALSE;
     IF W=2 THEN
                FOR T:=1 TO 10 DO
                    IF NUM(T-1,A)<>A[T] THEN RES:=FALSE;
     CORRECT:=RES;
END;


BEGIN
     CLRSCR;
     FIRST_SCR;
     CLRSCR;
     WRITE('FILE NAME:');
     READLN(NOM);
     IF NOM='' THEN ASSIGN(F,'NUL') ELSE ASSIGN(F,NOM);
     REWRITE(F);
     FLIP:=1;
     FILL(A);
     REPEAT
           IF FLIP=1 THEN
              BEGIN
                    SandP(A,B);
                    SHOW(B);
              END;
           IF FLIP=2 THEN
               BEGIN
                     SandP(B,A);
                     SHOW(A);
               END;
           FLIP:=3-FLIP;
     UNTIL CORRECT;
     IF 3-FLIP=1 THEN SHOW(B);
     IF 3-FLIP=2 THEN SHOW(A);
     CLOSE(F);
END.











