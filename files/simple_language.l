%{
#include <cstdlib>
#include <string>
#include "y.tab.h"
%}
extern void yyerror(const char*);
%%

[a-zA-Z][a-zA-Z0-9]*    { yylval.str = new std::string(yytext);  return ID; }
[0-9]+                  { yylval.num = strtol(yytext, NULL, 10); return NUMBER; }
"+"                     { return '+'; }
"-"                     { return '-'; }
"*"                     { return '*'; }
"/"                     { return '/'; }
"="                     { return '='; }
":"                     { return ':'; }
[ \t]                   ;  // Skip whitespace
\n                      ;  // Skip newlines
.                       { std::cerr << "Invalid character '" << yytext[0] << "'" << std::endl; return ERROR; }
%%

int yywrap() {
    return 1;
}
