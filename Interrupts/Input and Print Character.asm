;Copyright: Aditya Modi

data segment
    buffer db 1 dup(?)
data ends
code segment
    start:
        assume cs: code, ds: data
        
        MOV AX, data
        MOV DS, AX
        
        MOV AX, 0h ;Resetting
        MOV BX, 0h ;Resetting        
        MOV CX, 0h ;Resetting
        MOV DX, 0h ;Resetting

        MOV DX, OFFSET buffer
        MOV AH, 01h
        INT 21h 
        
        MOV DL, AL
        MOV AH, 05h
    	INT 21h
    	HLT

    end start
code ends