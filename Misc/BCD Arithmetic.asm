;Copyright: Aditya Modi

data segment
    op1 db 29h
    op2 db 01h
data ends
code segment
    start:
        assume cs: code, ds: data
        MOV AX, data
        MOV DS, AX
        
        XOR AX, AX
        MOV AL, op1
        MOV BL, op2
        SUB AL, BL
        DAS
        MOV AL, op1
        MOV BL, op2
        ADD AL, BL
        DAA
    end start
code ends