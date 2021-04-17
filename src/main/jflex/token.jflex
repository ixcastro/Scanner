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
 Reservada = "int"
 Variable = [A-Za-z]+ [0-9]*
 Simbolo = "*"|"+"|"-"|"/"|"#"
 Espacio = " "
 SaltoDeLinea = \n|\r|\r\n

/* Finaliza expresiones regulares */

%%
/* Finaliza la sección de declaraciones de JFlex */

/* Inicia sección de reglas */

// Cada regla está formada por una {expresión} espacio {código}

{Reservada} {
  TokenPersonalizado t = new TokenPersonalizado(yytext(), "Reservada");
  this._existenTokens = true;
  return t;
}

{Variable} {
  TokenPersonalizado t = new TokenPersonalizado(yytext(), "Variable");
  this._existenTokens = true;
  return t;
}

{Simbolo} {
 TokenPersonalizado t = new TokenPersonalizado(yytext(), "SIMBOLO");
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