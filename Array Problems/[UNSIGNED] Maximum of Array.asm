;Copyright: Aditya Modi

data segment
    array db 10h, 11h, 12h, 13h, 14h, 15h
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
        MOV AL, byte([BX])
        
        loop_label:
            MOV DL, byte([BX])        
            CMP AL, DL
            JL LESSER
            JGE GREATER_EQUAL
            
            LESSER:
                MOV AL, DL
            
            GREATER_EQUAL:
            	INC BX
            	LOOP loop_label
        HLT
end start
code ends