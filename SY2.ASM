ORG 0000H
RESET:  AJMP MAIN
        ORG 0100H
MAIN:   MOV SP,#60H
        MOV R0,#31H
		MOV @R0,#77H    ;���ʱ��������λ��Ϊ�Զ�������ĸ�λ����66H��
		DEC R0
		MOV @R0,#33H    ;���ʱ��������λ��Ϊ�Զ�������ĵ�λ����77H��
		MOV R1,#21H
		MOV @R1,#99H	  ;���ʱ��Ϊ�������ĸ�λ���޸ģ����Ϊ44H��
		DEC R1
		MOV @R1,#55H     ;���ʱ��Ϊ�������ĵ�λ���޸ģ����Ϊ55H��
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