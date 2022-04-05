
_door_open:
	PUSH PSW+0
	PUSH 224
	PUSH B+0
	PUSH 130
	PUSH 131
;Elevator.c,23 :: 		void door_open() iv IVT_ADDR_EX1 ilevel 0 ics ICS_AUTO {
;Elevator.c,25 :: 		P1.B2=1;
	SETB P1+0
;Elevator.c,26 :: 		delay_ms(1);
	MOV R6, 2
	MOV R7, 157
	DJNZ R7, 
	DJNZ R6, 
	NOP
;Elevator.c,27 :: 		P1.B2=0;
	CLR P1+0
;Elevator.c,28 :: 		delay_ms(5000);
	MOV R5, 32
	MOV R6, 171
	MOV R7, 57
	DJNZ R7, 
	DJNZ R6, 
	DJNZ R5, 
;Elevator.c,29 :: 		}
	POP 131
	POP 130
	POP B+0
	POP 224
	POP PSW+0
	RETI
; end of _door_open

_fsr_open:
	PUSH PSW+0
	PUSH 224
	PUSH B+0
	PUSH 130
	PUSH 131
;Elevator.c,30 :: 		void fsr_open() iv IVT_ADDR_EX0 ilevel 0 ics ICS_AUTO {
;Elevator.c,31 :: 		P1.B3 = 1;
	SETB P1+0
;Elevator.c,32 :: 		delay_ms(2000);
	MOV R5, 13
	MOV R6, 171
	MOV R7, 124
	DJNZ R7, 
	DJNZ R6, 
	DJNZ R5, 
;Elevator.c,33 :: 		P1.B3 = 0;
	CLR P1+0
;Elevator.c,34 :: 		}
	POP 131
	POP 130
	POP B+0
	POP 224
	POP PSW+0
	RETI
; end of _fsr_open

_leds_check:
	PUSH PSW+0
	PUSH 224
	PUSH B+0
	PUSH 130
	PUSH 131
;Elevator.c,36 :: 		void leds_check() iv IVT_ADDR_ET0 ilevel 0 ics ICS_AUTO
;Elevator.c,39 :: 		if(P3.B0)
	MOV A, P3+0
	JNB 224, L_leds_check0
	NOP
;Elevator.c,41 :: 		flag[0] = 1;
	MOV _flag+0, #1
;Elevator.c,42 :: 		wanted = 0;
	MOV _wanted+0, #0
;Elevator.c,43 :: 		}
L_leds_check0:
;Elevator.c,45 :: 		if(P3.B1)
	MOV A, P3+0
	JNB 224, L_leds_check1
	NOP
;Elevator.c,47 :: 		flag[1] = 1;
	MOV _flag+1, #1
;Elevator.c,48 :: 		wanted = 1;
	MOV _wanted+0, #1
;Elevator.c,49 :: 		state = 1;
	MOV _state+0, #1
;Elevator.c,50 :: 		}
L_leds_check1:
;Elevator.c,52 :: 		if(P3.B6)
	MOV A, P3+0
	JNB 224, L_leds_check2
	NOP
;Elevator.c,54 :: 		flag[1] = 1;
	MOV _flag+1, #1
;Elevator.c,55 :: 		wanted = 1;
	MOV _wanted+0, #1
;Elevator.c,56 :: 		state =-1;
	MOV _state+0, #255
;Elevator.c,57 :: 		}
L_leds_check2:
;Elevator.c,59 :: 		if(P3.B7)
	MOV A, P3+0
	JNB 224, L_leds_check3
	NOP
;Elevator.c,61 :: 		flag[2] = 1;
	MOV _flag+2, #1
;Elevator.c,62 :: 		wanted = 2;
	MOV _wanted+0, #2
;Elevator.c,63 :: 		state = 1;
	MOV _state+0, #1
;Elevator.c,64 :: 		}
L_leds_check3:
;Elevator.c,66 :: 		if(P3.B4)
	MOV A, P3+0
	JNB 224, L_leds_check4
	NOP
