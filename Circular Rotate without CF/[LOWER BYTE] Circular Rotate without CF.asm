;Copyright: Aditya Modi

;OF indicates the change in Sign Bit
;OF is not cummulative changed, it is sequentially changed
;Only 8 can be used for counter, Architecture Limition
;If the Hexadecimal number starts with an Alphabet, it is mandatory to add '0' before it

data segment
    number dw 0ABCDh
    counter db 03d
data ends   

code segment
    
    start:
    assume cs:code, ds: data
        
        MOV AX, data
        MOV DS, AX  
        
        MOV AX, 0h ;Resetting
        MOV BX, 0h ;Resetting        
        MOV CX, 0h ;Resetting
        MOV DX, 0h ;Resetting
            
        MOV CL, [counter]
       
        MOV AX, [number] 
        ROL AL, CL ;Circular Left Rotation
             
        MOV AX, [number] 
        ROR AL, CL ;Circular Right Rotation
        
        HLT
    
    end start
    
code ends