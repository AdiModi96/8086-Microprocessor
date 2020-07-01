;Copyright: Aditya Modi
    
code segment
    
    start:
    assume cs:code, ds: data
        
    MOV AL, 7Fh
    ADD AL, 01h
    XOR AX, AX
    LAHF
    
    HLT
    end start
    
code ends