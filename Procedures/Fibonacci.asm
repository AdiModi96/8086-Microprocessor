;Copyright: Aditya Modi

data segment
	outOfBoundError db '; Range Out of Bound, Quitting!$'
    numberOfTerms db 1 dup(?)
    fibonacci db 12 dup(?)
data ends

code segment
	start:
		assume cs:code, ds:data, ss:stack 
		MOV AX, data
		MOV DS, AX
	    
	    XOR AX, AX
	    XOR BX, BX

	    MOV AH, 01h
	    INT 21h

	    MOV DH, AL
	    XOR AX, AX

	    MOV AH, 01h
	    INT 21h

	    MOV DL, AL

	    AND DX, 0F0Fh
	    XOR AX, AX
	    MOV AL, DH
	    MOV CL, 0Ah
	    MUL CL
	    ADD AL, DL

	    CMP AL, 0Ch
	    JBE in_range
	    LEA DX, outOfBoundError
	    MOV AH, 09h
	    INT 21h
	    JMP exit

	    in_range:
	    MOV numberOfTerms, AL

	    MOV fibonacci[0], 0h
	    MOV fibonacci[1], 1h

	    LEA SI, fibonacci[0]
	    MOV CL, [numberOfTerms]

	    CMP CX, 01h
	    JB exit
	    MOV DL, [SI]
	    MOV AH, 02h
	    INT 21h
	    INC SI
	    DEC CX

	    CMP CX, 01h
	    JB exit
	    MOV DL, [SI]
	    MOV AH, 02h
	    INT 21h
	    INC SI
	    DEC CX
        
        CMP CX, 00h
        JE exit
        
	    iter:
	    	XOR AL, AL
	    	ADD AL, [SI-1]
	    	ADD AL, [SI-2]
	    	MOV [SI], AL
	    	MOV DL, [SI]
		    MOV AH, 02h
		    INT 21h
		    INC SI
	    	LOOP iter

	    exit:
	    HLT
    end start
code ends