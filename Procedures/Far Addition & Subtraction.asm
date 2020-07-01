;Copyright: Aditya Modi

data segment
    operand_1 db 50h
    operand_2 db 50h
    addNumbersLoc dd ?
    subNumbersLoc dd ?
data ends

code segment
	start:
	assume cs:code, ds:data, ss:stack 
	MOV AX, data
	MOV DS, AX
    
	MOV addNumbersLoc, addNumbers
	MOV addNumbersLoc+2, procedures
	MOV subNumbersLoc, subNumbers
	MOV subNumbersLoc+2, procedures

    XOR AX, AX
    XOR BX, BX
    
	MOV AL, [operand_1]
	MOV BL, [operand_2]
	
	CALL FAR addNumbersLoc
	CALL FAR subNumbersLoc
	HLT
code ends

procedures segment
    addNumbers proc FAR
        assume cs:procedures
    	ADD AL, BL
    	RETF
    addNumbers endp
    subNumbers proc FAR
        assume cs:procedures
        SUB AL, BL
        RETF
    subNumbers endp       
end start