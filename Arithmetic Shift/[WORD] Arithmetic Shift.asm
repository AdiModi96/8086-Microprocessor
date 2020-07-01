;Copyright: Aditya Modi

;OF indicates the change in Sign Bit
;OF is not cummulative changed, it is sequentially changed
;Only 8 can be used for counter, Architecture Limition
;If the Hexadecimal number starts with an Alphabet, it is mandatory to add '0' before it

data SEGMENT
    number DW 03BCDh
    counter DB 01d
data ENDS   

code SEGMENT
    
    start:
    assume CS:code, DS: data
        
        MOV AX, data
        MOV DS, AX  
        
        MOV AX, 0h ;Resetting
        MOV BX, 0h ;Resetting        
        MOV CX, 0h ;Resetting
        MOV DX, 0h ;Resetting
           
        MOV CL, [counter]
        
        MOV AX, [number]
        SAL AX, CL ; Arithmetic Shift Left
        
        MOV AX, [number]
        SAR AX, CL ; Arithmetic Shift Right
        
        HLT
    
    END start
    
code ENDS