.equ SREG , 0x3f                 ; SETTING status register
.equ PORTB, 0x05                 ;  CALLING ADDRESSES of PORTB and PORTD  and their Register defining pins
.equ PORTD, 0x0B
.equ DDRB, 0x04
.equ DDRD, 0x0A

main:      ldi r16, 0                         ; set r16 initially 0 in order to CLEAR SREG
           out SREG, r16
           
           
           ldi r16, 0x0F                      ; set r16 to 0000 1111 so that DDRB is set to that SO 4 rightmost LEDs shown in LAB5 setup are output for PORTB 
           out DDRB, r16
           
           ldi r16, 0xF0                      ; set r16 to 1111 0000 so that DDRD is set to that SO 4 leftmost LEDs shown in LAB5 setup are output for PORTB
           out DDRD, r16
           
           
           
           ldi r19, 61              ;loads value of r19 as a parameter for upcoming delay of 1 second will make more sense when delay called
           
           
          
           ldi r16, 0x02            ; First digit of K-NUMBER = 2
           
           out PORTB, r16           ; THIS code repeated a lot essentially 0x02 where 0 for PORTD and 2 for PORTB just outputting the hexadecimal value (8 bit to 8 LEDs) to the LEDs so leftmost LEDs are all 0 and RIGHTMOST have one LED on as 00 10 (as 2 for PORTB)
           out PORTD, r16
           
           
           call delay                  ; SENDS you to a subroutine delay where the delay is 1 second as r19 = 61 (earlier was paramaterised)  r17 and r18 are 255  (so for 16MHz clock  256 x 256 x 61 x 4 / 16,000,000  = roughly one second)
           ldi r19, 61                ;resets value for upcoming delay of 1 second
           
           
           
           ldi r16, 0x03            ; Second digit of K-NUMBER = 2  e.t.c
           
           out PORTB, r16
           out PORTD, r16

  
           call delay
           ldi r19, 61
           
                         

           ldi r16, 0x01
           out PORTB, r16
           out PORTD, r16
                     
           
           call delay
           ldi r19, 61
           

           
           ldi r16, 0x07
           out PORTB, r16
           out PORTD, r16
                    
                    
           call delay
           ldi r19, 61
           

                         
           ldi r16, 0x00
           out PORTB, r16
           out PORTD, r16
              

           call delay
           ldi r19, 61
          
                         
           ldi r16, 0x09
           out PORTB, r16
           out PORTD, r16
                     
           
           call delay
           ldi r19, 61
                         
           ldi r16, 0x07
           out PORTB, r16
           out PORTD, r16
                     
           
           call delay
           ldi r19, 61     
                         
                         
                         
           ldi r16, 0x04
           out PORTB, r16
           out PORTD, r16
                     
           call delay
           ldi r19, 183                      ; 183 for r19 so NOW 2 second delay  
           
           ldi r16, 0x00
           out PORTB, r16
           out PORTD, r16
           
           call delay                        ;delay for 2 second break between different tasks(ALL breaks will display 0 on LEDs)
           
           
           
           
           ; CODE FOR INITIALS O.K 
           
           
           ldi r16, 0x0F                    ; DIPLAYS the letter O in hex
           out PORTB, r16
           out PORTD, r16
                     
           ldi r19, 61                      
           call delay
           
      
           ldi r16, 0x1B                    ; DISPLAYS representation of dot in hex (so O.)
           out PORTB, r16
           out PORTD, r16
                     
           
           ldi r19, 61;
           call delay
           
           
           ldi r16, 0x0B                    ; DISPLAYS K in  hex so O.K
           out PORTB, r16
           out PORTD, r16
                     
                     
           ldi r19, 61 
           call delay
                                   
           
           ldi r16, 0x00
           out PORTB, r16
           out PORTD, r16
           
           
           ldi r19, 183
           call delay                        ;delay for 2 second break between different tasks
                 
           
           
           
           
           
           
      
           
           
             ldi r20, 10                      ;LOAD 10 in r20 as multiples of 5 in 50 is 10 ( you will see in later code this is used to check ALL morse code loops for 50 times will make more sense)
            


