ORG 0000H
RESET:  AJMP MAIN
        ORG 0100H
MAIN:   MOV SP,#60H
        MOV R0,#31H
		MOV @R0,#77H    ;提高时将加数高位改为自定义的数的高位（如66H）
		DEC R0
		MOV @R0,#33H    ;提高时将加数低位改为自定义的数的低位（如77H）
		MOV R1,#21H
		MOV @R1,#99H	  ;提高时作为被加数的高位被修改（如改为44H）
		DEC R1
		MOV @R1,#55H     ;提高时作为被加数的低位被修改（如改为55H）
		MOV R2,#02H
		ACALL DACE
HERE:   SJMP HERE
DACE:   CLR C
DAL:    MOV A,@R0
        ADDC A,@R1
		DA A
		MOV @R1,A
		INC R0
		INC R1
		DJNZ R2,DAL
		CLR A
		MOV ACC.0,C
		MOV @R1,A
		RET
