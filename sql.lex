%{
#include "y.tab.h"
extern int yylval;
%}
Num     [0-9]
Numbers {Num}+
Whites [\s\t' ']
Ignore {Whites}+
BAD	[^0-9a-zA-Z]
BADS    {BAD}+
%%
{Ignore}      ;
"RENAME"        return (RENAME);
"AS"            return (AS);
"WHERE"         return (WHERE);
"<="          return (LTE);
">="          return (GTE);
"="           return (EQUAL);
"<>"          return (BETWEEN);
"\("          return (OPENP);
"\)"          return (CLOSEP);
","           return (COMMA);
"\["          return (OPENB);
"\]"          return CLOSEB;
"<"           return (LESS);
">"           return (GREAT);
{Numbers}     return (DIGIT);
"UNION"         return (BITOP);
"INTERSECT"     return (BITOP);
"MINUS"         return (BITOP);
"TIMES"         return (BITOP);
"JOIN"          return (BITOP);
"DIVIDEBY"      return (BITOP);
"CNO"           return (ATT);
"CITY"          return (ATT);
"CNAME"         return (ATT);
"SNO"           return (ATT);
"PNO"           return (ATT);
"TQTY"          return (ATT);
"SNAME"         return (ATT);
"QUOTA"         return (ATT);
"PNAME"         return (ATT);
"COST"          return (ATT);
"AVQTY"         return (ATT);
"S\#"            return (ATT);
"STATUS"        return (ATT);
"P\#"            return (ATT);
"COLOR"         return (ATT);
"WEIGHT"        return (ATT);
"QTY"           return (ATT);
"S"             return (RELTOK);
"P"             return (RELTOK);
"SP"            return (RELTOK);
"PRDCT"         return (RELTOK);
"CUST"          return (RELTOK);
"ORDERS"        return (RELTOK);
.	     return yytext[0];
"\n"          return(0);
%%
