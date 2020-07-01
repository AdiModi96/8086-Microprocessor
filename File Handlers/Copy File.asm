;Copyright: Aditya Modi

data segment
    fileData db 100 dup (?)     
    sourceFile db "test.txt", 0
    targetFile db "copy test.txt", 0  
    errorMessage db "Error with File operations$"
data ends

code segment
	start:
		assume cs:code, ds:data, ss:stack 
		MOV AX, data
		MOV DS, AX
	    
	    ;Creating a new File with normal attributes
	    MOV CX, 0h
	    LEA DX, targetFile
	    MOV AH, 3Ch
	    INT 21h
	    JC error	    
	    
	    ;Opening source file
	    LEA DX, sourceFile
	    MOV AL, 0h
	    MOV AH, 3Dh
	    INT 21h
	    JC error
	               
        ;Reading File Data
	    MOV BX, AX
	    MOV CX, 0Ah
	    LEA DX, fileData
	    iter:
	        MOV AH, 3Fh
	        INT 21h
	        
	        ADD DX, AX
	        CMP AX, 0h
	        JE outOfLoop
	        JMP iter
	    
	    outOfLoop:
	    ;Closing the source file    
	    MOV AH, 3Eh
	    INT 21h
	    MOV CX, DX
	    
	    ;Opening copy text.txt
	    LEA DX, targetFile
	    MOV AL, 1h
	    MOV AH, 3Dh
	    INT 21h
	    JC error
	    
	    MOV BX, AX
	    
	    LEA DX, fileData
	    MOV AH, 40h
	    INT 21h
	    HLT    
	    
	    error:
	    LEA DX, errorMessage
	    MOV AH, 09h
	    INT 21h
	    HLT
	    
    end start
code ends