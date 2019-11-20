     AREA     appcode, CODE, READONLY
     IMPORT printMsg
	 EXPORT __main
     ENTRY 
__main  FUNCTION	
; IGNORE THIS PART 	

		MOV R7,#3				;Cases to different logic
		MOV R8,R7
		VLDR.F32 S17,=0.5
		CMP R7,#0
		BEQ LOGIC_AND
		CMP R7,#1
		BEQ LOGIC_OR
		CMP R7,#2
		BEQ LOGIC_NOT
		B CHECK
		

ZERO	MOV R0,#0
		BL printMsg
		B stop
		
ONE		MOV R0,#1
		BL printMsg
		B stop
		
LOGIC_AND VLDR.F32 S3,=-1      ;w0
		VLDR.F32 S10,=0.2	   ;w1	
		VLDR.F32 S11,=0.2	   ;w2
		VLDR.F32 S12,=-0.2	   ;bias
		
		VLDR.F32 S13,=1		   ;x0 --> input 0
		VLDR.F32 S14,=0		   ;x1 --> input 1
		VLDR.F32 S15,=0		   ;x2 --> input 2
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
		BLE ZERO
		B ONE

LOGIC_OR VLDR.F32 S3,=-1      ;w0
		VLDR.F32 S10,=0.7	   ;w1	
		VLDR.F32 S11,=0.7	   ;w2
		VLDR.F32 S12,=-0.1	   ;bias
		
		VLDR.F32 S13,=1		   ;x0 --> input 0
		VLDR.F32 S14,=0		   ;x1 --> input 1
		VLDR.F32 S15,=1		   ;x2 --> input 2
		VLDR.F32 S16,=1		   ;bias --> '1'
		
		VMUL.F32 S3,S3,S13	   ;w0 * x0
		VMUL.F32 S10,S10,S14   ;w1 * x1 
		VMUL.F32 S11,S11,S15   ;w2 * x2
		VMUL.F32 S12,S12,S16   ;bias * bias input
		
		VADD.F32 S3,S3,S10	   ;(w0 * x0) + (w1 * x1)
		VADD.F32 S11,S11,S15   ;(w2 * x2) + (bias * bias input)
		
		VADD.F32 S6,S3,S11	   ;(w0 * x0) + (w1 * x1) + (w2 * x2) + (bias * bias input) = x
		
		BL SIGMOID 
		;R0,S9 --> 1/(1 + e^-x)
		VCMP.F32 S9,S17
		VMRS APSR_nzcv, FPSCR
		BLE ZERO
		B ONE
		
LOGIC_NOT VLDR.F32 S3,=0.5      ;w0
		VLDR.F32 S10,=-0.7	   ;w1	
		VLDR.F32 S12,=0.1	   ;bias
		
		VLDR.F32 S13,=1		   ;x0 --> input 0
		VLDR.F32 S16,=1		   ;bias --> '1'
		
		VMUL.F32 S3,S3,S13	   ;w0 * x0
		VMUL.F32 S10,S10,S16   ;w1 * '1' 
		VMUL.F32 S12,S12,S16   ;bias * bias input
		
		VADD.F32 S3,S3,S10	   ;(w0 * x0) + (w1 * '1')
		VADD.F32 S6,S3,S12	   ;(w0 * x0) + (w1 * '1') + (bias * bias input) = x
		
		BL SIGMOID 
		;R0,S9 --> 1/(1 + e^-x)
		VCMP.F32 S9,S17
		VMRS APSR_nzcv, FPSCR
		BLE ZERO
		B ONE

CHECK	CMP R8,#3
		BEQ LOGIC_NAND
		CMP R8,#4
		BEQ LOGIC_NOR

LOGIC_NAND VLDR.F32 S3,=0.6      ;w0
		VLDR.F32 S10,=-0.8	   ;w1	
		VLDR.F32 S11,=-0.8	   ;w2
		VLDR.F32 S12,=0.3	   ;bias
		
		VLDR.F32 S13,=1		   ;x0 --> input 0
		VLDR.F32 S14,=1		   ;x1 --> input 1
		VLDR.F32 S15,=0		   ;x2 --> input 2
		VLDR.F32 S16,=1		   ;bias --> '1'
		
		VMUL.F32 S3,S3,S13	   ;w0 * x0
		VMUL.F32 S10,S10,S14   ;w1 * x1 
		VMUL.F32 S11,S11,S15   ;w2 * x2
		VMUL.F32 S12,S12,S16   ;bias * bias input
		
		VADD.F32 S3,S3,S10	   ;(w0 * x0) + (w1 * x1)
		VADD.F32 S11,S11,S15   ;(w2 * x2) + (bias * bias input)
		
		VADD.F32 S6,S3,S11	   ;(w0 * x0) + (w1 * x1) + (w2 * x2) + (bias * bias input) = x
		
		BL SIGMOID 
		;R0,S9 --> 1/(1 + e^-x)
		VCMP.F32 S9,S17
		VMRS APSR_nzcv, FPSCR
		BLE ZERO
		B ONE

LOGIC_NOR VLDR.F32 S3,=0.5      ;w0
		VLDR.F32 S10,=-0.7	   ;w1	
		VLDR.F32 S11,=-0.7	   ;w2
		VLDR.F32 S12,=0.1	   ;bias
		
		VLDR.F32 S13,=1		   ;x0 --> input 0
		VLDR.F32 S14,=1		   ;x1 --> input 1
		VLDR.F32 S15,=1		   ;x2 --> input 2
		VLDR.F32 S16,=1		   ;bias --> '1'
		
		VMUL.F32 S3,S3,S13	   ;w0 * x0
		VMUL.F32 S10,S10,S14   ;w1 * x1 
		VMUL.F32 S11,S11,S15   ;w2 * x2
		VMUL.F32 S12,S12,S16   ;bias * bias input
		
		VADD.F32 S3,S3,S10	   ;(w0 * x0) + (w1 * x1)
		VADD.F32 S11,S11,S15   ;(w2 * x2) + (bias * bias input)
		
		VADD.F32 S6,S3,S11	   ;(w0 * x0) + (w1 * x1) + (w2 * x2) + (bias * bias input) = x
		
		BL SIGMOID 
		;R0,S9 --> 1/(1 + e^-x)
		VCMP.F32 S9,S17
		VMRS APSR_nzcv, FPSCR
		BLE ZERO
		B ONE		

stop    B stop

;subRoutine 1
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
		
		
;subRoutine 2
EXP		PUSH {R2,LR}
		VLDR.F32 S5,=-1			;-1
		VMUL.F32 S2,S6,S5		;To convert x --> -x
		MOV R3,#10 				;Number of Terms in Series 'n'
        MOV R4,#1  				;Counting Variable 'i'
        VLDR.F32 S0,=1			;Final answer
        VLDR.F32 S1,=1			;Temp variable 'temp'        

LOOP    CMP R4,R3				;Compare 'i' and 'n' 
        BLE LOOP1				;if i < n goto LOOP
        B subRo
		
subRo	SUB LR, #0x01
		POP {R2,PC}
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