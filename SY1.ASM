ORG 0000H
RESET:   AJMP MAIN
        ORG 003FH
MAIN:   MOV R0,#40H
        MOV R2,#20H          ;���ʱ��10H��Ϊ20H
        MOV  A,#00H          ;���ʱ��0A0H��Ϊ00H
A1:     MOV @R0,A
        INC R0
        INC A
	DJNZ R2,A1  
        
	MOV R0,#40H
	MOV R1,#60H          ;���ʱ��50H��Ϊ60H
	MOV R2,#20H          ;���ʱ��10H��Ϊ20H
        
A2:     MOV A,@R0
        MOV @R1,A
	INC R0
	INC R1
	DJNZ R2,A2
A3:     SJMP A3