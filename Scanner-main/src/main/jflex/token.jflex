/* Sección de declaraciones de JFlex */
%%
%public
%class AnalizadorLexico
%{

 /* Código personalizado */

 // Se agregó una propiedad para verificar si existen tokens pendientes
 private boolean _existenTokens = false;

 public boolean existenTokens(){
 return this._existenTokens;
 }

%}

 /* Al utilizar esta instrucción, se le indica a JFlex que devuelva objetos del tipo TokenPersonalizado */
%type TokenPersonalizado

%init{
 /* Código que se ejecutará en el constructor de la clase */
%init}

%eof{

 /* Código a ejecutar al finalizar el análisis, en este caso cambiaremos el valor de una variable bandera */
 this._existenTokens = false;

%eof}

/* Inicio de Expresiones regulares */

 Digito = [0-9]
 Letra = [A-Za-z]
 Reservada = "auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"|"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"|"int"|"long"|"register"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while"
 Variable = [A-Za-z]+ [0-9]*
 Operador = ","|";"|"++"|"--"|"=="|">="|">"|"?"|"<="|"<"|"!="|"||"|"&&"|"!"|"="|"+"|"-"|"*"|"/"|"%"|"("|")"|"["|"]"|"{"|"}"|":"|"."|"+="|"-="|"*="|"/="|"&"|"^"|"|"|">>"|"<<"|"~"|"%="|"&="|"^="|"|="|"<<="|">>="|"->"
 Espacio = " "
 SaltoDeLinea = \n|\r|\r\n
 Comentario= "/*"|"*/"|"//"

/* Finaliza expresiones regulares */

%%
/* Finaliza la sección de declaraciones de JFlex */

/* Inicia sección de reglas */

// Cada regla está formada por una {expresión} espacio {código}

{Reservada} {
  TokenPersonalizado t = new TokenPersonalizado(yytext(), "RESERVADA");
  this._existenTokens = true;
  return t;
}

{Comentario} {
  TokenPersonalizado t = new TokenPersonalizado(yytext(), "COMENTARIO");
  this._existenTokens = true;
  return t;
}

{Variable} {
  TokenPersonalizado t = new TokenPersonalizado(yytext(), "VARIABLE");
  this._existenTokens = true;
  return t;
}

{Operador} {
 TokenPersonalizado t = new TokenPersonalizado(yytext(), "OPERADOR");
 this._existenTokens = true;
 return t;
}

{Espacio} {
 // Ignorar cuando se ingrese un espacio
}

{SaltoDeLinea} {
 //Ignorar cuando hay salto de linea
}

{.} {
   TokenPersonalizado t = new TokenPersonalizado("Error", "Error");
   this._existenTokens = true;
   return t;
}