%{
  #include <stdio.h>
  #include "asin.h"
%}

%option yylineno

delimitador [ \t\n]+
letra [a-zA-Z]
digito [0-9]
constante {digito}+
identificador {letra}({letra}|{digito}|_)*
comentario  [\/\/].*[\n]

%%

{delimitador} {}
read {visualizar("READ_");return(READ_);}
print {visualizar("PRINT_");return(PRINT_);}

true {visualizar("TRUE_");return(TRUE_);}
false {visualizar("FALSE_");return(FALSE_);}

do {visualizar("DO_");return(DO_);}
while {visualizar("WHILE_");return(WHILE_);}

if {visualizar("IF_");return(IF_);}
else {visualizar("ELSE_");return(ELSE_);}
elseif {visualizar("ELSEIF_");return(ELSEIF_);}

bool {visualizar("BOOL_");return(BOOL_);}
int {visualizar("INT_");return(INT_);}

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
[-]{identificador} {visualizar("OPNEGA_");return(OPNEGA_);}
[+]{identificador} {visualizar("OPPOSI_");return(OPPOSI_);}

"+" {visualizar("OPSUMA_");return(OPSUMA_);}
"-" {visualizar("OPSUB_");return(OPSUB_);}
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
{constante} {visualizar("CTE_");return(CTE_);}
{comentario} {}
{identificador} {visualizar("ID_");return(ID_);}
. {}

%%

void visualizar(char* texto) {
  printf("%3d-%s %s\n", yylineno, texto, yytext);
}