set_value:   ldi r21, 4                       ;LOAD 4 into r21 so that it iterates between odd and even 4 times and then on the fifth it jumps to multiple of 5                
             rjmp loop_morse
             



loop_morse:           ;MORSE CODE   will display OMA
           
          
           
           ldi r16, 0x01                     ; -----DISPLAYS DASH in MORSE CODE
           out PORTB, r16
           out PORTD, r16
           
           
           
           ldi r19, 36                      ;loads different value here for r19 as dash delay upcoming now for MORSE CODE(so 600ms delay)
           call delay
           
           ldi r16, 0x00                     
           out PORTB, r16                    ; TURNS LED OFF IN GAP between DASH/DOT
           out PORTD, r16 
           
           ldi r19, 12                       ;loads different value here as interspace delay now (so 200 ms delay)
           call delay                        ; INTER-SPACE DELAY
           ldi r19, 36                       ; loads different value for the upcoming dash delay
           
           
           ldi r16, 0x01                     ; ----DISPLAYS ANOTHER DASH
           out PORTB, r16
           out PORTD, r16
           
           call delay                   
           ldi r19, 12                       ;loads different value here as interspace delay now 
          
           ldi r16, 0x00                     
           out PORTB, r16
           out PORTD, r16 
           
            
           
           call delay                        ; INTER-SPACE DELAY
           ldi r19, 36                       ; for the upcoming dash delay
           
           
           ldi r16, 0x01                     ; DASH FOR THE THIRD TIME SO DISPLAYS O IN MORSE CODE
           out PORTB, r16
           out PORTD, r16
           
           call delay
           ldi r19, 36                       ; for the upcoming inter-LETTER delay
           
           
           ldi r16, 0x00                     
           out PORTB, r16
           out PORTD, r16 
           
           
           
           call delay                   ;INTER-LETTER DELAY
           ldi r19, 36                  ; for the upcoming DASH delay in NEW LETTER1
           
           
           ; NEW LETTER1
           
           
           
           
           
           ldi r16, 0x01                     ; DISPLAYS DASH in MORSE CODE
           out PORTB, r16
           out PORTD, r16
           
           call delay
           ldi r19, 12                       ;loads different value here as interspace delay now 
           
           
           ldi r16, 0x00                     
           out PORTB, r16
           out PORTD, r16 
           
           call delay                   ; INTER-SPACE DELAY
           ldi r19, 36                  ; loads different value in r19 for the upcoming dash delay
           
           
           ldi r16, 0x01                     ; DISPLAYS ANOTHER DASH
           out PORTB, r16
           out PORTD, r16
           
           call delay                   
           ldi r19, 36                  ; for the upcoming inter-LETTER space delay as letter COMPLETED 
                                        ;2 DAHSES DISPLAYED THEREFORE M (OM so far)
           
           ldi r16, 0x00                     
           out PORTB, r16
           out PORTD, r16 
           
           call delay                   ;INTER-LETTER DELAY
           ldi r19, 12                       ; for the upcoming DOT delay in NEW LETTER2 so 200ms
           
           
           ; NEW LETTER2
           
           ldi r16, 0x01                     
           out PORTB, r16
           out PORTD, r16                  
           
           call delay                        ; DISPLAYS A DOT 
           ldi r19, 12                       ;loads 12 again for inter-space delay NOT dot delay
           
           ldi r16, 0x00                     
           out PORTB, r16
           out PORTD, r16 
           
           call delay                        ; INTER-SPACE DELAY
           ldi r19, 36                       ; for the upcoming DASH delay
           
           ldi r16, 0x01                     ; DISPLAYS DASH in MORSE CODE
           out PORTB, r16
           out PORTD, r16
           
           call delay                   ; A DOT THEN  A DASH REPRESENTS A, THEREFORE OVERALL: OMA
           ldi r19, 85                  ; for the upcoming WORD DELAY as OMA completes word so 1.4 second delay
             
           ldi r16, 0x00                     
           out PORTB, r16
           out PORTD, r16 
             
           call delay 
           
           dec r21                       ; NOW after word OMA completes will MINUS previousely loaded r21 value (of 4) by 1 
           cpi r21, 0                    ; IF r21 IS 0 meaning it has iterated between first two MORSE loops it will JUMP to loop_morse3 as NOW the value in morse of a 5 at the end needs to be displayed(as for every 5th value) so odd and even 4 times MUST now be the fifth
           brne loop_morse1              ;JUMPS to EVEN loop where MORSE is REVERSE order as still ODD and EVEN   ( ODD , EVEN , ODD , EVEN , ODD AND 5   etc   so as NOT 5th one will JUMP to EVEN)
           rjmp loop_morse3              ;JUMP to loop_morse3( AS this is the odd loop if 0 here on fourth iteration then FIFTH is even iteration so AMO5 display)
           
           
           ;  <<<<<REVERSE ORDER MORSE CODE (displays AMO)>>>>>
           

