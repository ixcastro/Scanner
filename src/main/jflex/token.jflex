%%
%public
%class LexScanner

%type Token

%init{
 /* Código que se ejecutará en el constructor de la clase */
%init}

/* Inicio de Expresiones regulares */

  Digito = [0-9]
  Letra = [A-Za-z]
  Reservada = "auto"|"break"|"case"|"char"|"const"|"continue"|"default"|"do"|"double"|"else"|"enum"|"extern"|"float"|"for"|"goto"|"if"|"int"|"long"|"register"|"return"|"short"|"signed"|"sizeof"|"static"|"struct"|"switch"|"typedef"|"union"|"unsigned"|"void"|"volatile"|"while"
  Variable = [A-Za-z]+ [0-9]*
  Operador = ","|";"|"++"|"--"|"=="|">="|">"|"?"|"<="|"<"|"!="|"||"|"&&"|"!"|"="|"-"|"*"|"/"|"%"|"("|")"|"["|"]"|"{"|"}"|":"|"."|"+="|"-="|"*="|"/="|"&"|"^"|"|"|">>"|"<<"|"~"|"%="|"&="|"^="|"|="|"<<="|">>="|"->"
  Espacio = " "
  Comentario= "/*"|"*/"|"//"


/* Finaliza expresiones regulares */

%%
/* Finaliza la sección de declaraciones de JFlex */

/* Inicia sección de reglas */

// Cada regla está formada por una {expresión} espacio {código}

{Reservada} {
  Token t = new Token("RESERVADA", yytext(), 1);
  return t;
}

{Comentario} {
  Token t = new Token("COMENTARIO", yytext(), 1);
  return t;
}

{Variable} {
  Token t = new Token("VARIABLE", yytext(), 1);
  return t;
}

{Operador} {
  Token t = new Token("OPERADOR", yytext(), 1);
  return t;
}

{Espacio} {
  // Ignorar cuando se ingrese un espacio
}

\n|\r\n { }

\+ {
  Token t = new Token("SUMA", yytext(), 1);
  return t;
}

<<EOF>> {
  return null;
}

