// Options and declarations
%class MyLexer
%unicode
%import java.io.*
// other options and user code

%%

// Regular definitions
DIGIT       = [0-9]
LETTER      = [a-zA-Z]
WHITESPACE  = [ \t\r\n]
// other regular definitions

%%

// Lexer rules
{WHITESPACE}+    { /* Ignore whitespace */ }

"if"             { return TokenTypes.IF; }
"else"           { return TokenTypes.ELSE; }
// other tokens
{LETTER}({LETTER}|{DIGIT})*    { return TokenTypes.IDENTIFIER; }
// more tokens

.    { /* handle unexpected characters */ }
