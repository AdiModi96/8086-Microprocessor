;Copyright: Aditya Modi

data segment
    array db 15h, 14h, 13h, 12h, 11h, 10h
    arraySize EQU ($-array)
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
        
        MOV CX, arraySize
        DEC CX
               
        outer_loop:
                   
            MOV SI, arraySize           
            DEC SI
                                              
            inner_loop:
                
                DEC SI 
                
                MOV AL, [BX+SI]
                
                CMP AL, [BX+SI+1h]
                JG exchange
                JLE do_not_exchange
                
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