set_value1:  ldi r21, 4          ; RESETS r21 to 4 so will undergo ANOTHER cycle 
             rjmp loop_morse1



loop_morse1:    

           
           ldi r19, 12                      ;for upcoming dot
           
           ldi r16, 0x01                     
           out PORTB, r16
           out PORTD, r16                  
           
           call delay                        ; DISPLAYS A DOT 
           ldi r19, 12                       ;loads different value here as interspace delay now 
           
           ldi r16, 0x00                     
           out PORTB, r16
           out PORTD, r16 
           
           call delay                   ; INTER-SPACE DELAY
           ldi r19, 36                       ; for the upcoming DASH delay
           
           
           ldi r16, 0x01                     ; DISPLAYS DASH in MORSE CODE
           out PORTB, r16
           out PORTD, r16
           
           call delay                   ; A DOT THEN  A DASH REPRESENTS A
           ldi r19, 36                  ; INTER-letter DELAY
           
           ldi r16, 0x00                     
           out PORTB, r16
           out PORTD, r16
           
           call delay
           
           
           ; NEW LETTER1
           
           
           ldi r19, 36                       ; delay for upcoming dash in NEW letter
           
           
           ldi r16, 0x01                     ; DISPLAYS DASH in MORSE CODE
           out PORTB, r16
           out PORTD, r16
           
           call delay
           ldi r19, 12                       ;loads different value here as interspace delay now 
           
           
           ldi r16, 0x00                     
           out PORTB, r16
           out PORTD, r16 
           
           call delay                   ; INTER-SPACE DELAY
           ldi r19, 36                       ; loads different value for the upcoming dash delay
           
           
           ldi r16, 0x01                     ; DISPLAYS ANOTHER DASH
           out PORTB, r16
           out PORTD, r16
           
           call delay                   ; 2 DAHSES DISPLAYED THEREFORE M ( SO AM so far)
           ldi r19, 36                       ; for the upcoming inter-LETTER  delay
           
           
           ldi r16, 0x00                     
           out PORTB, r16
           out PORTD, r16 
           
           call delay                   ;INTER-LETTER DELAY
           ldi r19, 36                       ; for the upcoming dash delay in NEW LETTER2
           
           
           
           
           ;NEW LETTER 2
           
           
           ldi r16, 0x01                     ; DISPLAYS DASH in MORSE CODE
           out PORTB, r16
           out PORTD, r16
           
           call delay                        ; DASH delay
           ldi r19, 12                       ;loads different value here as interspace delay now 
           
           ldi r16, 0x00                     
           out PORTB, r16                   
           out PORTD, r16 
           
           call delay                        ; INTER-SPACE DELAY
           ldi r19, 36                       ; loads different value for the upcoming dash delay
           
           
           ldi r16, 0x01                     ; DISPLAYS ANOTHER DASH
           out PORTB, r16
           out PORTD, r16
           
           call delay                   
           ldi r19, 12                       ;loads different value here as interspace delay now 
          
           
           ldi r16, 0x00                     
           out PORTB, r16
           out PORTD, r16 
           
           call delay                        ; INTER-SPACE DELAY
           ldi r19, 36                       ; for the upcoming dash delay
           
           
           ldi r16, 0x01                     ; DASH FOR THE THIRD TIME SO DISPLAYS O IN MORSE CODE
           out PORTB, r16                    ; SO overall AMO
           out PORTD, r16
           
           call delay
           ldi r19, 85                       ; delay for the inter-word SO ROUGHLY 1.4s(1400ms)
           
           ldi r16, 0x00                     
           out PORTB, r16
           out PORTD, r16 
           
           call delay
           
           dec r21                           ; does the SAME as first MORSE CODE loop will MINUS one off of the r21 value if r21 = 0 means it has beeen ODD and EVEN for 4 loops and so will SKIP brne and JUMP to loop_morse4
           cpi r21, 0
           brne set_to                       ; if NOT been 4 iterations no need to DISPLAY the fifth iteration special loop so will JUMP to set_to where it will later JUMP BACK to the ODD loop (as still ODD and EVEN and NOT fifth loop)
           rjmp loop_morse4                  ;JUMP to loop_morse4( AS this is the even loop if 0 here on fourth iteration then FIFTH is odd iteration so OMA5 display)
           
           
