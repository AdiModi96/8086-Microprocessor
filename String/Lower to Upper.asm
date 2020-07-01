data segment
    sourceString db 'Aditya Modi and Janvi Thanki are Friends!'
    stringLength EQU ($-sourceString)
data ends
code segment
    start:
        assume cs: code, ds: data
        
        MOV AX, data
        MOV DS, AX
        MOV ES, AX  
        
        MOV AX, 0h ;Resetting
        MOV BX, 0h ;Resetting        
        MOV CX, 0h ;Resetting
        MOV DX, 0h ;Resetting
        
        LEA SI, sourceString
        
        MOV CL, stringLength
        CLD
        
        iter:
            LODSB
            
            CMP AL, 61h
            JB exit
            
            CMP AL, 7Ah
            JA exit
            
            SUB AL, 20h
            
            exit:
            STOSB
           
            LOOP iter
        HLT
        
    end start
code ends