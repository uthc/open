OUTBIT EQU 08002H
OUTSEG EQU 08004H
IN     EQU 08001H
LEDBUF EQU 60H
NUM    EQU 70H
DELAYT EQU 75H
LJMP   START
LEDMAP:
      DB 3FH,06H,5BH,4FH,66H,6DH,7DH,07H
      DB 7FH,6FH,77H,7CH,39H,5EH,79H,71H
DELAY:
      MOV  R7,#0
DELAYLOOP:
      DJNZ R7, DELAYLOOP
      DJNZ R6, DELAYLOOP
      RET

DISPLAYLED:
      MOV  R0, #LEDBUF
      MOV  R1, #6
      MOV  R2, #00100000B
LOOP:
      MOV  DPTR,#OUTBIT
      MOV  A,#0
      MOVX @DPTR,A
      MOV  A,@R0
      MOV  DPTR,#OUTSEG
      MOVX @DPTR,A
      MOV  DPTR,#OUTBIT
      MOV  A,R2
      MOVX @DPTR,A
      MOV  R6,#05
      CALL DELAY
      MOV  A,R2
      RR   A
      MOV  R2,A
      INC  R0
      DJNZ R1,LOOP
      MOV  DPTR,#OUTBIT
      MOV  A,#0
      MOVX @DPTR,A
      RET
START:
      MOV  SP,#40H
      MOV  NUM, #0  
MLOOP:
      ;INC  NUM
      MOV  A,NUM
      MOV  B,A
      MOV  R0,#LEDBUF
FILLBUF:
      MOV  A,B
      ANL  A,#0FH
      MOV  DPTR,#LEDMAP
      MOVC A,@A+DPTR
      MOV  @R0,A
      INC  R0
      INC  B
      CJNE R0,#LEDBUF+6,FILLBUF
      MOV  DELAYT,#30
DISPAGAIN:
      CALL DISPLAYLED
      DJNZ DELAYT,DISPAGAIN
      LJMP MLOOP
      END
