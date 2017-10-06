%{
%}

%token IF_ ELSE_ ELSEIF_ WHILE_ DO_ 
%token READ_ PRINT_ OPASIG_ OPSUMA_ OPMULT_ OPSUB_ OPDIV_
%token PARENTA_ PARENTC_ FININS_ CORCHA_ CORCHC_ LLAVEA_ LLAVEC_
%token INT_ BOOL_ CTE_ ID_

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






