     AREA     appcode, CODE, READONLY
     IMPORT printMsgand
	 IMPORT printMsgor
	 IMPORT printMsgnot
	 IMPORT printMsgnand
	 IMPORT printMsgnor	 
	 EXPORT __main
     ENTRY 
__main  FUNCTION	
; IGNORE THIS PART 	

		VLDR.F32 S17,=0.5	;value 0.5 to compare with output
		
LOGIC_AND MOV R7,#0
NEXTINPAND	BL INPUTS
		ADD R7,R7,#1
		VLDR.F32 S3,=-0.1      ;w0
		VLDR.F32 S10,=0.2	   ;w1	
		VLDR.F32 S11,=0.2	   ;w2
		VLDR.F32 S12,=-0.2	   ;bias
		VMOV.F32 S13,R0
		VMOV.F32 S14,R1
		VMOV.F32 S15,R2
		VCVT.F32.S32 S13,S13		   ;x0 --> input 0
		VCVT.F32.S32 S14,S14		   ;x1 --> input 1
		VCVT.F32.S32 S15,S15		   ;x2 --> input 2
		VLDR.F32 S16,=1		   ;bias --> '1'
		
		VMUL.F32 S3,S3,S13	   ;w0 * x0
		VMUL.F32 S10,S10,S14   ;w1 * x1 
		VMUL.F32 S11,S11,S15   ;w2 * x2
		VMUL.F32 S12,S12,S16   ;bias * bias input
		
		VADD.F32 S3,S3,S10	   ;(w0 * x0) + (w1 * x1)
		VADD.F32 S11,S11,S12   ;(w2 * x2) + (bias * bias input)
		
		VADD.F32 S6,S3,S11	   ;(w0 * x0) + (w1 * x1) + (w2 * x2) + (bias * bias input) = x
		
		BL SIGMOID 
		;R0,S9 --> 1/(1 + e^-x)
		VCMP.F32 S9,S17			;compare output with 0.5
		VMRS APSR_nzcv, FPSCR
		BLE ZEROAND				;if output is less than 0.5 the we equate output to 0
		B ONEAND				;if output is greater than 0.5 the we equate output to 1
ZEROAND	MOV R3,#0		
		B NEXTAND
ONEAND	MOV R3,#1
		B NEXTAND
		
NEXTAND	BL printMsgand			;print values
		CMP R7,#4
		BLT NEXTINPAND
		B LOGIC_OR


LOGIC_OR MOV R7,#0
NEXTINPOR	BL INPUTS
		ADD R7,R7,#1
		VLDR.F32 S3,=-0.1      ;w0
		VLDR.F32 S10,=0.7	   ;w1	
		VLDR.F32 S11,=0.7	   ;w2
		VLDR.F32 S12,=-0.1	   ;bias
		VMOV.F32 S13,R0
		VMOV.F32 S14,R1
		VMOV.F32 S15,R2
		VCVT.F32.S32 S13,S13		   ;x0 --> input 0
		VCVT.F32.S32 S14,S14		   ;x1 --> input 1
		VCVT.F32.S32 S15,S15		   ;x2 --> input 2
		VLDR.F32 S16,=1		   ;bias --> '1'
		
		VMUL.F32 S3,S3,S13	   ;w0 * x0
		VMUL.F32 S10,S10,S14   ;w1 * x1 
		VMUL.F32 S11,S11,S15   ;w2 * x2
		VMUL.F32 S12,S12,S16   ;bias * bias input
		
		VADD.F32 S3,S3,S10	   ;(w0 * x0) + (w1 * x1)
		VADD.F32 S11,S11,S12   ;(w2 * x2) + (bias * bias input)
		
		VADD.F32 S6,S3,S11	   ;(w0 * x0) + (w1 * x1) + (w2 * x2) + (bias * bias input) = x
		
		BL SIGMOID 
		;R0,S9 --> 1/(1 + e^-x)
		VCMP.F32 S9,S17
		VMRS APSR_nzcv, FPSCR
		BLE ZEROOR
		B ONEOR
ZEROOR	MOV R3,#0
		B NEXTOR
;		BL printMsg
ONEOR		MOV R3,#1
;		BL printMsg
		B NEXTOR
		
NEXTOR	BL printMsgor
		CMP R7,#4
		BLT NEXTINPOR
		B LOGIC_NOT
		
