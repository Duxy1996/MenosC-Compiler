%{
  #include <stdio.h>
  #include "asin.h"
  #include "header.h"
  void visualizar();
%}

%option yylineno

delimitador [ \t\n]+
letra [a-zA-Z]
digito [0-9]
constante {digito}+|{digito}*\.{digito}+
identificador {letra}({letra}|{digito}|_)*
comentario "//".*\n
%%

{comentario}    {visualizar();    }
{delimitador}   {visualizar();    }
read            {visualizar();    return(READ_);}
print           {visualizar();    return(PRINT_);}

true            {visualizar();    return(TRUE_);}
false           {visualizar();    return(FALSE_);}

do              {visualizar();    return(DO_);}
while           {visualizar();    return(WHILE_);}

if              {visualizar();    return(IF_);}
else            {visualizar();    return(ELSE_);}
elseif          {visualizar();    return(ELSEIF_);}

bool            {visualizar();    return(BOOL_);}
int             {visualizar();    return(INT_);}

"="             {visualizar();    return(OPASI_);}
"+="            {visualizar();    return(OPASIADD_);}
"-="            {visualizar();    return(OPASISUB_);}
"*="            {visualizar();    return(OPASIMUL_);}
"/="            {visualizar();    return(OPASIDIV_);}

">"             {visualizar();    return(MAYOR_);}
"<"             {visualizar();    return(MENOR_);}
"<="            {visualizar();    return(MEIG_);}
">="            {visualizar();    return(MAIG_);}
"=="            {visualizar();    return(IGU_);}
"!="            {visualizar();    return(DIF_);}

"++"            {visualizar();    return(OPINCR_);}
"--"            {visualizar();    return(OPDECR_);}

"&&"            {visualizar();    return(AND_);}
"||"            {visualizar();    return(OR_);}

"!"             {visualizar();    return(OPNOT_);}

"+"             {visualizar();    return(OPMAS_);}
"-"             {visualizar();    return(OPMENOS_);}
"*"             {visualizar();    return(OPMULT_);}
"/"             {visualizar();    return(OPDIV_);}
"%"             {visualizar();    return(OPMOD_);}

"("             {visualizar();    return(PARENTA_);}
")"             {visualizar();    return(PARENTC_);}
"["             {visualizar();    return(CORCHA_);}
"]"             {visualizar();    return(CORCHC_);}
"{"             {visualizar();    return(LLAVEA_);}
"}"             {visualizar();    return(LLAVEC_);}
";"             {visualizar();    return(FININS_);}

{constante}     {visualizar();    return(CTE_);}
{identificador} {visualizar();    return(ID_);}
. {}

%%

void visualizar() {
  if (verbosidad) ECHO;
}
