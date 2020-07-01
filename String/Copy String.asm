;Copyright: Aditya Modi

data segment
    sourceString db 'Aditya Modi'
    stringLength EQU ($-sourceString)
    destString db stringLength dup(0h)
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
        LEA DI, destString
        
        MOV CL, stringLength
        CLD
        
        REPZ MOVSB
        HLT
        
    end start
code ends