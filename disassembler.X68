*-----------------------------------------------------------
* Title      :  Disassembler
* Written by :  Alvin, Max, Youngmin
* Date       :  4/28/17
* Description:  Main for disassembler
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here
    CLR.L       D0
    CLR.L       D1
    CLR.L       D2
    CLR.L       D3
    CLR.L       D4
    CLR.L       D6
    CLR.L       D7

    MOVEA.L     #$0,A0
    MOVEA.L     #$0,A1
    MOVEA.L     #$0,A2
    MOVEA.L     #$0,A3
    MOVEA.L     #$0,A4
    MOVEA.L     #$0,A5
    MOVEA.L     #$0,A6
    MOVEA.L     #$0,A7

    MOVEA.L     STACK_INIT, A7
    
**** TAKE USER INPUT *****
    LEA         MSG_INTRO,A1    ;DISPLAY PROMPT
    MOVE.B      #13,D0
    TRAP        #15
    
    LEA         MSG_START,A1    ;REQUEST STARTING ADDRESS
    MOVE.B      #13,D0
    TRAP        #15
    MOVE.B      #4,D0           
    TRAP        #15
    MOVE.B      D1,START_A

    LEA         MSG_END,A1      ;REQUEST ENDING ADDRESS
    MOVE.B      #13,D0
    TRAP        #15
    MOVE.B      #4,D0
    TRAP        #15
    MOVE.B      D1,END_A
    
    

            
    

    SIMHALT             ; halt simulator

* Put variables and constants here
STACK_INIT  DC.L   $00100000

MSG_INTRO   DC.B   'Welcome to disassembler',0
MSG_START   DC.B   'Please enter starting address',0
MSG_END     DC.B   'Please enter ending address',0

START_A     DS.B   1
END_A       DS.B   1
    
    
    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
