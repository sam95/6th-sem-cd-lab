%{
#include "y.tab.h"
%}
%%
[0-9]+ {return digit;}
[a-zA-Z][a-zA-Z0-9]* {return id;}
[\n] {return 0;}
. {return yytext[0];}
[\t];
%%
int yywrap()
{
return 1;
}
