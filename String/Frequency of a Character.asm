;Copyright: Aditya Modi

data segment
    sourceString db 'Aditya Modi is a cooooool guy'
    stringLength EQU ($-sourceString)
    char db 'o'
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
            MOV AL, [SI]
            CMP AL, [char]
            
            JNE do_not_increment_counter
            INC DX
            
            do_not_increment_counter:
            
            INC SI
            LOOP iter
        HLT
        
    end start
code ends