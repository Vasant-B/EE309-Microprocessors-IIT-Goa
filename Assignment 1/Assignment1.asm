;Question 5
;Add three 16 bit numbers and OUT using 12345
;  8841
;+ 8F18
;+ F100
;=20859

jmp start

;data


;code
start:	NOP
	MVI A, 41H
	ADI 18H
	MOV C, A
	MVI A, 88H
	ACI 8FH
	MOV D, A
	MVI A, 00H
	ACI 00H
	MOV E, A
;8841+8F18 is stored in EDC Temporarily 
;where E is the most  significant
;where C is the least significant
;Now, Add F100 to EDC and store it in EDC
	MOV A, C
	ADI 00H
	MOV C, A
	MOV A, D
	ACI 0F1H
	MOV D, A
	MOV A, E
	ACI 00H
	MOV E, A
;The final answer is stored in EDC
;where E is the most  significant
;where C is the least significant
;Now, we need to output the result to 12345
;I am assuming that the Most significant nibble is 5
    ;MOV THE MS Nibble (LS Nibble of E) to 5
    MOV A, E
    ANI 0FH
    OUT 05
    ;MOV the MS Nibble of D to 4
    MOV A, D
    ANI 0F0H
    RRC
    RRC
    RRC
    RRC
    OUT 04
    ;MOV the LS Nibble of D to 3
    MOV A, D
    ANI 0FH
    OUT 03
    ;MOV the MS Nibble of C to 2
    MOV A, C
    ANI 0F0H
    RRC
    RRC
    RRC
    RRC
    OUT 2
    ;MOV the LS Nibble of C to 1
    MOV A, C
    ANI 0FH
    OUT 1
HLT