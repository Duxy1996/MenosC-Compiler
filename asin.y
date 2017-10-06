%{
#include <stdio.h>
extern int yylineno;
}%

%token IF_ ELSE_ ELSEIF_ WHILE_ DO_
%token OPPOSI_ OPNEGA_ OPNOT_ OPINCR_ OPDECR_
%token READ_ PRINT_ 
%token OPASI_ OPSUMA_ OPMULT_ OPSUB_ OPDIV_ OPMOD_
%token PARENTA_ PARENTC_ FININS_ CORCHA_ CORCHC_ LLAVEA_ LLAVEC_
%token INT_ BOOL_ CTE_ ID_ TRUE_ FALSE_

%%

programa: LLAVEA_ secuenciaSentencias LLAVEC_;

secuenciaSentencias: sentencia
                   | secuenciaSentencias sentencia
;

sentencia: declaracion
         | instruccion
;

declaracion: tipoSimple ID_ FININS_
           | tipoSimple ID_ CORCHA_ CTE_ CORCHEC_ FININS_
;

tipoSimple: INT_ 
          | BOOL_
;

instruccion: LLAVEA_ listaInstrucciones LLAVEC_
           | instruccionEntradaSalida
           | instruccionExpresion
           | instruccionSeleccion
           | instruccionIteracion
;

listaInstrucciones: listaInstrucciones instruccion
		  |
;

instruccionExpresion: expresion FININS_ 
                    | FININS_
;

instruccionEntradaSalida: READ_ PARENTA_ ID_ PARENTC_ FININS_
                        | PRINT_ PARENTA_ expresion PARENTC_ FININS_
;

instruccionSeleccion: IF_ PARENTA_ expresion PARENTC_ instruccion restoIf;

restoIf: ELSEIF_ PARENTA_ expresion PARENTC_ instruccion restoIf
       | ELSE_ instruccion
;

instruccionIteracion: WHILE_ PARENTA_ expresion PARENTC_ instruccion
                    | DO_ instruccion WHILE_ PARENTA_ expresion PARENTC_
;

expresion : expresionLogica
	  | ID_ operadorAsignacion expresion
	  | ID_ CORCHA_ expresion CORCHC_ operadorAsignacion expresion
;
	  
expresionLogica : expresionIgualdad
	        | expresionLogica operadorLogico expresionIgualdad
;
	      
expresionIgualdad : expresionRelacional
		  | expresionIgualdad operadorIgualdad expresionRelacional
;
		  
expresionRelacional : expresionAditiva
		    | expresionRelacional operadorRelacional expresionAditiva
;
		    
expresionAditiva : expresionMultiplicativa
	         | expresionAditiva operadorAditivo expresionMultiplicativa	         
;
	         
expresionMultiplicativa : expresionUnaria
			| expresionMultiplicativa operadorMultiplicativo expresionUnaria
;
			
expresionUnaria : expresionSufija 
                | operadorUnario expresionUnaria
                | operadorIncremento ID_
;
                
expresionSufija : PARENTA_ expresion PARENTC_ 
		| ID_ operadorIncremento
		| ID_ CORCHA_ expresion CORCHC_
		| ID_
		| CTE_
		| TRUE_
		| FALSE_
;
		
operadorAsignacion : OPASI_
		   | OPASIADD_
		   | OPASISUB_
		   | OPASIMUL_
		   | OPASIDIV_
;
		   
operadorLogico : AND_
	       | OR_
;
	       
operadorIgualdad : IGU_
	         | DIF_
;
	        
operadorRelacional : MAYOR_
                   | MENOR_
		   | MAIG_
		   | MEIG_
;
		 
operadorAditivo : OPSUMA_
	        | OPSUB_
;
	        
operadorMultiplicativo : OPMULT_
                       | OPDIV_
                       | OPMOD_
;
                       
operadorUnario : OPPOSI_
	       | OPNEGA_
	       | OPNOT_
;
                       
operadorIncremento : OPINCR_
                   | OPDECR_
;
%%
