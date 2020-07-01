;Copyright: Aditya Modi

;Max Size of Dividend is double-word and divisor is a word
data segment
    dividend db 02h
    divisor dw 02h
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
        
        MOV AL, [dividend]
        CBW
        IDIV [divisor]
                                   
        HLT
end start
code ends