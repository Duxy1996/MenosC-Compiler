%{
  #include <stdio.h>
  #include "asin.h"
  extern FILE *yyin;
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

"=" {return(OPASI_);}
"+=" {return(OPASIADD_);}
"-=" {return(OPASISUB_);}
"*=" {return(OPASIMUL_);}
"/=" {return(OPASIDIV_);}

">" {return(MAYOR_);}
"<" {return(MENOR_);}
"<=" {return(MEIG_);}
">=" {return(MAIG_);}
"==" {return(IGU_);}
"!=" {return(DIF_);}

"++" {return(OPINCR_);}
"--" {return(OPDECR_);}

"&&" {return(AND_);}
"||" {return(OR_);}

"!" {return(OPNOT_);}
[-]{identificador} {return(OPNEGA_);}
[+]{identificador} {return(OPPOSI_);}

"+" {return(OPSUMA_);}
"-" {return(OPSUB_);}
"*" {return(OPMULT_);}
"/" {return(OPDIV_);}
"%" {return(OPMOD_);}

"(" {return(PARENTA_);}
")" {return(PARENTC_);}
"[" {return(CORCHA_);}
"]" {return(CORCHC_);}
"{" {return(LLAVEA_);}
"}" {return(LLAVEC_);}
";" {return(FININS_);}
{constante} {return(CTE_);}
{comentario} {}
{identificador} {return(ID_);}
. {}

%%

int verbosidad=0;               /* Flag para saber si se desea una traza */
int numErrores=0;                   /* Contador del numero de errores        */
/*****************************************************************************/
void yyerror(const char * msg)
/*  Tratamiento de errores.                                                  */
{
  numErrores++;
  fprintf(stdout, "\nError at line %d: %s\n", yylineno, msg);
}
/*****************************************************************************/
int main (int argc, char **argv) 
/* Gestiona la linea de comandos e invoca al analizador sintactico-semantico.*/
{ int i, n = 0;

  for (i=0; i<argc; ++i) { 
    if (strcmp(argv[i], "-v")==0) { verbosidad = 1; n++; }
  }
  --argc; n++;
  if (argc == n) {
    if ((yyin = fopen (argv[argc], "r")) == NULL)
      fprintf (stderr, "Fichero no valido %s\n", argv[argc]);      
    else {        
      if (verbosidad == 1) fprintf(stdout,"%3d.- ", yylineno);
      yyparse ();
      if (numErrores > 0) 
        fprintf(stdout,"\nNumero de errores:      %d\n", numErrores);
    }   
  }
  else fprintf (stderr, "Uso: cmc [-v] fichero\n");
} 