;Elevator.c,68 :: 		flag[2] = 1;
	MOV _flag+2, #1
;Elevator.c,69 :: 		wanted = 2;
	MOV _wanted+0, #2
;Elevator.c,70 :: 		state = -1;
	MOV _state+0, #255
;Elevator.c,71 :: 		}
L_leds_check4:
;Elevator.c,73 :: 		if(P3.B5)
	MOV A, P3+0
	JNB 224, L_leds_check5
	NOP
;Elevator.c,75 :: 		flag[3] = 1;
	MOV _flag+3, #1
;Elevator.c,76 :: 		wanted = 3;
	MOV _wanted+0, #3
;Elevator.c,77 :: 		}
L_leds_check5:
;Elevator.c,79 :: 		P2.B0=P2.B1=P2.B2=P2.B3=1;
	SETB P2+0
	MOV C, P2+0
	MOV P2+0, C
	MOV C, P2+0
	MOV P2+0, C
	MOV C, P2+0
	MOV P2+0, C
;Elevator.c,80 :: 		P2.B0=0;
	CLR P2+0
;Elevator.c,81 :: 		if(P2.B4==0)
	JB P2+0, L_leds_check6
	NOP
;Elevator.c,84 :: 		flag[1] = 1;
	MOV _flag+1, #1
;Elevator.c,85 :: 		}
L_leds_check6:
;Elevator.c,87 :: 		P2.B0=P2.B1=P2.B2=P2.B3=1;
	SETB P2+0
	MOV C, P2+0
	MOV P2+0, C
	MOV C, P2+0
	MOV P2+0, C
	MOV C, P2+0
	MOV P2+0, C
;Elevator.c,88 :: 		P2.B0=0;
	CLR P2+0
;Elevator.c,89 :: 		if(P2.B5==0)
	JB P2+0, L_leds_check7
	NOP
;Elevator.c,92 :: 		flag[2] = 1;
	MOV _flag+2, #1
;Elevator.c,93 :: 		}
L_leds_check7:
;Elevator.c,94 :: 		P2.B0=P2.B1=P2.B2=P2.B3=1;
	SETB P2+0
	MOV C, P2+0
	MOV P2+0, C
	MOV C, P2+0
	MOV P2+0, C
	MOV C, P2+0
	MOV P2+0, C
;Elevator.c,95 :: 		P2.B0=0;
	CLR P2+0
;Elevator.c,96 :: 		if(P2.B6==0)
	JB P2+0, L_leds_check8
	NOP
;Elevator.c,99 :: 		flag[3] = 1;
	MOV _flag+3, #1
;Elevator.c,100 :: 		}
L_leds_check8:
;Elevator.c,102 :: 		P2.B0=P2.B1=P2.B2=P2.B3=1;
	SETB P2+0
	MOV C, P2+0
	MOV P2+0, C
	MOV C, P2+0
	MOV P2+0, C
	MOV C, P2+0
	MOV P2+0, C
;Elevator.c,103 :: 		P2.B3=0;
	CLR P2+0
;Elevator.c,104 :: 		if(P2.B5==0)
	JB P2+0, L_leds_check9
	NOP
;Elevator.c,106 :: 		flag[0] = 1;
	MOV _flag+0, #1
;Elevator.c,107 :: 		}
L_leds_check9:
;Elevator.c,108 :: 		P2.B0=P2.B1=P2.B2=P2.B3=1;
	SETB P2+0
	MOV C, P2+0
	MOV P2+0, C
	MOV C, P2+0
	MOV P2+0, C
	MOV C, P2+0
	MOV P2+0, C
;Elevator.c,109 :: 		P2.B3=0;
	CLR P2+0
;Elevator.c,110 :: 		if(P2.B6==0)
	JB P2+0, L_leds_check10
	NOP
;Elevator.c,112 :: 		flag2 = 1;
	MOV _flag2+0, #1
;Elevator.c,113 :: 		}
L_leds_check10:
;Elevator.c,114 :: 		TCON.TF0=0;
	CLR TCON+0
