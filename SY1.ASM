ORG 0000H
RESET:   AJMP MAIN
        ORG 003FH
MAIN:   MOV R0,#40H
        MOV R2,#20H          ;提高时将10H改为20H
        MOV  A,#00H          ;提高时将0A0H改为00H
A1:     MOV @R0,A
        INC R0
        INC A
	DJNZ R2,A1  
        
	MOV R0,#40H
	MOV R1,#60H          ;提高时将50H改为60H
	MOV R2,#20H          ;提高时将10H改为20H
        
A2:     MOV A,@R0
        MOV @R1,A
	INC R0
	INC R1
	DJNZ R2,A2
A3:     SJMP A3
