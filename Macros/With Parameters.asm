;Copyright: Aditya Modi

data segment
    operand db 50h
data ends

PUSH_ELE macro ele
	PUSH ele
PUSH_ELE endm

POP_ELE macro ele
	POP ele
POP_ELE endm

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
		PUSH_ELE AX, 03h
		POP_ELE AX
		HLT

	end start
code ends