      SIZE EQU 10
      ARRAY EQU 50H
      CHANGE EQU 0
ASN:
    MOV 50H,#09H
    MOV 51H,#19H
    MOV 52H,#09H
    MOV 53H,#0F0H
    MOV 54H,#09H
    MOV 55H,#02H
    MOV 56H,#00H
    MOV 57H,#0FFH
    MOV 58H,#05H
    MOV 59H,#39H

SORT:
     MOV R0,#ARRAY
     MOV R7, #SIZE-1
     CLR CHANGE
GOON:
     MOV A,@R0
     MOV R2,A
    INC R0
    MOV B,@R0
    CJNE A,B,NOTEQUAL
    SJMP NEXT
NOTEQUAL:
         JC NEXT
         SETB CHANGE
         XCH A,@R0
         DEC R0
         XCH A,@R0
         INC R0
NEXT:
     DJNZ R7,GOON
     JB CHANGE,SORT
     LJMP $
END
