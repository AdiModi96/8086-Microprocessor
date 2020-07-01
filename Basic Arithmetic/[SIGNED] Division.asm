;Copyright: Aditya Modi

data segment
	a db -10h
	b db 20h
data ends
code segment
	start:
	assume cs:code, ds:data 
	MOV AX, data
	MOV DS, AX       
	
	MOV AX, 0h ;Resetting
	MOV BX, 0h ;Resetting
	
	MOV AL, a
	MOV BL, b
	IDIV BL
	
	HLT
end start
code ends