LOGIC_NOT MOV R7,#0
NEXTINPNOT	BL INPUTSNOT
		ADD R7,R7,#1
		VLDR.F32 S3,=0.5      ;w0
		VLDR.F32 S10,=0.5	   ;w1	
		VLDR.F32 S11,=-0.7	   ;w2
		VLDR.F32 S12,=0.1	   ;bias
		VMOV.F32 S13,R0
		VMOV.F32 S14,R1
		VMOV.F32 S15,R2
		VCVT.F32.S32 S13,S13		   ;x0 --> input 0
		VCVT.F32.S32 S14,S14		   ;x1 --> input 1
		VCVT.F32.S32 S15,S15		   ;x2 --> input 2
		VLDR.F32 S16,=1		   ;bias --> '1'
		
		VMUL.F32 S3,S3,S13	   ;w0 * x0
		VMUL.F32 S10,S10,S14   ;w1 * x1 
		VMUL.F32 S11,S11,S15   ;w2 * x2
		VMUL.F32 S12,S12,S16   ;bias * bias input
		
		VADD.F32 S3,S3,S10	   ;(w0 * x0) + (w1 * x1)
		VADD.F32 S11,S11,S12   ;(w2 * x2) + (bias * bias input)
		
		VADD.F32 S6,S3,S11	   ;(w0 * x0) + (w1 * x1) + (w2 * x2) + (bias * bias input) = x
		
		BL SIGMOID 
		;R0,S9 --> 1/(1 + e^-x)
		VCMP.F32 S9,S17
		VMRS APSR_nzcv, FPSCR
		BLE ZERONOT
		B ONENOT
ZERONOT	MOV R3,#0
		B NEXTNOT
;		BL printMsg
ONENOT	MOV R3,#1
;		BL printMsg
		B NEXTNOT
		
NEXTNOT	BL printMsgnot
		CMP R7,#2
		BLT NEXTINPNOT
		B LOGIC_NAND	
		
		

;CHECK	CMP R8,#3
;		BEQ LOGIC_NAND
;		CMP R8,#4
;		BEQ LOGIC_NOR
ZERO	MOV R3,#5
;		BL printMsg
ONE		MOV R3,#5
;		BL printMsg
	
LOGIC_NAND MOV R7,#0
NEXTINPNAND	BL INPUTS
		ADD R7,R7,#1
		VLDR.F32 S3,=0.6      ;w0
		VLDR.F32 S10,=-0.8	   ;w1	
		VLDR.F32 S11,=-0.8	   ;w2
		VLDR.F32 S12,=0.3	   ;bias
		VMOV.F32 S13,R0
		VMOV.F32 S14,R1
		VMOV.F32 S15,R2
		VCVT.F32.S32 S13,S13		   ;x0 --> input 0
		VCVT.F32.S32 S14,S14		   ;x1 --> input 1
		VCVT.F32.S32 S15,S15		   ;x2 --> input 2
		VLDR.F32 S16,=1		   ;bias --> '1'
		
		VMUL.F32 S3,S3,S13	   ;w0 * x0
		VMUL.F32 S10,S10,S14   ;w1 * x1 
		VMUL.F32 S11,S11,S15   ;w2 * x2
		VMUL.F32 S12,S12,S16   ;bias * bias input
		
		VADD.F32 S3,S3,S10	   ;(w0 * x0) + (w1 * x1)
		VADD.F32 S11,S11,S12   ;(w2 * x2) + (bias * bias input)
		
		VADD.F32 S6,S3,S11	   ;(w0 * x0) + (w1 * x1) + (w2 * x2) + (bias * bias input) = x
		
		BL SIGMOID 
		;R0,S9 --> 1/(1 + e^-x)
		VCMP.F32 S9,S17
		VMRS APSR_nzcv, FPSCR
		BLE ZERONAND
		B ONENAND
ZERONAND	MOV R3,#0
		B NEXTNAND
;		BL printMsg
ONENAND		MOV R3,#1
;		BL printMsg
		B NEXTNAND
		
NEXTNAND	BL printMsgnand
		CMP R7,#4
		BLT NEXTINPNAND
		B LOGIC_NOR

