;Copyright: Aditya Modi

stack segment
    dw 40 dup(?)
    stackTop LABEL WORD
stack ends
code segment
	start:
	assume cs:code, ss:stack 
	MOV DS, AX
	MOV AX, stack
	MOV SS, AX
	LEA SP, stackTop
	
	XOR AX, AX
    
    LAHF
    PUSH AX
    POP AX
    SAHF
    	
	HLT
end start
code ends