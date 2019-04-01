
;<Program title> 
;So,my Roll No.being 160020026
;I haveto simulate the calendar of 2026

;Monday:1
;Tuesday:2
;Wednesday:3
;Thursday:4
;Friday:5
;Saturday:6
;Sunday:7

;Jan:01
;Feb:02
;Mar:03
;Apr:04
;May:05
;Jun:06
;Jul:07
;Aug:08
;Sep:09
;Oct:10
;Nov:11
;Dec:12 

jmp start

;data
INITIALIZE_MONTH_DATA: NOP ;Store the data about how many days in a month
	LXI H, 2001H
	MVI M, 31;Jan
	INX H
	MVI M, 28;Feb
	INX H
	MVI M, 31;Mar
	INX H
	MVI M, 30;Apr
	INX H
	MVI M, 31;May
	INX H
	MVI M, 30;Jun
	INX H
	MVI M, 31;Jul
	INX H
	MVI M, 31;Aug
	INX H
	MVI M, 30;Sep
	INX H
	MVI M, 31;Oct
	INX H
	MVI M, 30;Nov
	INX H
	MVI M, 31;Dec
;Starting Days of each month
	LXI H, 2101H
	MVI M, 4;Jan
	INX H
	MVI M, 7;Feb
	INX H
	MVI M, 7;Mar
	INX H
	MVI M, 3;Apr
	INX H
	MVI M, 5;May
	INX H
	MVI M, 1;Jun
	INX H
	MVI M, 3;Jul
	INX H
	MVI M, 6;Aug
	INX H
	MVI M, 2;Sep
	INX H
	MVI M, 4;Oct
	INX H
	MVI M, 7;Nov
	INX H
	MVI M, 2;Dec
RET

ADVANCE_DAY_BY_ONE: INR E
	MOV A, E
	CPI 08
	JNZ ADVANCE_DAY_BY_ONE_EXIT
	;enters here when Z=1 A= Data
		MVI E, 01
	ADVANCE_DAY_BY_ONE_EXIT: NOP
RET

;code
start: nop
	CALL INITIALIZE_MONTH_DATA
	MVI B, 05 ;INPUT MONTH
	MVI C, 05 ;INPUT DATE
	;Check the starting day
	MVI H, 21H
	MOV L, B
	;Store that starting day in E
	MOV E, M
	;Now, call ADVANCE_DAY_BY_ONE C-1 times
	DCR C
	JZ GIVE_OUTPUT
	GET_THE_DAY_LOOP: NOP
		CALL ADVANCE_DAY_BY_ONE
		DCR C
	JNZ GET_THE_DAY_LOOP	
	GIVE_OUTPUT: NOP
		MOV A, E
		OUT 1	
HLT














