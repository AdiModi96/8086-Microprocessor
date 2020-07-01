;Copyright: Aditya Modi

data segment
    hours db 1 dup(?)
    colon1 db ':'
    minutes db 1 dup(?)
    colon2 db ':'
    seconds db 1 dup(?)
    message db 'The current Time is: $'
data ends
code segment
    start:
        assume cs: code, ds: data
        
        MOV AX, 0h ;Resetting
        MOV BX, 0h ;Resetting        
        MOV CX, 0h ;Resetting
        MOV DX, 0h ;Resetting

        MOV AH, 2Ch
        INT 21h 
        
        MOV AX, data
        MOV DS, AX
        
        MOV [hours], CH
        MOV [minutes], CL
        MOV [seconds], DH

        XOR AX, AX
        XOR BX, BX
        XOR CX, CX
        XOR DX, DX

        MOV AL, [hours]
        CALL converter
        SHL DL, 4
        OR DL, AL
        MOV [hours], DL

        MOV AL, [minutes]
        CALL converter
        SHL DL, 4
        OR DL, AL
        MOV [minutes], DL

        MOV AL, [seconds]
        CALL converter
        SHL DL, 4
        OR DL, AL
        MOV [seconds], DL
        
        CALL display
         
        HLT

        converter PROC NEAR
            XOR DX,  DX
            iter:
                CMP AL, 0Ah
                JB exit
                    INC DL
                    SUB AL, 0Ah
                    JMP iter
                exit:
                    RET
        converter ENDP 
        
        display PROC NEAR
            XOR DX, DX
            LEA DX, message
            MOV AH, 09h
            INT 21h
            
            XOR DX, DX
            MOV AH, 02h

            MOV DL, [hours]
            AND DL, 0F0h
            SHR DL, 04h
            OR DL, 30h
            INT 21h

            MOV DL, [hours]
            AND DL, 0Fh
            OR DL, 30h
            INT 21h

            MOV DL, [colon1]
            INT 21h

            MOV DL, [minutes]
            AND DL, 0F0h
            SHR DL, 04h
            OR DL, 30h
            INT 21h

            MOV DL, [minutes]
            AND DL, 0Fh
            OR DL, 30h
            INT 21h

            MOV DL, [colon2]
            INT 21h
            
            MOV DL, [seconds]
            AND DL, 0F0h
            SHR DL, 04h
            OR DL, 30h
            INT 21h

            MOV DL, [seconds]
            AND DL, 0Fh
            ADD DL, 30h
            INT 21h
        display ENDP
        
    end start
code ends