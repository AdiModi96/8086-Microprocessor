;Copyright: Aditya Modi

data segment
    operand_1 db 50h
    operand_2 db 4Ch
data ends

code segment
	start:
	assume cs:code, ds:data, ss:stack 
	MOV AX, data
	MOV DS, AX
    
    XOR AX, AX
    XOR BX, BX
    
	CALL addNumbers
	    
	HLT
	
	addNumbers proc NEAR
	    MOV AL, [operand_1]
    	ADD AL, [operand_2]
    	RET
    endp addNumbers
    
end start
code ends