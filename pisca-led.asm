;Utilize dois botoes eum led.Um desse botoes ira ser contado, 
;isto ?, uC contara quantas vezes ele foi pressionado.
;O segundo botao ira fazer o led piscar. O led ira piscar 
;pelo mesmo numero de vezes que o outro botao foi pressionado.
;Se o outro botao foi precionado 8x entao ao apertar o  segundo 
;o led devera piscar 8x
;*********************************************************
;TDM2-14/10/2020
;**********************************************************
;Defini?oes de variaveis 
Bt1  bit p3.2
Bt2  bit p3.3
led  bit p1.0
;************************************************************
         org 00H           ;inicia no endere?o de memoria ooh
		 jmp ini           ;salta para o rotulo ini 
;**********************************************************
         org 0003H         ;inicia no endere?o de memoria 003h 
		 jmp conta 	       ;salta para p rotulo conta, interrup?ao 0
;********************************************************
         org 0013h         ;inica no endere?o de memoria 0013h			 
		 jmp faz           ;salta para o rotulo faz interrup?ao 1
ini:
         mov tcon,#05h     ;programa as interrup?oes por borda 
		 mov ie,#85h       ;habilita as interrup?oes ext 0e1
		 jmp $             ;aguarda interrup?ao           
;***************************************************************
conta:
         inc a             ;contar o n? Bt1
		 reti              ;retorno de interrup?ao 
faz:
         cpl led 
		 call tempo 
		 cpl led           ;led vai estar piscando 
		 call tempo
		 dec a 
		 cjne a,#00h       ;compara e salta se for igual a 0
         reti		       ;retotna para o programa principal

tempo:                     
         mov r0,#255       ;rotina de gastar tempo 
tt0:
         mov r1,#255
tt1:
         mov r2,#200
		 djnz r2,$
		 djnz r1,tt1
         djnz r0,tt0
         ret
         end 	