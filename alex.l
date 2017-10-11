%{
  #include <stdio.h>
  #include "asin.h"
  void visualizar(char* texto);
  extern int verbosidad;
%}

%option yylineno

delimitador [ \t\n]+
letra [a-zA-Z]
digito [0-9]
constante {digito}+
identificador {letra}({letra}|{digito}|_)*

%%

{delimitador} {}
read {return(READ_);}
print {return(PRINT_);}

true {return(TRUE_);}
false {return(FALSE_);}

do {return(DO_);}
while {return(WHILE_);}

if {return(IF_);}
else {return(ELSE_);}
elseif {return(ELSEIF_);}

bool {return(BOOL_);}
int {return(INT_);}
"=" {visualizar("OPASI_");return(OPASI_);}
"+=" {visualizar("OPASIADD_");return(OPASIADD_);}
"-=" {visualizar("OPASISUB_");return(OPASISUB_);}
"*=" {visualizar("OPASIMUL_");return(OPASIMUL_);}
"/=" {visualizar("OPASIDIV_");return(OPASIDIV_);}

">" {visualizar("MAYOR_");return(MAYOR_);}
"<" {visualizar("MENOR_");return(MENOR_);}
"<=" {visualizar("MEIG_");return(MEIG_);}
">=" {visualizar("MAIG_");return(MAIG_);}
"==" {visualizar("IGU_");return(IGU_);}
"!=" {visualizar("DIF_");return(DIF_);}

"++" {visualizar("OPINCR_");return(OPINCR_);}
"--" {visualizar("OPDECR_");return(OPDECR_);}

"&&" {visualizar("AND_");return(AND_);}
"||" {visualizar("OR_");return(OR_);}

"!" {visualizar("OPNOT_");return(OPNOT_);}

"+" {visualizar("+");return(OPMAS_);}
"-" {visualizar("-");return(OPMENOS_);}
"*" {visualizar("OPMULT_");return(OPMULT_);}
"/" {visualizar("OPDIV_");return(OPDIV_);}
"%" {visualizar("OPMOD_");return(OPMOD_);}

"(" {visualizar("PARENTA_");return(PARENTA_);}
")" {visualizar("PARENTC_");return(PARENTC_);}
"[" {visualizar("CORCHA_");return(CORCHA_);}
"]" {visualizar("CORCHC_");return(CORCHC_);}
"{" {visualizar("LLAVEA_");return(LLAVEA_);}
"}" {visualizar("LLAVEC_");return(LLAVEC_);}
";" {visualizar("FININS_");return(FININS_);}
"//".* {}
{constante} {visualizar("CTE_");return(CTE_);}
{identificador} {visualizar("ID_");return(ID_);}
. {}

%%

void visualizar(char* texto) {
  if(verbosidad == 1) 
  	printf("%3d-%s %s\n", yylineno, texto, yytext);
}

