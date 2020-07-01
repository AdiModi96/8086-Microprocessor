;Copyright: Aditya Modi

data segment
    inputString db 'Aditya Modi'
    stringLength EQU ($-inputString)
    outputString db stringLength dup(?)
data ends

stack segment
    stackTop LABEL BYTE
stack ends

code segment
	start:
	assume cs:code, ds:data, ss:stack 
	MOV AX, data
	MOV DS, AX
	MOV ES, AX
	MOV AX, stack
	MOV SS, AX
	LEA SP, stackTop
    
    XOR AX, AX
    XOR BX, BX

	CALL reverseString
	    
	HLT
	
	reverseString proc NEAR
	    MOV CX, stringLength
	    MOV SI, stringLength
	    DEC SI
	    LEA DI, outputString
	    iter:
	    	MOV AL, [SI]
	    	DEC SI
	    	MOV [DI], AL
	    	INC DI
	    	LOOP iter
    	RET
    endp reverseString
    
end start
code ends