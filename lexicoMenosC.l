%{
  #include <stdio.h>
  void visualizar(char* texto);
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
read {visualizar("palabra reservada:");}
print {visualizar("palabra reservada:");}
TRUE {visualizar("palabra reservada:");}
FALSE {visualizar("palabra reservada:");}
for {visualizar("palabra reservada:");}
if {visualizar("palabra reservada:");}
else {visualizar("palabra reservada:");}
char {visualizar("palabra reservada:");}
int {visualizar("palabra reservada:");}
"=" {visualizar("operador:");}
">" {visualizar("operador:");}
"<" {visualizar("operador:");}
"<=" {visualizar("operador:");}
">=" {visualizar("operador:");}
"+" {visualizar("operador:");}
"++" {visualizar("operador:");}
"-" {visualizar("operador:");}
"--" {visualizar("operador:");}
"*" {visualizar("operador:");}
"/" {visualizar("operador:");}
"%" {visualizar("operador:");}
"(" {visualizar("delimitador:");}
")" {visualizar("delimitador:");}
"}" {visualizar("delimitador:");}
"," {visualizar("delimitador:");}
";" {visualizar("delimitador:");}
{constante} {visualizar("constante:");}
{comentario} {visualizar("comentario:");}
{identificador} {visualizar("identificador:");}
. {visualizar("caracter invalido:");}

%%

void visualizar(char* texto) {
  printf("%3d-%s %s\n", yylineno, texto, yytext);
}

int main (int argc, char **argv) {
  if (argc!=2 || (yyin = fopen (argv[1], "r")) == NULL){
    fprintf (stderr, "Uso: %s <fichero>\n",argv[0]);
    return(1);
  }
  yylex();
}
