; PROGRAM G��WNY
MOV SP, #20H
MOV A, #10H
MOV DPH, #12H
MOV DPL, #34H
MOV 50H, #0AAH
MOV 51H, #0BBH
MOV R1, 50H
MOV R2, 51H
CALL PROCEDURA
MOV A, #50H
KONIEC: LJMP KONIEC
ORG 100H
PROCEDURA:

PUSH ACC
PUSH DPH
PUSH DPL
PUSH B
PUSH PSW

SETB RS0
MOV R1, 50H
MOV R2, 51H
MOV A, R1
CPL A
MOV R3, A
MOV A, R2
CPL A
MOV R4, A
SETB RS1
CLR RS0
MOV A, 50H
MOV B, 51H
MUL AB
MOV R1, A
MOV R2, B
CLR RS1

POP PSW
POP B
POP DPL
POP DPH
POP ACC

RET
END