set_to:    rjmp loop_morse                   ; set_to is done here and jumped to because brne has a limit/range of 64 lines so I have to go here THEN JUMP to loopmorse again as It's too far away
           

loop_morse3:                                               ;FOR the MULTIPLES OF 5 that are EVEN
           
                                                         ;SHOULD DISPLAY THE AMO5 (for 10, 20, 30, 40, 50)
           
           
           
           ldi r19, 12                      ;for upcoming dot
           
           
           ldi r16, 0x01                     
           out PORTB, r16
           out PORTD, r16                  
           
           call delay                        ; DISPLAYS A DOT 
           ldi r19, 12                       ;loads different value here as interspace delay now 
           
           ldi r16, 0x00                     
           out PORTB, r16
           out PORTD, r16 
           
           call delay                   ; INTER-SPACE DELAY
           ldi r19, 36                       ; for the upcoming DASH delay
           
           
           ldi r16, 0x01                     ; DISPLAYS DASH in MORSE CODE
           out PORTB, r16
           out PORTD, r16
           
           call delay                   ; A DOT THEN  A DASH REPRESENTS A
           ldi r19, 36                  ; INTER-LETTER DELAY
           
           
           ldi r16, 0x00                     
           out PORTB, r16
           out PORTD, r16
           
           call delay
           
           
           ; NEW LETTER1
           
           
           ldi r19, 36                  ; delay for upcoming dash
           
           
           ldi r16, 0x01                     ; DISPLAYS DASH in MORSE CODE
           out PORTB, r16
           out PORTD, r16
           
           call delay
           ldi r19, 12                       ;loads different value here as interspace delay now 
           
           
           ldi r16, 0x00                     
           out PORTB, r16
           out PORTD, r16 
           
           
           
           
           call delay                   ; INTER-SPACE DELAY
           ldi r19, 36                       ; loads different value for the upcoming dash delay
           
           
           ldi r16, 0x01                     ; DISPLAYS ANOTHER DASH
           out PORTB, r16
           out PORTD, r16
           
           call delay                   ; 2 DAHSES DISPLAYED THEREFORE M  (so AM so far) 
           ldi r19, 36                       ; for the upcoming inter-LETTER space delay
           
           
           ldi r16, 0x00                     
           out PORTB, r16
           out PORTD, r16 
           
           
           call delay                   ;INTER-LETTER DELAY
           ldi r19, 36                       ; for the upcoming dash delay in NEW LETTER2
           
           
           ;NEW LETTER 2
           
           
           ldi r16, 0x01                     ; DISPLAYS DASH in MORSE CODE
           out PORTB, r16
           out PORTD, r16
           
           ldi r19, 36                      ;loads different value here as dash delay upcoming now for MORSE CODE
           call delay
           ldi r19, 12                       ;loads different value here as interspace delay now 
           
           ldi r16, 0x00                     
           out PORTB, r16                    ; TURNS LED OFF TO DISPLAY MORSE CODE
           out PORTD, r16 
           
           call delay                  ; INTER-SPACE DELAY
           ldi r19, 36                       ; loads different value for the upcoming dash delay
           
           
           ldi r16, 0x01                     ; DISPLAYS ANOTHER DASH
           out PORTB, r16
           out PORTD, r16
           
           call delay                   
           ldi r19, 12                       ;loads different value here as interspace delay now 
          
           
           ldi r16, 0x00                     
           out PORTB, r16
           out PORTD, r16 
           
            
           
           call delay                   ; INTER-SPACE DELAY
           ldi r19, 36                       ; for the upcoming dash delay
           
           
           ldi r16, 0x01                     ; DASH FOR THE THIRD TIME SO DISPLAYS O IN MORSE CODE   THEREFORE  AMO overall
           out PORTB, r16
           out PORTD, r16
           
           call delay
           ldi r19, 36                       ; 36 AS DELAY FOR UPCOMING LETTER,  5       
           
           
           ldi r16, 0x00                     
           out PORTB, r16
           out PORTD, r16 
           
           call delay
           
           
                                   ;NEW LETTER 5   5 DOTS
           
           
           
           ldi r16, 0x01                     ; DISPLAYS  DOT 1 
           out PORTB, r16
           out PORTD, r16                  
           
           
           ldi r19, 12
           call delay                        
           ldi r19, 12                       ;loads different value here as interspace delay now 
           
           ldi r16, 0x00                     
           out PORTB, r16
           out PORTD, r16 
           
           call delay
           
           ldi r16, 0x01                     ; DISPLAYS  DOT 2 
           out PORTB, r16
           out PORTD, r16                  
           
           ldi r19, 12
           call delay                        
           ldi r19, 12                        
           
           ldi r16, 0x00                     
           out PORTB, r16
           out PORTD, r16 
           
           call delay
           ldi r19, 12
           
           ldi r16, 0x01                     ; DISPLAYS  DOT 3
           out PORTB, r16
           out PORTD, r16                  
           
           call delay                        
           ldi r19, 12                       ;interspace delay value
           
           ldi r16, 0x00                     
           out PORTB, r16
           out PORTD, r16 
           
           call delay
           ldi r19, 12
           
           ldi r16, 0x01                     ; DISPLAYS  DOT 4
           out PORTB, r16
           out PORTD, r16                  
           
           call delay                        
           ldi r19, 12                       ;loads different value here as interspace delay now 
           
           ldi r16, 0x00                     
           out PORTB, r16
           out PORTD, r16 
           
           call delay
           ldi r19, 12
           
           
           ldi r16, 0x01                     ; DISPLAYS  DOT 5 
           out PORTB, r16
           out PORTD, r16                  
           
           call delay                        
           ldi r19, 85                       ;loads different value here as inter-WORD delay now 
           
           ldi r16, 0x00                     
           out PORTB, r16
           out PORTD, r16 
           
           call delay
           
           dec r20                                 ; REMEMBER r20 INITIALLY is 10 IF we go THROUGH the multiples of 5 ten times we have FINISHED 50 loops
           cpi r20, 0                             ;TO CHECK if function gone through multiple of 5 10 times(so 50 overall)
           brne set_to1                            ; If not will jump to set_to1 where it goes to EVEN so OMA display as next iteration is EVEN(10  EVEN, 15  ODD, 20 EVEN....)
           
           ldi r19, 183                          ; 2 SECOND DELAY IF MORSE CODE is done so NEW TASK                       
           call delay
           
           rjmp PingPong                             ;IF it is will go PingPong
           
