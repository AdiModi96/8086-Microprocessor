;Copyright: Aditya Modi
    
data segment
    number db 0EAh
data ends   

code segment
    
    start:
    assume cs:code, ds: data

    MOV AX, data
    MOV DS, AX
        
    MOV AX, 0h ;Resetting
    MOV BX, 0h ;Resetting        
    MOV CX, 0h ;Resetting
    MOV DX, 0h ;Resetting

    MOV CL, 08h
    MOV AL, [number]
    CLC
    iter:
        SHR AL, 1h
        ADC BX, 0h
        LOOP iter        
    
    MOV AL, [number]
    ADD AL, 0h
    
    HLT
    
    end start
    
code ends