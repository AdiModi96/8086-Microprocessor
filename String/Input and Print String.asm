;Copyright: Aditya Modi

data segment
    buffer db 40 dup(?)
    forDollar db 1 dup(?)
data ends
code segment
    start:
        assume cs: code, ds: data
        
        MOV AX, data
        
        MOV AX, 0h ;Resetting
        MOV BX, 0h ;Resetting        
        MOV CX, 0h ;Resetting
        MOV DX, 0h ;Resetting

        MOV DX, OFFSET buffer
        MOV AH, 0Ah
        INT 21h
        
        MOV BL, buffer[1]
    	MOV buffer[BX + 2], '$'
    	MOV BL, OFFSET buffer[2]
    	MOV SI, 0h
    	
    	iter:
    	    MOV DX, [BX+SI]
    	    INC SI
    	    
    	    CMP DX, '$'
    	    JE exit
            
            MOV AH, 05h
            INT 21h
    	    LOOP iter
    	exit:
    	HLT

    end start
code ends