set_to1:   rjmp set_value                      ; RESTARTS LOOPS 


loop_morse4:                                                ;FOR the MULTIPLES OF 5 that are ODD
           
                                                           ;SHOULD DISPLAY THE OMA5 (for 5th, 15th, 25th, 35th, 45th)


           ldi r16, 0x01                     ; DISPLAYS DASH in MORSE CODE
           out PORTB, r16
           out PORTD, r16
           
           ldi r19, 36                      ;loads different value here as dash delay upcoming now for MORSE CODE
           call delay
           ldi r19, 12                       ;loads different value here as interspace delay now 
           
           ldi r16, 0x00                     
           out PORTB, r16                    ; TURNS LED OFF TO DISPLAY MORSE CODE
           out PORTD, r16 
           
           call delay                        ; INTER-SPACE DELAY
           ldi r19, 36                       ; loads different value for the upcoming dash delay
           
           ldi r16, 0x01                     ; DISPLAYS ANOTHER DASH
           out PORTB, r16
           out PORTD, r16
           
           call delay                   
           ldi r19, 12                       ;loads different value here as interspace delay now 
          
           ldi r16, 0x00                     
           out PORTB, r16
           out PORTD, r16 
           
           call delay                        ; INTER-SPACE DELAY
           ldi r19, 36                       ; for the upcoming dash delay
           
           ldi r16, 0x01                     ; DASH FOR THE THIRD TIME SO DISPLAYS O IN MORSE CODE
           out PORTB, r16
           out PORTD, r16
           
           call delay
           ldi r19, 36                       ; for the upcoming inter-LETTER space delay
           
           ldi r16, 0x00                     
           out PORTB, r16
           out PORTD, r16 
           
           call delay                   ;INTER-LETTER DELAY
           ldi r19, 36                  ; for the upcoming DASH delay in NEW LETTER1
           
           
           ; NEW LETTER1
           
           
           ldi r16, 0x01                     ; DISPLAYS DASH in MORSE CODE
           out PORTB, r16
           out PORTD, r16
           
           call delay
           ldi r19, 12                       ;loads different value here as interspace delay now 
           
           
           ldi r16, 0x00                     
           out PORTB, r16
           out PORTD, r16 
           
           call delay                   ; INTER-SPACE DELAY
           ldi r19, 36                       ; loads different value for the upcoming dash delay
           
           
           ldi r16, 0x01                     ; DISPLAYS ANOTHER DASH
           out PORTB, r16
           out PORTD, r16
           
           call delay                   ; 2 DAHSES DISPLAYED THEREFORE M 
           ldi r19, 36                       ; for the upcoming inter-LETTER space delay
           
           ldi r16, 0x00                     
           out PORTB, r16
           out PORTD, r16 
           
           
           call delay                   ;INTER-LETTER DELAY
           ldi r19, 12                       ; for the upcoming dot delay in NEW LETTER2
           
           
           
           ; NEW LETTER2
           
           ldi r16, 0x01                     
           out PORTB, r16
           out PORTD, r16                  
           
           call delay                        ; DISPLAYS A DOT 
           ldi r19, 12                       ;loads different value here as interspace delay now 
           
           ldi r16, 0x00                     
           out PORTB, r16
           out PORTD, r16 
           
           call delay                        ; INTER-SPACE DELAY
           ldi r19, 36                       ; for the upcoming DASH delay
           
           
           ldi r16, 0x01                     ; DISPLAYS DASH in MORSE CODE
           out PORTB, r16
           out PORTD, r16
           
           call delay                   ; A DOT THEN  A DASH REPRESENTS A, THEREFORE OVERALL: OMA
           ldi r19, 12                       ; for the upcoming interspace as OMA and 5 next
             
           ldi r16, 0x00                     
           out PORTB, r16
           out PORTD, r16 
             
           call delay 
           
                                   ;EXTRA 5   5 DOTS
           
           ldi r16, 0x01                     ; DISPLAYS  DOT 1 
           out PORTB, r16
           out PORTD, r16                  
           
           ldi r19, 12
           call delay                        
           ldi r19, 12                       ;loads different value here as interspace delay now 
           
           ldi r16, 0x00                     
           out PORTB, r16
           out PORTD, r16 
           
           call delay
           
           ldi r16, 0x01                     ; DISPLAYS  DOT 2 
           out PORTB, r16
           out PORTD, r16                  
           
           ldi r19, 12
           call delay                        
           ldi r19, 12                        
           
           ldi r16, 0x00                     
           out PORTB, r16
           out PORTD, r16 
           
           call delay
           ldi r19, 12
           
           ldi r16, 0x01                     ; DISPLAYS  DOT 3
           out PORTB, r16
           out PORTD, r16                  
           
           call delay                        
           ldi r19, 12                       
           
           ldi r16, 0x00                     
           out PORTB, r16
           out PORTD, r16 
           
           call delay
           ldi r19, 12
           
           ldi r16, 0x01                     ; DISPLAYS  DOT 4
           out PORTB, r16
           out PORTD, r16                  
           
           call delay                        
           ldi r19, 12                       
           
           ldi r16, 0x00                     
           out PORTB, r16
           out PORTD, r16 
           
           call delay
           ldi r19, 12
           
           
           ldi r16, 0x01                     ; DISPLAYS  DOT 5 
           out PORTB, r16
           out PORTD, r16                  
           
           call delay                        
           ldi r19, 85                      ; 85 for inter-WORD delay 
           
           ldi r16, 0x00                     
           out PORTB, r16
           out PORTD, r16 
           
           call delay
           
           
           dec r20                           ; AGAIN using r20 to CHECK if 50 loops completed
           cpi r20, 0
           brne set_to2                      ; IF NOT given this is for the multiples of 5 that are EVEN will GO set_2 (another close function because of brne limited distance)
           
           ldi r19, 61                       ; sets r19 to 61 for 1 second delay
           call delay
           
           rjmp PingPong
           
  