;Elevator.c,115 :: 		TCON.TR0=1;
	SETB TCON+0
;Elevator.c,117 :: 		}
	POP 131
	POP 130
	POP B+0
	POP 224
	POP PSW+0
	RETI
; end of _leds_check

_main:
	MOV SP+0, #128
;Elevator.c,124 :: 		void main()
;Elevator.c,126 :: 		P1 = 0x00;
	MOV P1+0, #0
;Elevator.c,127 :: 		P3=0x00;
	MOV P3+0, #0
;Elevator.c,128 :: 		P2=0xFF;
	MOV P2+0, #255
;Elevator.c,129 :: 		TMOD=0x01;
	MOV TMOD+0, #1
;Elevator.c,130 :: 		IE=0x87;
	MOV IE+0, #135
;Elevator.c,131 :: 		SCON = 0x50;
	MOV SCON+0, #80
;Elevator.c,132 :: 		TL0  = 0xE5;
	MOV TL0+0, #229
;Elevator.c,133 :: 		TH0  = 0xBE;
	MOV TH0+0, #190
;Elevator.c,134 :: 		TCON.B0 = 0;
	CLR TCON+0
;Elevator.c,135 :: 		TCON.B2 = 1;
	SETB TCON+0
;Elevator.c,136 :: 		TCON.TR0  = 1;
	SETB TCON+0
;Elevator.c,137 :: 		Lcd_Init();
	LCALL _Lcd_Init+0
;Elevator.c,138 :: 		delay_ms(10);
	MOV R6, 17
	MOV R7, 52
	DJNZ R7, 
	DJNZ R6, 
	NOP
;Elevator.c,139 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOV FARG_Lcd_Cmd_out_char+0, #12
	LCALL _Lcd_Cmd+0
;Elevator.c,140 :: 		while(1)
L_main11:
;Elevator.c,142 :: 		lcd_Cmd(_LCD_CLEAR);
	MOV FARG_Lcd_Cmd_out_char+0, #1
	LCALL _Lcd_Cmd+0
;Elevator.c,143 :: 		delay_ms(1000);
	MOV R5, 7
	MOV R6, 86
	MOV R7, 60
	DJNZ R7, 
	DJNZ R6, 
	DJNZ R5, 
;Elevator.c,144 :: 		for(i = 0; i <4 ; i++)
	MOV _i+0, #0
L_main13:
	CLR C
	MOV A, _i+0
	SUBB A, #4
	JNC L_main14
;Elevator.c,146 :: 		if(flag[i] == 1)
	MOV A, #_flag+0
	ADD A, _i+0
	MOV R0, A
	MOV 1, @R0
	MOV A, R1
	XRL A, #1
	JNZ L_main16
;Elevator.c,148 :: 		moving(i);
	MOV FARG_moving_index+0, _i+0
	CLR A
	MOV FARG_moving_index+1, A
	LCALL _moving+0
;Elevator.c,149 :: 		}
L_main16:
;Elevator.c,144 :: 		for(i = 0; i <4 ; i++)
	INC _i+0
;Elevator.c,150 :: 		}
	SJMP L_main13
L_main14:
;Elevator.c,151 :: 		}
	SJMP L_main11
;Elevator.c,152 :: 		}
	SJMP #254
; end of _main

_deduce_want:
;Elevator.c,153 :: 		void deduce_want(char index){
;Elevator.c,154 :: 		for(z =0; z<4; z++)
	MOV _z+0, #0
L_deduce_want17:
	CLR C
	MOV A, _z+0
	SUBB A, #4
	JNC L_deduce_want18
;Elevator.c,156 :: 		if(flag[z] ==1 && z!= index)
	MOV A, #_flag+0
	ADD A, _z+0
	MOV R0, A
	MOV 1, @R0
	MOV A, R1
	XRL A, #1
	JNZ L_deduce_want22
	MOV A, _z+0
	XRL A, FARG_deduce_want_index+0
	JZ L_deduce_want22
L__deduce_want49:
;Elevator.c,157 :: 		wanted2 = z;
	MOV _wanted2+0, _z+0
L_deduce_want22:
;Elevator.c,154 :: 		for(z =0; z<4; z++)
	INC _z+0
;Elevator.c,158 :: 		}
	SJMP L_deduce_want17
