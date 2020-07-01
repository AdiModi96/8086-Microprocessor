;Copyright: Aditya Modi

stack segment
    db 40 dup(?)
    stackTop LABEL BYTE
stack ends
code segment
	start:
	assume cs:code, ss:stack 
	MOV DS, AX
	MOV AX, stack
	MOV SS, AX
	LEA SP, stackTop
	
	PUSHF
    POPF
	
	HLT
end start
code ends