set_to2:   rjmp set_value1                   ; JUMPS here as multiple of 5 was ODD so next integer is EVEN so goes to set_value1( ANOTHER function that resets r21 but is before EVEN loop so will display EVEN again)
           
           
           
           ; PING PONG 4-BIT
            
           
PingPong:                               
          
            
            
            ldi r16, 0x08                     ; SETS the LEDs to 0000 1000  fourth LED from the right is ON
            out PORTB, r16
            out PORTD, r16 
           
            ldi r19, 8                        ; for the SHORTER delay as want it to look like a pingpong match 
            call delay
            
            call shiftRight                   ; CALLS function shifRight which moves the value to the right eg  0000 1000 then 0000 0100  then  0000 0010 UNTIL 0000 0001 
            
            call shiftLeft                    ;  NOW shiftLeft moves it left AGAIN until 0000 1000 again 
            
            rjmp PingPong                     ; loops indefinately
            
           

shiftRight:     
            
                lsr r16    
                out PORTB, r16
                out PORTD, r16
                
                
                ldi r19, 8
                call delay
            
                lsr r16    
                out PORTB, r16
                out PORTD, r16
            
            
                ldi r19, 8
                call delay
            
                lsr r16    
                out PORTB, r16
                out PORTD, r16
            
            
                ldi r19, 8
                call delay
            
                ret   



shiftLeft:      ldi r19, 8
                call delay
            
                lsl r16    
                out PORTB, r16
                out PORTD, r16
                
                
                ldi r19, 8
                call delay
            
                lsl r16    
                out PORTB, r16
                out PORTD, r16
            
            
                ldi r19, 8
                call delay
            
                lsl r16    
                out PORTB, r16
                out PORTD, r16
            
            
                ldi r19, 8
                call delay
            
                ret

                        
delay:                  ; ususally delay of one second, 600ms when dash or space between letters in MORSE CODE ,200 ms delay when there is a dot or space between dash and/or dot
                        ldi r18, 255
                        ldi r17, 255
                        
nestedloop:                  
                                                                               


                         nop
                         dec r17
                         cpi r17, 0
                         brne nestedloop

                         dec r18
                         cpi r18, 0
                         brne nestedloop

                         dec r19
                         cpi r19, 0
                         brne nestedloop
                        
                         
                         ret
                         
