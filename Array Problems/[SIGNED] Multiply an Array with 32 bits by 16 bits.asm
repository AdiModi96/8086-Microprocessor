;Copyright: Aditya Modi

;Max Size of multiplier and multiplicand is a word
data segment
    array dd F110h, 1051h, 12h, 13h, 14h, 15h ;Please do not exceed the word limit
    multiplier dw 2h
	arraySize dw 6h
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
        
        MOV CX, [arraySize] ;Loading Size of the Array
        LEA BX, array ;Loading Address Position of the Array
        
        loop_label:
        
            MOV AX, 0h ;Resetting
            MOV DX, 0h ;Resetting
            MOV AX, [BX]
            IMUL [multiplier]
            MOV [BX], AX
            MOV [BX+2], DX
            ADD BX, 04h
                       
            LOOP loop_label
                                   
        HLT
end start
code ends