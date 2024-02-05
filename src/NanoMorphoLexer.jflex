%%

%public
%class NanoMorphoLexer
%implements NanoMorpho.Lexer	
// %implements Driver.Lexer		/* Use this if the hand-written driver is used */
%unicode
%line
%column
%byaccj

%{

	String yylval;

	public String getLVal()
	{
		return yylval;
	}

	public void yyerror( String error )
	{
		System.err.println("Error:  "+error);
		System.err.println("Lexeme: "+yylval);
		System.err.println("Line:   "+(yyline+1));
		System.err.println("Column: "+(yycolumn+1));
		System.exit(1);
	}

	public void show( String token, String lexeme )
	{
		System.out.print("Token: "+token);
		System.out.print(", Lexeme: "+lexeme);
		System.out.print(", Line: "+(yyline+1));
		System.out.println(", Column: "+(yycolumn+1));
	}

	public String getTokenName( int token )
	{
		switch( token )
		{
		case LITERAL:	return "LITERAL";
		case NAME:		return "NAME";
		case IF:		return "IF";
		case ELSE:		return "ELSE";
		case YYERRCODE:	return "YYERRCODE";
		case DELIM:		return "DELIM";
		case QUOTE:	return "QUOTE";
		case WHILE:	return "WHILE";
		case FOR:	return "FOR";
		case VAR:    return "VAR";
		case FUN:	 return "FUN";
		case REC:	 return "REC";
		case RETURN: return "RETURN";
		case VAL:	 return "VAL";
		case OPNAME:	return "OPNAME";
		case ELSEIF:	return "ELSEIF";
		}
		return "unknown";
	}
	
	public int getLine() { return yyline+1; }
	public int getColumn() { return yycolumn+1; }
%}

  /* Reglulegar skilgreiningar */

  /* Regular definitions */

_DIGIT=[0-9]
_FLOAT={_DIGIT}+\.{_DIGIT}+([eE][+-]?{_DIGIT}+)?
_INT={_DIGIT}+
_STRING=\"([^\"\\]|\\b|\\t|\\n|\\f|\\r|\\\"|\\\'|\\\\|(\\[0-3][0-7][0-7])|\\[0-7][0-7]|\\[0-7])*\"
_CHAR=\'([^\'\\]|\\b|\\t|\\n|\\f|\\r|\\\"|\\\'|\\\\|(\\[0-3][0-7][0-7])|(\\[0-7][0-7])|(\\[0-7]))\'
_DELIM=[,:;.\-(){}\[\]=]
_NAME=([:letter:]|{_DIGIT})+
_OPNAME=[\+\-*/!%&=><\:\^\~&|?]+
_QUOTE=\'

%%

{_DELIM} {
	yylval = yytext();
	return DELIM;
}
{_QUOTE} {
	yylval = yytext();
	return QUOTE;
}

{_STRING} | {_FLOAT} | {_CHAR} | {_INT} | null | true | false {
	yylval = yytext();
	return LITERAL;
}

"if" {
	yylval = yytext();
	return IF;
}

"else" {
	yylval = yytext();
	return ELSE;
}

"while" {
	yylval = yytext();
	return WHILE;
}

"for" {
	yylval = yytext();
	return FOR;
}

"fun" {
	yylval = yytext();
	return FUN;
}

"var" {
    yylval = yytext();
    return VAR;
}

"rec" {
	yylval = yytext();
	return REC;
}

"return" {
	yylval = yytext();
	return RETURN;
}

"val" {
	yylval = yytext();
	return VAL;
}
"else if" {
	yylval = yytext();
	return ELSEIF;
}

{_NAME} {
	yylval = yytext();
	return NAME;
}

{_OPNAME} {
	yylval = yytext();
	return OPNAME;
}

";;;".*$ {
}

[ \t\r\n\f] {
}

. {
	yylval = yytext();
	return YYERRCODE;
}
