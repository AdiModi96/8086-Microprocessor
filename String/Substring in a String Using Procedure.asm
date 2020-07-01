;Copyright: Aditya Modi

data segment
    stringInputMessage db 'Enter the String: $'
    substringInputMessage db '; Enter the Sub-String: $'
    string db 22 dup('$')                                
    substring db 22 dup('$')
    positiveMessage db '; The substring exists$'
    negativeMessage db '; The substring does not exists$'
data ends
code segment
    start:
        assume cs: code, ds: data
        
        MOV AX, data
        MOV DS, AX
        MOV ES, AX
                        
        MOV AX, 0h ;Resetting
        MOV BX, 0h ;Resetting        
        MOV CX, 0h ;Resetting
        MOV DX, 0h ;Resetting
                                   
        LEA DX, stringInputMessage
        MOV AH, 09h
        INT 21h

        LEA DX, string
        MOV AH, 0Ah
        INT 21h
        
        LEA DX, substringInputMessage
        MOV AH, 09h
        INT 21h

        LEA DX, substring
        MOV AH, 0Ah
        INT 21h
        
        CALL matchSubstring

        HLT

        matchSubstring PROC NEAR
            MOV CL, string[1]
            SUB CL, substring[1]
            INC CL
            
            iter:
                LEA SI, string
                ADD SI, 02h
                ADD SI, CX
                DEC SI
                
                LEA DI, substring
                ADD DI, 02h
                
                MOV DL, CL
                MOV CL, substring[1]
                
                innerIter:
                    MOV AL, [SI]
                    CMP AL, [DI]
                    JNE out
                    INC SI
                    INC DI
                    LOOP innerIter
                
                LEA DX, positiveMessage
                MOV AH, 09h
                INT 21h
                RET

                out:
                    MOV CL, DL
                
                LOOP iter

                LEA DX, negativeMessage
                MOV AH, 09h
                INT 21h
                RET

            RET
        matchSubstring ENDP

    end start
code ends