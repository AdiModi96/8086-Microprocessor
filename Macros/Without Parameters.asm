;Copyright: Aditya Modi

data segment
    operand db 50h
data ends

PUSH_ALL macro
	PUSH AX
	PUSH BX
	PUSH CX
	PUSH DX
	PUSH SP
	PUSH BP
	PUSH SI
	PUSH DI
PUSH_ALL endm

POP_ALL macro
	POP DI
	POP SI
	POP BP
	POP SP
	POP DX
	POP CX
	POP BX
	POP AX
POP_ALL endm

stack segment
	stackTop LABEL WORD
stack ends

code segment
	start:
		assume cs:code, ds:data, ss:stack
		MOV AX, data
		MOV DS, AX
		MOV AX, stack
		MOV SS, AX
		MOV AX, stackTop
		MOV SP, AX

		XOR AX, AX

		MOV AL, operand
		PUSH_ALL
		HLT

	end start
code ends