L_deduce_want18:
;Elevator.c,159 :: 		if((wanted - current) > 0)
	CLR C
	MOV A, _wanted+0
	SUBB A, _current+0
	MOV R1, A
	CLR A
	SUBB A, #0
	MOV R2, A
	SETB C
	MOV A, R1
	SUBB A, #0
	MOV A, #0
	XRL A, #128
	MOV R0, A
	MOV A, R2
	XRL A, #128
	SUBB A, R0
	JC L_deduce_want23
;Elevator.c,160 :: 		direc1 = 1;
	MOV _direc1+0, #1
	SJMP L_deduce_want24
L_deduce_want23:
;Elevator.c,162 :: 		direc1 = -1;
	MOV _direc1+0, #255
L_deduce_want24:
;Elevator.c,163 :: 		if((wanted2 - current) > 0)
	CLR C
	MOV A, _wanted2+0
	SUBB A, _current+0
	MOV R1, A
	CLR A
	SUBB A, #0
	MOV R2, A
	SETB C
	MOV A, R1
	SUBB A, #0
	MOV A, #0
	XRL A, #128
	MOV R0, A
	MOV A, R2
	XRL A, #128
	SUBB A, R0
	JC L_deduce_want25
;Elevator.c,164 :: 		direc2 = 1 * state;
	MOV _direc2+0, _state+0
	SJMP L_deduce_want26
L_deduce_want25:
;Elevator.c,166 :: 		direc2 = -1 * state;
	MOV B+0, _state+0
	MOV A, #255
	MUL AB
	MOV R0, A
	MOV _direc2+0, 0
L_deduce_want26:
;Elevator.c,167 :: 		if(direc1 == direc2)
	MOV A, _direc1+0
	XRL A, _direc2+0
	JNZ L_deduce_want27
;Elevator.c,169 :: 		wanted = wanted2;
	MOV _wanted+0, _wanted2+0
;Elevator.c,170 :: 		time = abs(wanted - current);
	CLR C
	MOV A, _wanted2+0
	SUBB A, _current+0
	MOV FARG_abs_a+0, A
	CLR A
	SUBB A, #0
	MOV FARG_abs_a+1, A
	LCALL _abs+0
	MOV _time+0, 0
;Elevator.c,171 :: 		}
L_deduce_want27:
;Elevator.c,172 :: 		}
	RET
; end of _deduce_want

_moving:
;Elevator.c,173 :: 		void moving (int index)
;Elevator.c,175 :: 		Sevenseg(current);
	MOV FARG_Sevenseg_x+0, _current+0
	LCALL _Sevenseg+0
;Elevator.c,176 :: 		wanted = index;
	MOV _wanted+0, FARG_moving_index+0
;Elevator.c,177 :: 		flag2 = 1;
	MOV _flag2+0, #1
;Elevator.c,178 :: 		time = abs(wanted - current);
	MOV R0, _current+0
	CLR A
	MOV R1, A
	CLR C
	MOV A, FARG_moving_index+0
	SUBB A, R0
	MOV FARG_abs_a+0, A
	CLR A
	SUBB A, #0
	MOV FARG_abs_a+1, A
	LCALL _abs+0
	MOV _time+0, 0
;Elevator.c,179 :: 		if((wanted - current) > 0)
	CLR C
	MOV A, _wanted+0
	SUBB A, _current+0
	MOV R1, A
	CLR A
	SUBB A, #0
	MOV R2, A
	SETB C
	MOV A, R1
	SUBB A, #0
	MOV A, #0
	XRL A, #128
	MOV R0, A
	MOV A, R2
	XRL A, #128
	SUBB A, R0
	JC L_moving28
;Elevator.c,180 :: 		direc = 1;
	MOV _direc+0, #1
	SJMP L_moving29
