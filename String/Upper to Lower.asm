;Copyright: Aditya Modi

data segment
    sourceString db 'Aditya Modi is a cool Guy!'
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
            
            CMP AL, 41h
            JB exit
            
            CMP AL, 5Ah
            JA exit
            
            ADD AL, 20h
            
            exit:
            STOSB
           
            LOOP iter
        HLT
        
    end start
code ends