LOGIC_NOR MOV R7,#0
NEXTINPNOR	BL INPUTS
		ADD R7,R7,#1
		VLDR.F32 S3,=0.5      ;w0
		VLDR.F32 S10,=-0.7	   ;w1	
		VLDR.F32 S11,=-0.7	   ;w2
		VLDR.F32 S12,=0.1	   ;bias
		VMOV.F32 S13,R0
		VMOV.F32 S14,R1
		VMOV.F32 S15,R2
		VCVT.F32.S32 S13,S13		   ;x0 --> input 0
		VCVT.F32.S32 S14,S14		   ;x1 --> input 1
		VCVT.F32.S32 S15,S15		   ;x2 --> input 2
		VLDR.F32 S16,=1		   ;bias --> '1'
		
		VMUL.F32 S3,S3,S13	   ;w0 * x0
		VMUL.F32 S10,S10,S14   ;w1 * x1 
		VMUL.F32 S11,S11,S15   ;w2 * x2
		VMUL.F32 S12,S12,S16   ;bias * bias input
		
		VADD.F32 S3,S3,S10	   ;(w0 * x0) + (w1 * x1)
		VADD.F32 S11,S11,S12   ;(w2 * x2) + (bias * bias input)
		
		VADD.F32 S6,S3,S11	   ;(w0 * x0) + (w1 * x1) + (w2 * x2) + (bias * bias input) = x
		
		BL SIGMOID 
		;R0,S9 --> 1/(1 + e^-x)
		VCMP.F32 S9,S17
		VMRS APSR_nzcv, FPSCR
		BLE ZERONOR
		B ONENOR
ZERONOR	MOV R3,#0
		B NEXTNOR
;		BL printMsg
ONENOR	MOV R3,#1
;		BL printMsg
		B NEXTNOR
		
NEXTNOR	BL printMsgnor
		CMP R7,#4
		BLT NEXTINPNOR
		B stop
		

stop    B stop


;subRoutine 1
INPUTS  PUSH {R8,LR}		;subroutine to take inputs
		CMP R7,#0
		BEQ INP0
		CMP R7,#1
		BEQ INP1
		CMP R7,#2
		BEQ INP2
		CMP R7,#3
		BEQ INP3

INP0    MOV R0,#1			;1st set of inputs
		MOV R1,#0
		MOV R2,#0
		B BAC
		
INP1    MOV R0,#1			;2nd set of inputs
		MOV R1,#0
		MOV R2,#1
		B BAC

INP2    MOV R0,#1			;3rd set of inputs
		MOV R1,#1
		MOV R2,#0
		B BAC

INP3    MOV R0,#1			;4th set of inputs
		MOV R1,#1
		MOV R2,#1
		B BAC
		
BAC		SUB LR, #0x01
		POP {R6,PC}
		BX LR
		
;subRoutine 2
INPUTSNOT  PUSH {R10,LR}	;subroutine to take inputs for not gate
		CMP R7,#0
		BEQ INPNOT0
		CMP R7,#1
		BEQ INPNOT1

INPNOT0 MOV R0,#1			;1st set of inputs
		MOV R1,#0
		MOV R2,#0
		B BACNOT
		
INPNOT1 MOV R0,#1			;2nd set of inputs
		MOV R1,#0
		MOV R2,#1
		B BACNOT
		
BACNOT		SUB LR, #0x01
		POP {R10,PC}
		BX LR		

;subRoutine 3
SIGMOID	PUSH {R6,LR}
		BL EXP		
		VLDR.F32 S7,=1			;1
		VADD.F32 S8,S7,S0		;1 + e^-x
		VDIV.F32 S9,S7,S8		;1/(1 + e^-x)
		
		;S6 --> x
		;S0 --> e^-x
		;S9 --> 1/(1 + e^-x)

		SUB LR, #0x01
		POP {R6,PC}
		BX LR
		
		
;subRoutine 4
EXP		PUSH {R5,LR}
		VLDR.F32 S5,=-1			;-1
		VMUL.F32 S2,S6,S5		;To convert x --> -x
		MOV R9,#6 				;Number of Terms in Series 'n'
        MOV R4,#1  				;Counting Variable 'i'
        VLDR.F32 S0,=1			;Final answer
        VLDR.F32 S1,=1			;Temp variable 'temp'        

LOOP    CMP R4,R9				;Compare 'i' and 'n' 
        BLE LOOP1				;if i < n goto LOOP
        B subRo
		
subRo	SUB LR, #0x01
		POP {R5,PC}
		BX LR

LOOP1   VMUL.F32 S1,S1,S2		;temp = temp*-x
        VMOV.F32 S4,R4			;Move the value in R4 i.e i to S4
        VCVT.F32.S32 S4, S4		;Converting int to floating point
        VDIV.F32 S1,S1,S4		;temp = temp/ i
        VADD.F32 S0,S0,S1		;Final answer = Final answer + temp
        ADD R4,R4,#1			;i = i + 1
        B LOOP					;To LOOP
        ENDFUNC
        END
