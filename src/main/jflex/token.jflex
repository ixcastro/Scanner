%%
%public
%class LexScanner

%type Token
%line
%init{
 /* Código que se ejecutará en el constructor de la clase */
%init}
  //********************EXPRESIONES REGULARES********************

  //********************LITERALES********************
  DEC_LITERAL = [-]?[1-9][0-9]*
  OCTAL_LITERAL = [-]?0[0-7]*
  HEX_LITERAL = [-]?0[xX][0-9a-fA-F]+
  DOUBLE_LITERAL = [-]?[0-9]+.[0-9]+

  CHAR_LITERAL =  '([^'\\\n]|\\.)'
  STRING_LITERAL = \"([^'\\\n]|\\.)*\"

  //********************NEW LINE********************
  NEW_LINE = \n|\r\n

  //********************BLANK_SPACE********************
  BLANK_SPACE = " "

  //********************COMMENTS********************
  BLOCK_COMMENT = [/*].*[NEW_LINE]*[*/] //CORREGIR
  LINE_COMMENT = [//].*

  //********************IDENTIFIER********************
  IDENTIFIER = [A-Za-z]([A-Za-z0-9])*

%%

//****************************************REGLAS***************************************
//*********************************PALABRAS RESERVADAS*********************************
"auto" {
  Token t = new Token("RESERVADA AUTO", yytext(), yyline);
  return t;
}

"break" {
  Token t = new Token("RESERVADA BREAK", yytext(), yyline);
  return t;
}

"case" {
  Token t = new Token("RESERVADA CASE", yytext(), yyline);
  return t;
}

"char" {
  Token t = new Token("RESERVADA CHAR", yytext(), yyline);
  return t;
}

"const" {
  Token t = new Token("RESERVADA CONST", yytext(), yyline);
  return t;
}

"continue" {
  Token t = new Token("RESERVADA CONTINUE", yytext(), yyline);
  return t;
}

"default" {
  Token t = new Token("RESERVADA DEFAULT", yytext(), yyline);
  return t;
}

"do" {
  Token t = new Token("RESERVADA DO", yytext(), yyline);
  return t;
}

"double" {
  Token t = new Token("RESERVADA DOUBLE", yytext(), yyline);
  return t;
}

"else" {
  Token t = new Token("RESERVADA ELSE", yytext(), yyline);
  return t;
}

"enum" {
  Token t = new Token("RESERVADA ENUM", yytext(), yyline);
  return t;
}

"extern" {
  Token t = new Token("RESERVADA EXTERN", yytext(), yyline);
  return t;
}

"float" {
  Token t = new Token("RESERVADA FLOAT", yytext(), yyline);
  return t;
}

"for" {
  Token t = new Token("RESERVADA FOR", yytext(), yyline);
  return t;
}

"goto" {
  Token t = new Token("RESERVADA GOTO", yytext(), yyline);
  return t;
}

"if" {
  Token t = new Token("RESERVADA IF", yytext(), yyline);
  return t;
}

"int" {
  Token t = new Token("RESERVADA INT", yytext(), yyline);
  return t;
}

"long" {
  Token t = new Token("RESERVADA LONG", yytext(), yyline);
  return t;
}

"register" {
  Token t = new Token("RESERVADA REGISTER", yytext(), yyline);
  return t;
}

"return" {
  Token t = new Token("RESERVADA RETURN", yytext(), yyline);
  return t;
}

"short" {
  Token t = new Token("RESERVADA SHORT", yytext(), yyline);
  return t;
}

"signed" {
  Token t = new Token("RESERVADA SIGNED", yytext(), yyline);
  return t;
}

"sizeof" {
  Token t = new Token("RESERVADA SIZEOF", yytext(), yyline);
  return t;
}

"static" {
  Token t = new Token("RESERVADA STATIC", yytext(), yyline);
  return t;
}

"struct" {
  Token t = new Token("RESERVADA STRUCT", yytext(), yyline);
  return t;
}

"switch" {
  Token t = new Token("RESERVADA SWITCH", yytext(), yyline);
  return t;
}

"typedef" {
  Token t = new Token("RESERVADA TYPEDEF", yytext(), yyline);
  return t;
}

"union" {
  Token t = new Token("RESERVADA UNION", yytext(), yyline);
  return t;
}

"unsigned" {
  Token t = new Token("RESERVADA UNSIGNED", yytext(), yyline);
  return t;
}

"void" {
  Token t = new Token("RESERVADA VOID", yytext(), yyline);
  return t;
}

"volatile" {
  Token t = new Token("RESERVADA VOLATILE", yytext(), yyline);
  return t;
}

"while" {
  Token t = new Token("RESERVADA WHILE", yytext(), yyline);
  return t;
}

//*********************************COMMENTS*********************************
{BLOCK_COMMENT} { } //IGNORE BLOCK COMMENTS

{LINE_COMMENT} { } //IGNORE LINE COMMENTS

//**********************************NEW LINE********************************** 
{NEW_LINE} { } //IGNORE NEW LINES

//********************************BLANK SPACE********************************* 
{BLANK_SPACE} { } //IGNORE A BLANK SPACE

//*********************************LITERALES********************************* 
{DEC_LITERAL} {
  Token t = new Token("DECIMAL", yytext(), yyline);
  return t;
}

{OCTAL_LITERAL} {
  Token t = new Token("OCTAL", yytext(), yyline);
  return t;
}

{HEX_LITERAL} {
  Token t = new Token("HEXADECIMAL", yytext(), yyline);
  return t;
}

{DOUBLE_LITERAL} {
  Token t = new Token("DOUBLE", yytext(), yyline);
  return t;
} 

{STRING_LITERAL} {
  Token t = new Token("LITERAL STRING", yytext(), yyline);
  return t;
}

{CHAR_LITERAL} {
  Token t = new Token("LITERAL CHAR", yytext(), yyline);
  return t;
}

//*********************************IDENTIFICADOR*********************************
{IDENTIFIER} {
  Token t = new Token("IDENTIFICADOR", yytext(), yyline);
  return t;
}

//*********************************OPERADORES********************************* 
\, {
  Token t = new Token("OPERADOR COMA", yytext(), yyline);
  return t;
}

\; {
  Token t = new Token("OPERADOR PUNTO Y COMA", yytext(), yyline);
  return t;
}

\+\+ {
  Token t = new Token("OPERADOR SUMA 1", yytext(), yyline);
  return t;
}

\-\- {
  Token t = new Token("OPERADOR RESTA 1", yytext(), yyline);
  return t;
}

\=\= {
  Token t = new Token("OPERADOR COMPARACION", yytext(), yyline);
  return t;
}

\>\= {
  Token t = new Token("OPERADOR MAYOR O IGUAL", yytext(), yyline);
  return t;
}

\> {
  Token t = new Token("OPERADOR MAYOR", yytext(), yyline);
  return t;
}

\? {
  Token t = new Token("OPERADOR", yytext(), yyline);
  return t;
}

\<\= {
  Token t = new Token("OPERADOR MENOR O IGUAL", yytext(), yyline);
  return t;
}

\< {
  Token t = new Token("OPERADOR MENOR", yytext(), yyline);
  return t;
}

\!\= {
  Token t = new Token("OPERADOR DIFERENTE", yytext(), yyline);
  return t;
}

\|\| {
  Token t = new Token("OPERADOR", yytext(), yyline);
  return t;
}

\&\& {
  Token t = new Token("OPERADOR", yytext(), yyline);
  return t;
}

\! {
  Token t = new Token("OPERADOR NOT", yytext(), yyline);
  return t;
}

\= {
  Token t = new Token("OPERADOR IGUAL", yytext(), yyline);
  return t;
}

\+ {
  Token t = new Token("OPERADOR SUMA", yytext(), yyline);
  return t;
}

\- {
  Token t = new Token("OPERADOR RESTA", yytext(), yyline);
  return t;
}

\* {
  Token t = new Token("OPERADOR MULTIPLICACION", yytext(), yyline);
  return t;
}

\/ {
  Token t = new Token("OPERADOR", yytext(), yyline);
  return t;
}

\% {
  Token t = new Token("OPERADOR", yytext(), yyline);
  return t;
}

\( {
  Token t = new Token("OPERADOR PARENTESIS ABIERTO", yytext(), yyline);
  return t;
}

\) {
  Token t = new Token("OPERADOR PARTENTESIS CERRADO", yytext(), yyline);
  return t;
}

\[ {
  Token t = new Token("OPERADOR CORCHETE ABIERTO", yytext(), yyline);
  return t;
}

\] {
  Token t = new Token("OPERADOR CORCHETE CERRADO", yytext(), yyline);
  return t;
}

\{ {
  Token t = new Token("OPERADOR LLAVE ABIERTA", yytext(), yyline);
  return t;
}

\} {
  Token t = new Token("OPERADOR LLAVE CERRADA", yytext(), yyline);
  return t;
}

\: {
  Token t = new Token("OPERADOR DOS PUNTOS", yytext(), yyline);
  return t;
}

\. {
  Token t = new Token("OPERADOR PUNTO", yytext(), yyline);
  return t;
}

\+\= {
  Token t = new Token("OPERADOR MAS IGUAL", yytext(), yyline);
  return t;
}

\-\= {
  Token t = new Token("OPERADOR MENOS IGUAL", yytext(), yyline);
  return t;
}

\*\= {
  Token t = new Token("OPERADOR POR IGUAL", yytext(), yyline);
  return t;
}

\/\= {
  Token t = new Token("OPERADOR", yytext(), yyline);
  return t;
}

\& {
  Token t = new Token("OPERADOR AMPERSON", yytext(), yyline);
  return t;
}

\^ {
  Token t = new Token("OPERADOR", yytext(), yyline);
  return t;
}

\| {
  Token t = new Token("OPERADOR OR", yytext(), yyline);
  return t;
}

\>\> {
  Token t = new Token("OPERADOR", yytext(), yyline);
  return t;
}

\<\< {
  Token t = new Token("OPERADOR", yytext(), yyline);
  return t;
}

\~ {
  Token t = new Token("OPERADOR", yytext(), yyline);
  return t;
}

\%\= {
  Token t = new Token("OPERADOR", yytext(), yyline);
  return t;
}

\&\= {
  Token t = new Token("OPERADOR", yytext(), yyline);
  return t;
}

\^\= {
  Token t = new Token("OPERADOR", yytext(), yyline);
  return t;
}

\|\= {
  Token t = new Token("OPERADOR", yytext(), yyline);
  return t;
}

\<\<\= {
  Token t = new Token("OPERADOR", yytext(), yyline);
  return t;
}

\>\>\= {
  Token t = new Token("OPERADOR", yytext(), yyline);
  return t;
}

\-\> {
  Token t = new Token("OPERADOR", yytext(), yyline);
  return t;
}

//Error
. {
  Token t = new Token("ERROR", yytext(), yyline);
  return t;
}

<<EOF>> {
  return null;
}

