;Copyright: Aditya Modi

data segment
	a db 10h
	b db 20h
data ends
code segment
	start:
	assume cs:code, ds:data 
	MOV AX, data
	MOV DS, AX       
	
	XOR AX, AX ;Resetting
	XOR BX, BX ;Resetting
	
	MOV AL, a
	MOV BL, b
	SUB AL, BL
	
	HLT
end start
code ends