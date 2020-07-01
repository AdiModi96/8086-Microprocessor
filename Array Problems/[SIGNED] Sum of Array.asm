;Copyright: Aditya Modi

data segment
    array db 80h, 81h, 72h, 73h, 14h, 15h
	arraySize db 6h
data ends
code segment
    start: 
    assume cs:code, ds:data
        MOV AX, data
        MOV DS, AX  
        
        MOV AX, 0h ;Resetting
        MOV CX, 0h ;Resetting
        MOV DX, 0h ;Resetting                    
        
        MOV CL, [arraySize] ;Loading Size of the Array
        LEA BX, array ;Loading Address Position of the Array
        
        loop_label:
            MOV DX, byte([BX])
            MOV DH, 0
          
            ADD AX, DX
        
        	INC BX
        	JNE loop_label
        HLT
end start
code ends