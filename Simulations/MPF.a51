ORG 0000H
JMP MAIN


ORG 0050H
MAIN:
        MOV P3, #00FH ; Clear rows of keyboard
        CLR IT0 ; Active low interrupt
        MOV R0, #000H ; R0 is a status register and 00 is equal to start and waiting for pc
        MOV R1, #000H ; R1 is a value register whivh we store the value of recent pushed key of key boards in it
        SETB EA ; Enable interrupt individually
        SETB EX0 ; Enable external interrupt0
        STATUS0: CJNE R6, #001H, STATUS0 ; Status 1 will happen only if user push PC button
        
JMP MAIN

; Subroutine for detecting the key
DETECTION:
        COLUMN_ONE: JB P2.0, COLUMN_TWO ; If P2.0 is high the key is not from the first column of left key board
                ; The key is from the first column
                ZERO:
                        CPL P3.4 ; Set the first row of key board
                        JNB P2.0, EIGHT ; If P2.0 is low after setting P3.4 the key is not 0
                        MOV R1, #000H ; the key is 0
                        CPL P3.4 ; Clear the first row of key boards
                        RET
                EIGHT:
                        CPL P3.4 ; Clear the first row of key board
                        CPL P3.5 ; Set the first row of key board
                        JNB P2.0, PC ; If P2.0 is low after setting P3.5 the key is not 8
                        MOV R1, #008H ; the key is 8
                        CPL P3.5 ; Clear the second row of key boards
                        RET
                PC:
                        CPL P3.5 ; Clear the second row of key board
                        CPL P3.6 ; Set the third row of key board
                        JNB P2.0, F1 ; If P2.0 is low after setting P3.6 the key is not PC
                        MOV R1, #010H ; the key is PC
                        CPL P3.6 ; Clear the third row of key boards
                        RET
                F1:
                        MOV R1, #020H ; The key is F1
                        RET
        COLUMN_TWO: JB P2.1, COLUMN_THREE ; If P2.1 is high the key is not from the second column of left key board
                ; The key is from the second column
                ONE:
                        CPL P3.4 ; Set the first row of key board
                        JNB P2.1, NINE ; If P2.1 is low after setting P3.4 the key is not 1
                        MOV R1, #001H ; the key is 1
                        CPL P3.4 ; Clear the first row of key boards
                        RET
                NINE:
                        CPL P3.4 ; Clear the first row of key board
                        CPL P3.5 ; Set the first row of key board
                        JNB P2.1, ADR ; If P2.1 is low after setting P3.5 the key is not 9
                        MOV R1, #009H ; the key is 9
                        CPL P3.5 ; Clear the second row of key boards
                        RET
                ADR:
                        CPL P3.5 ; Clear the second row of key board
                        CPL P3.6 ; Set the third row of key board
                        JNB P2.1, F2 ; If P2.1 is low after setting P3.6 the key is not ADR
                        MOV R1, #030H ; the key is ADR
                        CPL P3.6 ; Clear the third row of key boards
                        RET
                F2:
                        MOV R1, #040H ; The key is F1
                        RET
        COLUMN_THREE: JB P2.2, COLUMN_FOUR ; If P2.2 is high the key is not from the third column of left key board
                ; The key is from the third column
                TWO:
                        CPL P3.4 ; Set the first row of key board
                        JNB P2.2, A ; If P2.2 is low after setting P3.4 the key is not 2
                        MOV R1, #002H ; the key is 2
                        CPL P3.4 ; Clear the first row of key boards
                        RET
                A:
                        CPL P3.4 ; Clear the first row of key board
                        CPL P3.5 ; Set the first row of key board
                        JNB P2.2, PLUS ; If P2.2 is low after setting P3.5 the key is not A
                        MOV R1, #00AH ; the key is A
                        CPL P3.5 ; Clear the second row of key boards
                        RET
                PLUS:
                        CPL P3.5 ; Clear the second row of key board
                        CPL P3.6 ; Set the third row of key board
                        JNB P2.2, F3 ; If P2.2 is low after setting P3.6 the key is not PLUS
                        MOV R1, #050H ; the key is PLUS
                        CPL P3.6 ; Clear the third row of key boards
                        RET
                F3:
                        MOV R1, #060H ; The key is F3
                        RET
        COLUMN_FOUR: JB P2.3, COLUMN_FIVE ; If P2.3 is high the key is not from the fourth column of left key board
                ; The key is from the fourth column
                THREE:
                        CPL P3.4 ; Set the first row of key board
                        JNB P2.3, B ; If P2.3 is low after setting P3.4 the key is not 3
                        MOV R1, #003H ; the key is 3
                        CPL P3.4 ; Clear the first row of key boards
                        RET
                B:
                        CPL P3.4 ; Clear the first row of key board
                        CPL P3.5 ; Set the first row of key board
                        JNB P2.3, MINUS ; If P2.3 is low after setting P3.5 the key is not B
                        MOV R1, #00BH ; the key is B
                        CPL P3.5 ; Clear the second row of key boards
                        RET
                MINUS:
                        CPL P3.5 ; Clear the second row of key board
                        CPL P3.6 ; Set the third row of key board
                        JNB P2.3, F4 ; If P2.3 is low after setting P3.6 the key is not MINUS
                        MOV R1, #070H ; the key is MINUS
                        CPL P3.6 ; Clear the third row of key boards
                        RET
                F4:
                        MOV R1, #080H ; The key is F4
                        RET
        COLUMN_FIVE: JB P2.4, COLUMN_SIX ; If P2.4 is high the key is not from the first column of right key board
                ; The key is from the fifth column
                FOUR:
                        CPL P3.4 ; Set the first row of key board
                        JNB P2.4, C ; If P2.4 is low after setting P3.4 the key is not 4
                        MOV R1, #004H ; the key is 4
                        CPL P3.4 ; Clear the first row of key boards
                        RET
                C:
                        CPL P3.4 ; Clear the first row of key board
                        CPL P3.5 ; Set the first row of key board
                        JNB P2.4, DATA ; If P2.4 is low after setting P3.5 the key is not C
                        MOV R1, #00CH ; the key is C
                        CPL P3.5 ; Clear the second row of key boards
                        RET
                DATA:
                        CPL P3.5 ; Clear the second row of key board
                        CPL P3.6 ; Set the third row of key board
                        JNB P2.4, F5 ; If P2.4 is low after setting P3.6 the key is not DATA
                        MOV R1, #090H ; the key is DATA
                        CPL P3.6 ; Clear the third row of key boards
                        RET
                F5:
                        MOV R1, #0A0H ; The key is F5
                        RET
        COLUMN_SIX: JB P2.5, COLUMN_SEVEN ; If P2.5 is high the key is not from the second column of right key board
                ; The key is from the sixth column
                FIVE:
                        CPL P3.4 ; Set the first row of key board
                        JNB P2.5, D ; If P2.5 is low after setting P3.4 the key is not 5
                        MOV R1, #005H ; the key is 5
                        CPL P3.4 ; Clear the first row of key boards
                        RET
                D:
                        CPL P3.4 ; Clear the first row of key board
                        CPL P3.5 ; Set the first row of key board
                        JNB P2.5, MODE ; If P2.5 is low after setting P3.5 the key is not D
                        MOV R1, #00DH ; the key is D
                        CPL P3.5 ; Clear the second row of key boards
                        RET
                MODE:
                        CPL P3.5 ; Clear the second row of key board
                        CPL P3.6 ; Set the third row of key board
                        JNB P2.5, F6 ; If P2.5 is low after setting P3.6 the key is not MOD
                        MOV R1, #0B0H ; the key is MOD
                        CPL P3.6 ; Clear the third row of key boards
                        RET
                F6:
                        MOV R1, #0C0H ; The key is F6
                        RET
        COLUMN_SEVEN: JB P2.6, COLUMN_EIGHT ; If P2.6 is high the key is not from the third column of right key board
                ; The key is from the seventh column
                SIX:
                        CPL P3.4 ; Set the first row of key board
                        JNB P2.6, E ; If P2.6 is low after setting P3.4 the key is not 6
                        MOV R1, #006H ; the key is 6
                        CPL P3.4 ; Clear the first row of key boards
                        RET
                E:
                        CPL P3.4 ; Clear the first row of key board
                        CPL P3.5 ; Set the first row of key board
                        JNB P2.6, EXE ; If P2.6 is low after setting P3.5 the key is not E
                        MOV R1, #00EH ; the key is E
                        CPL P3.5 ; Clear the second row of key boards
                        RET
                EXE:
                        CPL P3.5 ; Clear the second row of key board
                        CPL P3.6 ; Set the third row of key board
                        JNB P2.6, F7 ; If P2.6 is low after setting P3.6 the key is not EXE
                        MOV R1, #0D0H ; the key is EXE
                        CPL P3.6 ; Clear the third row of key boards
                        RET
                F7:
                        MOV R1, #0E0H ; The key is F1
                        RET
        COLUMN_EIGHT:
                ; The key is from the eighths column
                SEVEN:
                        CPL P3.4 ; Set the first row of key board
                        JNB P2.7, F ; If P2.7 is low after setting P3.4 the key is not 7
                        MOV R1, #007H ; the key is 7
                        CPL P3.4 ; Clear the first row of key boards
                        RET
                F:
                        CPL P3.4 ; Clear the first row of key board
                        CPL P3.5 ; Set the first row of key board
                        JNB P2.7, END ; If P2.7 is low after setting P3.5 the key is not F
                        MOV R1, #00FH ; the key is F
                        CPL P3.5 ; Clear the second row of key boards
                        RET
                END:
                        CPL P3.5 ; Clear the second row of key board
                        CPL P3.6 ; Set the third row of key board
                        JNB P2.7, F8 ; If P2.7 is low after setting P3.6 the key is not END
                        MOV R1, #0F0H ; the key is END
                        CPL P3.6 ; Clear the third row of key boards
                        RET
                F8:
                        MOV R1, #0F1H ; The key is F8
                        RET


; ISR
ORG 0003H
CLR P3.1 ; Disable interrupt
CLR EA ; No interrupt will be acknowledged
CLR EX0 ; Disable external interrupt0
CALL DETECTION
CLR IE0

RETI