L_moving28:
;Elevator.c,182 :: 		direc = -1;
	MOV _direc+0, #255
L_moving29:
;Elevator.c,184 :: 		delay1();
	LCALL _delay1+0
;Elevator.c,185 :: 		close_door();
	LCALL _close_door+0
;Elevator.c,186 :: 		delay_ms(1000);
	MOV R5, 7
	MOV R6, 86
	MOV R7, 60
	DJNZ R7, 
	DJNZ R6, 
	DJNZ R5, 
;Elevator.c,187 :: 		for( j = 0; j < time; j++)
	MOV _j+0, #0
L_moving30:
	CLR C
	MOV A, _j+0
	SUBB A, _time+0
	JNC L_moving31
;Elevator.c,189 :: 		deduce_want(index);
	MOV FARG_deduce_want_index+0, FARG_moving_index+0
	LCALL _deduce_want+0
;Elevator.c,190 :: 		stringtxt(wanted);
	MOV FARG_stringtxt_x+0, _wanted+0
	LCALL _stringtxt+0
;Elevator.c,191 :: 		move_elevat(direc);
	MOV FARG_move_elevat_direction+0, _direc+0
	LCALL _move_elevat+0
;Elevator.c,192 :: 		current+= direc;
	MOV A, _current+0
	ADD A, _direc+0
	MOV R0, A
	MOV _current+0, 0
;Elevator.c,193 :: 		Sevenseg(current);
	MOV FARG_Sevenseg_x+0, 0
	LCALL _Sevenseg+0
;Elevator.c,194 :: 		delay_ms(500);
	MOV R5, 4
	MOV R6, 43
	MOV R7, 157
	DJNZ R7, 
	DJNZ R6, 
	DJNZ R5, 
;Elevator.c,187 :: 		for( j = 0; j < time; j++)
	INC _j+0
;Elevator.c,195 :: 		}
	SJMP L_moving30
L_moving31:
;Elevator.c,196 :: 		P1.B0 =0;
	CLR P1+0
;Elevator.c,197 :: 		P1.B1 =0;
	CLR P1+0
;Elevator.c,198 :: 		flag[wanted] = 0;
	MOV A, #_flag+0
	ADD A, _wanted+0
	MOV R0, A
	MOV @R0, #0
;Elevator.c,199 :: 		delay_ms(1000);
	MOV R5, 7
	MOV R6, 86
	MOV R7, 60
	DJNZ R7, 
	DJNZ R6, 
	DJNZ R5, 
;Elevator.c,200 :: 		open_door();
	LCALL _open_door+0
;Elevator.c,201 :: 		delay_ms(500);
	MOV R5, 4
	MOV R6, 43
	MOV R7, 157
	DJNZ R7, 
	DJNZ R6, 
	DJNZ R5, 
;Elevator.c,202 :: 		}
	RET
; end of _moving

_close_door:
;Elevator.c,204 :: 		void close_door(void)
;Elevator.c,206 :: 		Lcd_Out(1,1, "Close");
	MOV FARG_LCD_Out_row+0, #1
	MOV FARG_LCD_Out_column+0, #1
	MOV FARG_LCD_Out_text+0, #?lstr1_Elevator+0
	LCALL _LCD_Out+0
;Elevator.c,207 :: 		P1.B2=1;
	SETB P1+0
;Elevator.c,208 :: 		delay_ms(2);
	MOV R6, 4
	MOV R7, 60
	DJNZ R7, 
	DJNZ R6, 
	NOP
;Elevator.c,209 :: 		P1.B2=0;
	CLR P1+0
;Elevator.c,210 :: 		delay_ms(2);
	MOV R6, 4
	MOV R7, 60
	DJNZ R7, 
	DJNZ R6, 
	NOP
;Elevator.c,211 :: 		IE = 0x82;
	MOV IE+0, #130
;Elevator.c,213 :: 		}
	RET
; end of _close_door

