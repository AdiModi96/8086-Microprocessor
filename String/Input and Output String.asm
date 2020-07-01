;Copyright: Aditya Modi

data segment
    buffer db 20 dup(?)
data ends
code segment
    start:
        assume cs: code, ds: data
        
        MOV AX, 0h ;Resetting
        MOV BX, 0h ;Resetting        
        MOV CX, 0h ;Resetting
        MOV DX, 0h ;Resetting

        MOV DX, OFFSET buffer
        MOV AH, 0Ah
        INT 21h 
        
        MOV BL, buffer[1]
    	MOV buffer[BX + 2], '$'
    	MOV DX, OFFSET buffer + 2
    	MOV AH, 09h
    	INT 21h
    	HLT

    end start
code ends