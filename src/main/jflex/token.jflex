%%
%public
%class LexScanner

%type Token

%init{
 /* Código que se ejecutará en el constructor de la clase */
%init}

/* Inicio de Expresiones regulares */

  DEC_LITERAL = [-]?[1-9][0-9]*
  OCTAL_LITERAL = [-]?0[0-7]*
  HEX_LITERAL = [-]?0[xX][0-9a-fA-F]+
  DOUBLE_LITERAL = [-]?[0-9]+.[0-9]+

  NEW_LINE = \n|\r\n

  //Corregir
  BLOCK_COMMENT = [/*].*[NEW_LINE]*[*/]

  LINE_COMMENT = [//].*

  

  Digito = [0-9]
  Letra = [A-Za-z]
  Reservada = "auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"|"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"|"int"|"long"|"register"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while"
  Variable = [A-Za-z_]([a-zA-Z0-9_])*
  Espacio = " "


/* Finaliza expresiones regulares */

%%
/* Finaliza la sección de declaraciones de JFlex */

/* Inicia sección de reglas */

// Cada regla está formada por una {expresión} espacio {código}

{BLOCK_COMMENT} {
  Token t = new Token("COMENTARIO BLOQUE", yytext(), 1);
  return t;
}

{LINE_COMMENT} {
  Token t = new Token("COMENTARIO LINEA", yytext(), 1);
  return t;
}



{Reservada} {
  Token t = new Token("RESERVADA", yytext(), 1);
  return t;
}

{Variable} {
  Token t = new Token("VARIABLE", yytext(), 1);
  return t;
}

{Espacio} {
  // Ignorar cuando se ingrese un espacio
}

//*********************************SALTO DE LINEA********************************* 
{NEW_LINE} { }

//*********************************NUMEROS********************************* 
{DEC_LITERAL} {
  Token t = new Token("DECIMAL", yytext(), 1);
  return t;
}

{OCTAL_LITERAL} {
  Token t = new Token("OCTAL", yytext(), 1);
  return t;
}

{HEX_LITERAL} {
  Token t = new Token("HEXADECIMAL", yytext(), 1);
  return t;
}

{DOUBLE_LITERAL} {
  Token t = new Token("DOUBLE", yytext(), 1);
  return t;
} 

//*********************************OPERADORES********************************* 
\, {
  Token t = new Token("OPERADOR COMA", yytext(), 1);
  return t;
}

\; {
  Token t = new Token("OPERADOR PUNTO Y COMA", yytext(), 1);
  return t;
}

\+\+ {
  Token t = new Token("OPERADOR SUMA 1", yytext(), 1);
  return t;
}

\-\- {
  Token t = new Token("OPERADOR RESTA 1", yytext(), 1);
  return t;
}

\=\= {
  Token t = new Token("OPERADOR COMPARACION", yytext(), 1);
  return t;
}

\>\= {
  Token t = new Token("OPERADOR MAYOR O IGUAL", yytext(), 1);
  return t;
}

\> {
  Token t = new Token("OPERADOR MAYOR", yytext(), 1);
  return t;
}

\? {
  Token t = new Token("OPERADOR", yytext(), 1);
  return t;
}

\<\= {
  Token t = new Token("OPERADOR MENOR O IGUAL", yytext(), 1);
  return t;
}

\< {
  Token t = new Token("OPERADOR MENOR", yytext(), 1);
  return t;
}

\!\= {
  Token t = new Token("OPERADOR DIFERENTE", yytext(), 1);
  return t;
}

\|\| {
  Token t = new Token("OPERADOR", yytext(), 1);
  return t;
}

\&\& {
  Token t = new Token("OPERADOR", yytext(), 1);
  return t;
}

\! {
  Token t = new Token("OPERADOR NOT", yytext(), 1);
  return t;
}

\= {
  Token t = new Token("OPERADOR IGUAL", yytext(), 1);
  return t;
}

\+ {
  Token t = new Token("OPERADOR SUMA", yytext(), 1);
  return t;
}

\- {
  Token t = new Token("OPERADOR RESTA", yytext(), 1);
  return t;
}

\* {
  Token t = new Token("OPERADOR MULTIPLICACION", yytext(), 1);
  return t;
}

\/ {
  Token t = new Token("OPERADOR", yytext(), 1);
  return t;
}

\% {
  Token t = new Token("OPERADOR", yytext(), 1);
  return t;
}

\( {
  Token t = new Token("OPERADOR PARENTESIS ABIERTO", yytext(), 1);
  return t;
}

\) {
  Token t = new Token("OPERADOR PARTENTESIS CERRADO", yytext(), 1);
  return t;
}

\[ {
  Token t = new Token("OPERADOR CORCHETE ABIERTO", yytext(), 1);
  return t;
}

\] {
  Token t = new Token("OPERADOR CORCHETE CERRADO", yytext(), 1);
  return t;
}

\{ {
  Token t = new Token("OPERADOR LLAVE ABIERTA", yytext(), 1);
  return t;
}

\} {
  Token t = new Token("OPERADOR LLAVE CERRADA", yytext(), 1);
  return t;
}

\: {
  Token t = new Token("OPERADOR DOS PUNTOS", yytext(), 1);
  return t;
}

\. {
  Token t = new Token("OPERADOR PUNTO", yytext(), 1);
  return t;
}

\+\= {
  Token t = new Token("OPERADOR MAS IGUAL", yytext(), 1);
  return t;
}

\-\= {
  Token t = new Token("OPERADOR MENOS IGUAL", yytext(), 1);
  return t;
}

\*\= {
  Token t = new Token("OPERADOR POR IGUAL", yytext(), 1);
  return t;
}

\/\= {
  Token t = new Token("OPERADOR", yytext(), 1);
  return t;
}

\& {
  Token t = new Token("OPERADOR AMPERSON", yytext(), 1);
  return t;
}

\^ {
  Token t = new Token("OPERADOR", yytext(), 1);
  return t;
}

\| {
  Token t = new Token("OPERADOR OR", yytext(), 1);
  return t;
}

\>\> {
  Token t = new Token("OPERADOR", yytext(), 1);
  return t;
}

\<\< {
  Token t = new Token("OPERADOR", yytext(), 1);
  return t;
}

\~ {
  Token t = new Token("OPERADOR", yytext(), 1);
  return t;
}

\%\= {
  Token t = new Token("OPERADOR", yytext(), 1);
  return t;
}

\&\= {
  Token t = new Token("OPERADOR", yytext(), 1);
  return t;
}

\^\= {
  Token t = new Token("OPERADOR", yytext(), 1);
  return t;
}

\|\= {
  Token t = new Token("OPERADOR", yytext(), 1);
  return t;
}

\<\<\= {
  Token t = new Token("OPERADOR", yytext(), 1);
  return t;
}

\>\>\= {
  Token t = new Token("OPERADOR", yytext(), 1);
  return t;
}

\-\> {
  Token t = new Token("OPERADOR", yytext(), 1);
  return t;
}

//Error
. {
  Token t = new Token("ERROR", yytext(), 1);
  return t;
}


<<EOF>> {
  return null;
}

