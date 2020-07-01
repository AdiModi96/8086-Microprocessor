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
        MOV BX, 0h ;Resetting
        MOV CX, 0h ;Resetting
        MOV DX, 0h ;Resetting                    
       
        LEA BX, array ;Loading Address Position of the Array
        
        ; Bubble Sort
        
        MOV CL, [arraySize]
        DEC CX
               
        outer_loop:
                   
            MOV SI, 0h
            MOV DX, 0h
            MOV DL, [arraySize]
            MOV SI, DX           
            DEC SI
                                              
            inner_loop:
                
                DEC SI 
                
                MOV AL, [BX+SI]
                
                CMP AL, [BX+SI+1h]
                JLE exchange
                JG do_not_exchange
                
                exchange:
                    XCHG AL, [BX+SI+1h]
                    XCHG [BX+SI], AL
                
                do_not_exchange:
                      
                CMP SI, 0
                JG inner_loop
                
            LOOP outer_loop
        HLT         
end start
code ends