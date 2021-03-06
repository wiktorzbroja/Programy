	E SET P3.4
	RS SET P3.5
	DBs SET P1
	
	LJMP INIT
	
	ORG 100H
INIT:
	CALL FCT_SET
	CALL DISP_ON
	CALL DISP_CLR
	CALL MOD_SET
	CALL TEXT
	LJMP MAIN
MAIN:
	INC R7
	LJMP MAIN
	
	ORG 150H
TEXT:
	MOV A, #' '
	CALL DATA_W
	MOV A, #' '
	CALL DATA_W
	MOV A, #' '
	CALL DATA_W
	MOV A, #'T'
	CALL DATA_W
	MOV A, #'M'
	CALL DATA_W
	MOV A, #' '
	CALL DATA_W
	MOV A, #'2'
	CALL DATA_W
	MOV A, #'0'
	CALL DATA_W
	MOV A, #'1'
	CALL DATA_W
	MOV A, #'7'
	CALL DATA_W
	MOV A, #'/'
	CALL DATA_W
	MOV A, #'1'
	CALL DATA_W
	MOV A, #'8'
	CALL DATA_W
	
	MOV A, #40H
	CALL DDRAM_SET
	MOV A, #'L'
	CALL DATA_W
	MOV A, #'A'
	CALL DATA_W
	MOV A, #'B'
	CALL DATA_W
	MOV A, #'O'
	CALL DATA_W
	MOV A, #'R'
	CALL DATA_W
	MOV A, #'A'
	CALL DATA_W
	MOV A, #'T'
	CALL DATA_W
	MOV A, #'O'
	CALL DATA_W
	MOV A, #'R'
	CALL DATA_W
	MOV A, #'I'
	CALL DATA_W
	MOV A, #'U'
	CALL DATA_W
	MOV A, #'M'
	CALL DATA_W
	MOV A, #' '
	CALL DATA_W
	MOV A, #' '
	CALL DATA_W
	MOV A, #'1'
	CALL DATA_W
	MOV A, #'1'
	CALL DATA_W
	RET
	
FCT_SEND:
	SETB E
	CLR RS
	MOV DBs, A
	CLR E
	CALL SLEEP
	RET
	
DISP_CLR:
	MOV A, #00000001B
	MOV R0, #03
	MOV R1, #230
	CALL FCT_SEND
	RET
MOD_SET:
	MOV A, #00000110B
	MOV R0, #00
	MOV R1, #24
	RET
DISP_ON:
	MOV A, #00001111B
	MOV R0, #00
	MOV R1, #24
	CALL FCT_SEND
	RET
DISP_OFF:
	MOV A, #00000000B
	MOV R0, #00
	MOV R1, #24
	CALL FCT_SEND
	RET
FCT_SET:
	MOV A, #00111000B
	MOV R0, #00
	MOV R1, #24
	CALL FCT_SEND
	RET
DDRAM_SET:
	ORL A, #10000000B
	MOV R0, #00
	MOV R1, #24
	CALL FCT_SEND
	RET
DATA_W:
	SETB E
	SETB RS
	MOV DBs, A
	CLR E
	MOV R0, #00
	MOV R1, #24
	CALL SLEEP
	RET
	
SLEEP:
	DJNZ R1, SLEEP
	CJNE R0, #0, WAIT
	RET
WAIT:
	DEC R0
	MOV ACC, #0FFH
	SJMP SLEEP
END