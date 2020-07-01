;Copyright: Aditya Modi

data segment
    multiplicand db -8d
    multiplier dw 1131h
data ends

code segment
    
    start: 
    assume cs:code, ds:data
        MOV AX, data
        MOV DS, AX  
        
        MOV AX, 0h ;Resetting
        MOV BX, 0h ;Resetting        
        MOV CX, 0h ;Resetting
        MOV DX, 0h ;Resetting
            
        MOV AL, [multiplicand]
        CBW
        IMUL [multiplier]
        
        HLT
    end start
code ends