_open_door:
;Elevator.c,214 :: 		void open_door(void)
;Elevator.c,216 :: 		Lcd_Out(1,1, "Open ");
	MOV FARG_LCD_Out_row+0, #1
	MOV FARG_LCD_Out_column+0, #1
	MOV FARG_LCD_Out_text+0, #?lstr2_Elevator+0
	LCALL _LCD_Out+0
;Elevator.c,217 :: 		P1.B2=1;
	SETB P1+0
;Elevator.c,218 :: 		delay_ms(1);
	MOV R6, 2
	MOV R7, 157
	DJNZ R7, 
	DJNZ R6, 
	NOP
;Elevator.c,219 :: 		P1.B2=0;
	CLR P1+0
;Elevator.c,220 :: 		delay_ms(2);
	MOV R6, 4
	MOV R7, 60
	DJNZ R7, 
	DJNZ R6, 
	NOP
;Elevator.c,221 :: 		IE = 0x87;
	MOV IE+0, #135
;Elevator.c,223 :: 		}
	RET
; end of _open_door

_move_elevat:
;Elevator.c,224 :: 		void move_elevat(signed char direction)
;Elevator.c,227 :: 		if(direction > 0)
	SETB C
	MOV A, #0
	XRL A, #128
	MOV R0, A
	MOV A, FARG_move_elevat_direction+0
	XRL A, #128
	SUBB A, R0
	JC L_move_elevat33
;Elevator.c,229 :: 		Lcd_Out(1,1, "Up   ");
	MOV FARG_LCD_Out_row+0, #1
	MOV FARG_LCD_Out_column+0, #1
	MOV FARG_LCD_Out_text+0, #?lstr3_Elevator+0
	LCALL _LCD_Out+0
;Elevator.c,230 :: 		P1.B0=1;
	SETB P1+0
;Elevator.c,231 :: 		P1.B1=0;
	CLR P1+0
;Elevator.c,232 :: 		delay_ms(2000);
	MOV R5, 13
	MOV R6, 171
	MOV R7, 124
	DJNZ R7, 
	DJNZ R6, 
	DJNZ R5, 
;Elevator.c,235 :: 		}
	SJMP L_move_elevat34
L_move_elevat33:
;Elevator.c,238 :: 		Lcd_Out(1,1, "Down ");
	MOV FARG_LCD_Out_row+0, #1
	MOV FARG_LCD_Out_column+0, #1
	MOV FARG_LCD_Out_text+0, #?lstr4_Elevator+0
	LCALL _LCD_Out+0
;Elevator.c,239 :: 		P1.B0=0;
	CLR P1+0
;Elevator.c,240 :: 		P1.B1=1;
	SETB P1+0
;Elevator.c,241 :: 		delay_ms(2000);
	MOV R5, 13
	MOV R6, 171
	MOV R7, 124
	DJNZ R7, 
	DJNZ R6, 
	DJNZ R5, 
;Elevator.c,244 :: 		}
L_move_elevat34:
;Elevator.c,246 :: 		}
	RET
; end of _move_elevat

_Sevenseg:
;Elevator.c,248 :: 		void Sevenseg(char x)
;Elevator.c,250 :: 		P1 &= 0x0f;
	ANL P1+0, #15
;Elevator.c,251 :: 		switch(x)
	SJMP L_Sevenseg35
;Elevator.c,253 :: 		case 1:
L_Sevenseg37:
;Elevator.c,255 :: 		P1|=0b10000000;
	ORL P1+0, #128
;Elevator.c,256 :: 		}break;
	SJMP L_Sevenseg36
;Elevator.c,257 :: 		case 2:
L_Sevenseg38:
;Elevator.c,259 :: 		P1|=0b01000000;
	ORL P1+0, #64
;Elevator.c,260 :: 		}break;
	SJMP L_Sevenseg36
;Elevator.c,261 :: 		case 3:
L_Sevenseg39:
;Elevator.c,263 :: 		P1|=0b11000000;
	ORL P1+0, #192
;Elevator.c,264 :: 		}break;
	SJMP L_Sevenseg36
