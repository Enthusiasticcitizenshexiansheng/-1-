Stack_size EQU 0x200

    AREA STACK, NOINIT,READWRITE,ALIGN=3  ;
                  ;// ?    ????? ????    ????2^3=8
 

    SPACE  Stack_size;//??? ?????
__init_msp  ;  //???? ????

; IMPORT main
PRESERVE8  ;
THUMB        ;


      AREA RESET,DATA,READONLY
         ;cortex M4        //?????
         ;__Vecors[0]  //����ջ��ַ
          ;__Vecors[1]   //��һ��ָ���ַ

__Vectors
    DCD __init_msp ;               //__Vecors[0]  <-  __init_msp
    DCD __start      ;
    SPACE  0x400   ;              ??????
;







;//�������������
         AREA     |.text| ,CODE,READONLY      ;       ????
__start  PROC                                             ;  ??????????

 ;��������
        ;1-100�ۼ� 
       ;MOV  R0,#0;        s=0
     ;  MOV R1,#1;         i=1
;_for_i
      ; CMP       R1,#100
      ;  BGT      _end_for_i   ;//���ھ�ת��
      ;  ADD     R0,R0,R1 ;        S+=i
      ;  ADD     R1,R1,#1;         i++
       ;  B        _for_i
;_end_for_i




;100-200�ۼ�
       MOV  R0,#100;        
       MOV R1,#200;         
       BL SUM


__wait
       	B      __wait;

    ENDP

SUM
       PUSH {R4-R12,LR};
       MOV R4 ,#0            ;s=0
	   MOV R5 ,R0	   ;i=100
_sum_for_i
	   CMP R5 ,R1             ;i<=b
	   BGT _sum_end_for_i
	   ADD R4,R4,R5
	   ADD R5,R5,#1
	   B _sum_for_i
_sum_end_for_i
  MOV R0 ,R4
        POP {R4-R12,PC};
    ENDP
 END

          

