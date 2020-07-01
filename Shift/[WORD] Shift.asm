;Copyright: Aditya Modi

;OF indicates the change in Sign Bit
;OF is not cummulative changed, it is sequentially changed
;Only 8 can be used for counter, Architecture Limition
;If the Hexadecimal number starts with an Alphabet, it is mandatory to add '0' before it

data segment
    number dw 7BCDh
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
        SHL AX, CL ; Shift Left
        
        MOV AX, [number]
        SHR AX, CL ; Shift Right
        
        HLT
    
    end start
    
code ends