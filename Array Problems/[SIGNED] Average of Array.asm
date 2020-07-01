;Copyright: Aditya Modi

data segment
    array db 10h, 11h, 12h, 13h, 14h, 14h
	arraySize EQU ($-array)
	inputMessage db 'Please Enter your Choice 0/1 for Sum/Average Respectively: $'
	errorMessage db '\nInvalid Choice!$'
	option 1 dup(?)
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
        
        MOV CX, arraySize ;Loading Size of the Array
        LEA BX, array ;Loading Address Position of the Array
        
        iter:
            MOV SI, CX
            ADC AX, [BX+SI-1]
        	LOOP iter

       	MOV BX, AX
       	XOR AX, AX

       	LEA DX, inputMessage
       	MOV AH, 09h
       	INT 21h

       	MOV AH, 01h
		INT 21h
		MOV DL, AL

		MOV AX, data
        MOV DS, AX  
        
        XOR AX, AX
        MOV AL, DL
		CMP AL, 31h      
		JNE may_be_sum
		MOV AX, BX
		XOR DX, DX
		MOV CX, arraySize
		IDIV CX
		JMP exit

		may_be_sum:
			CMP AL, 30h
			JNE error
			MOV AX, BX
			JMP exit

		error:
			LEA DX, errorMessage
			MOV AH, 09h
			INT 21h

		exit:
			HLT
end start
code ends