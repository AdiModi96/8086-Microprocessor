;Copyright: Aditya Modi

data segment
    number db 51h
    evenOddLoc dd ?
    messageEven db 'The number is even$'
    messageOdd db 'The number is odd$'
data ends

code segment
	start:
	assume cs:code, ds:data, ss:stack 
	MOV AX, data
	MOV DS, AX
    
	MOV evenOddLoc, evenOdd
	MOV evenOddLoc+2, procedures

    XOR AX, AX
    XOR BX, BX
    
	MOV AL, [number]
	
	CALL FAR evenOddLoc
	HLT
code ends

procedures segment
    evenOdd proc FAR
        assume cs:procedures
    	SHR AL, 1
        JC printOdd
        LEA DX, messageEven
        MOV AH, 09h
        INT 21h
    	RETF

    	printOdd:
    	LEA DX, messageOdd
        MOV AH, 09h
        INT 21h
    	RETF
    evenOdd endp   
end start