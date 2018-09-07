MOV R1, #25D
MOV R2, #125D
E SET P3.4
RS SET P3.5
LJMP INIT

ORG 100H
INIT:
	CALL FUNCTION_SET
	CALL DISPLAY_OFF
	CALL DISPLAY_CLR
	CALL ENTR_MOD_SET
	CALL DISPLAY_ON
	CALL TEXT
	LJMP MAIN

MAIN:
INC R7
LJMP MAIN

FUNCTION_SET:
	SETB E
	CLR RS
	MOV P1, #00111000B;DONE
	CLR E
	MOV R1, #50D
	CALL SLEEP50
RET

DISPLAY_OFF:
	SETB E
	CLR RS
	MOV P1, #00000000B;DONE
	CLR E
	MOV R1, #50D
	CALL SLEEP50
RET

DISPLAY_CLR:
	SETB E
	CLR RS
	MOV P1,#000000001 ;DONE
	CLR E
	MOV R2, #250D
	CALL SLEEP2000
RET

ENTR_MOD_SET:
	SETB E
	CLR RS
	MOV P1,#00000110B ;DONE
	CLR E
	MOV R1, #50D
	CALL SLEEP50
RET

DISPLAY_ON:
	SETB E
	CLR RS
	MOV P1,#00001111B;DONE
	CLR E
	MOV R1, #50D
	CALL SLEEP50
RET

DDRAM_SET:
	SETB E
	CLR RS
	MOV P1,#11000000B;DONE
	CLR E
	MOV R1, #50D
	CALL SLEEP50
RET

DISP:
	SETB E
	SETB RS
	MOV P1, A
	CLR E
	MOV R1, #50D
	CALL SLEEP50
RET

SLEEP50:	
	DJNZ R1, SLEEP50 
RET

SLEEP2000:
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
	DJNZ R2, SLEEP2000 
RET

TEXT:
MOV A, #' '
CALL DISP
MOV A, #' '
CALL DISP
MOV A, #' '
CALL DISP
MOV A, #'T'
CALL DISP
MOV A, #'M'
CALL DISP
MOV A, #' '
CALL DISP
MOV A, #'2'
CALL DISP
MOV A, #'0'
CALL DISP
MOV A, #'1'
CALL DISP
MOV A, #'7'
CALL DISP
MOV A, #'/'
CALL DISP
MOV A, #'1'
CALL DISP
MOV A, #'8'
CALL DISP
MOV A, #' '
CALL DISP
MOV A, #' '
CALL DISP
MOV A, #' '
CALL DISP

CALL DDRAM_SET
MOV A, #'L'
CALL DISP
MOV A, #'A'
CALL DISP
MOV A, #'B'
CALL DISP
MOV A, #'O'
CALL DISP
MOV A, #'R'
CALL DISP
MOV A, #'A'
CALL DISP
MOV A, #'T'
CALL DISP
MOV A, #'O'
CALL DISP
MOV A, #'R'
CALL DISP
MOV A, #'I'
CALL DISP
MOV A, #'U'
CALL DISP
MOV A, #'M'
CALL DISP
MOV A, #' '
CALL DISP
MOV A, #' '
CALL DISP
MOV A, #'1'
CALL DISP
MOV A, #'1'
CALL DISP
RET

END