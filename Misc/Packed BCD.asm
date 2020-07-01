;Copyright: Aditya Modi
    
data segment
    input db 1 dup(?)
data ends   

code segment
    
    start:
    assume cs:code, ds: data
        
        MOV AX, 0h ;Resetting
        MOV BX, 0h ;Resetting        
        MOV CX, 0h ;Resetting
        MOV DX, 0h ;Resetting
        
        MOV AH, 01h
        INT 21h

        MOV BL, AL
        SHL BL, 4h

        MOV AH, 01h
        INT 21h

        AND AL, 0Fh
        OR AL, BL
        XOR AH, AH

        MOV input, AL
        HLT
    
    end start
    
code ends