;Elevator.c,265 :: 		case 0:
L_Sevenseg40:
;Elevator.c,267 :: 		P1|=0b00000000;
;Elevator.c,268 :: 		}break;
	SJMP L_Sevenseg36
;Elevator.c,269 :: 		}
L_Sevenseg35:
	MOV A, FARG_Sevenseg_x+0
	XRL A, #1
	JZ L_Sevenseg37
	MOV A, FARG_Sevenseg_x+0
	XRL A, #2
	JZ L_Sevenseg38
	MOV A, FARG_Sevenseg_x+0
	XRL A, #3
	JZ L_Sevenseg39
	MOV A, FARG_Sevenseg_x+0
	JZ L_Sevenseg40
L_Sevenseg36:
;Elevator.c,270 :: 		}
	RET
; end of _Sevenseg

_stringtxt:
;Elevator.c,271 :: 		void stringtxt(char x)
;Elevator.c,273 :: 		switch(x)
	SJMP L_stringtxt41
;Elevator.c,275 :: 		case 1:
L_stringtxt43:
;Elevator.c,277 :: 		Lcd_Out(2,1, "Go to 1");
	MOV FARG_LCD_Out_row+0, #2
	MOV FARG_LCD_Out_column+0, #1
	MOV FARG_LCD_Out_text+0, #?lstr5_Elevator+0
	LCALL _LCD_Out+0
;Elevator.c,278 :: 		}break;
	SJMP L_stringtxt42
;Elevator.c,279 :: 		case 2:
L_stringtxt44:
;Elevator.c,281 :: 		Lcd_Out(2,1, " Go to 2");
	MOV FARG_LCD_Out_row+0, #2
	MOV FARG_LCD_Out_column+0, #1
	MOV FARG_LCD_Out_text+0, #?lstr6_Elevator+0
	LCALL _LCD_Out+0
;Elevator.c,282 :: 		}break;
	SJMP L_stringtxt42
;Elevator.c,283 :: 		case 3:
L_stringtxt45:
;Elevator.c,285 :: 		Lcd_Out(2,1, "Go to 3");
	MOV FARG_LCD_Out_row+0, #2
	MOV FARG_LCD_Out_column+0, #1
	MOV FARG_LCD_Out_text+0, #?lstr7_Elevator+0
	LCALL _LCD_Out+0
;Elevator.c,286 :: 		}break;
	SJMP L_stringtxt42
;Elevator.c,287 :: 		case 0:
L_stringtxt46:
;Elevator.c,289 :: 		Lcd_Out(2,1, "Go to 0");
	MOV FARG_LCD_Out_row+0, #2
	MOV FARG_LCD_Out_column+0, #1
	MOV FARG_LCD_Out_text+0, #?lstr8_Elevator+0
	LCALL _LCD_Out+0
;Elevator.c,290 :: 		}break;
	SJMP L_stringtxt42
;Elevator.c,291 :: 		}
L_stringtxt41:
	MOV A, FARG_stringtxt_x+0
	XRL A, #1
	JZ L_stringtxt43
	MOV A, FARG_stringtxt_x+0
	XRL A, #2
	JZ L_stringtxt44
	MOV A, FARG_stringtxt_x+0
	XRL A, #3
	JZ L_stringtxt45
	MOV A, FARG_stringtxt_x+0
	JZ L_stringtxt46
L_stringtxt42:
;Elevator.c,292 :: 		}
	RET
; end of _stringtxt

_delay1:
;Elevator.c,293 :: 		void delay1(void)
;Elevator.c,295 :: 		while(flag2)
L_delay147:
	MOV A, _flag2+0
	JZ L_delay148
;Elevator.c,297 :: 		flag2 = 0;
	MOV _flag2+0, #0
;Elevator.c,298 :: 		delay_ms(3000);
	MOV R5, 19
	MOV R6, 0
	MOV R7, 187
	DJNZ R7, 
	DJNZ R6, 
	DJNZ R5, 
	NOP
;Elevator.c,299 :: 		}
	SJMP L_delay147
L_delay148:
;Elevator.c,300 :: 		}
	RET
; end of _delay1
