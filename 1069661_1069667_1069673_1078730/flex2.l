%{
//flex file part2
#include <string.h>
#include "parser2.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define ECHO fwrite( yytext, yyleng, 1, yyout)
extern void yyerror(char *);
%}

%option noyywrap
EXP ([Ee][-+]?[0-9]+)

 
%%
"\"last\"" {printf("%s",yytext); return lastT;}
"\"active\"" {printf("%s",yytext); return activeT;}
"\"gameId\"" {printf("%s",yytext); return gameIdT;}
"\"drawId\"" {printf("%s",yytext); return drawIdT;}
"\"drawTime\"" {printf("%s",yytext); return drawTimeT;}
"\"status\"" {printf("%s",yytext); return statusT;}
"\"drawBreak\"" {printf("%s",yytext); return drawBreakT;}
"\"visualDraw\"" {printf("%s",yytext); return visualDrawT;}
"\"pricePoints\"" {printf("%s",yytext); return pricePointsT;}
"\"prizeCategories\"" {printf("%s",yytext); return prizeCategoriesT;}
"\"wagerStatistics\"" {printf("%s",yytext); return wagerStatisticsT;}
"\"amount\"" {printf("%s",yytext); return amountT;}
"\"winningNumbers\"" {printf("%s",yytext); return winningNumbersT;}
"\"list\"" {printf("%s",yytext); return listT;}
"\"bonus\"" {printf("%s",yytext); return bonusT;}
"\"id\"" {printf("%s",yytext); return idT;}
"\"divident\"" {printf("%s",yytext); return dividentT;}
"\"winners\"" {printf("%s",yytext); return winnersT;}
"\"distributed\"" {printf("%s",yytext); return distributedT;}
"\"jackpot\"" {printf("%s",yytext); return jackpotT;}
"\"fixed\"" {printf("%s",yytext); return fixedT;}
"\"categoryType\"" {printf("%s",yytext); return categoryTypeT;}
"\"gameType\"" {printf("%s",yytext); return gameTypeT;}
"\"minimumDistributed\"" {printf("%s",yytext);return minimumDistributedT;}
"\"columns\"" {printf("%s",yytext); return columnsT;}
"\"wagers\"" {printf("%s",yytext); return wagersT;}
"\"addOn\"" {printf("%s",yytext); return addOnT;}
"\"content\"" {printf("%s",yytext); return contentT;}
"\"totalPages\""  {printf("%s",yytext); return totalPagesT;}
"\"totalElements\"" {printf("%s",yytext); return totalElementsT;}
"\"numberOfElements\"" {printf("%s",yytext); return numberOfElementsT ;}
"\"sort\"" {printf("%s",yytext); return sortT;}
"\"first\"" {printf("%s",yytext); return firstT;}
"\"size\""  {printf("%s",yytext); return sizeT;}
"\"number\"" {printf("%s",yytext); return numberT;}
"\"direction\"" {printf("%s",yytext); return directionT;}
"\"property\"" {printf("%s",yytext); return propertyT;}
"\"ignoreCase\"" {printf("%s",yytext); return ignoreCaseT;}
"\"nullHandling\"" {printf("%s",yytext); return nullHandlingT;}
"\"descending\"" {printf("%s",yytext); return descendingT;}
"\"ascending\"" {printf("%s",yytext); return ascendingT;}
"{" { printf("%s \n" ,yytext); return LCURLY; }
"}" { printf("%s \n" ,yytext); return RCURLY; }
"[" { printf("%s \n" ,yytext); return LBRAC; }
"]" { printf("%s \n" ,yytext); return RBRAC; }
"," { printf("%s \n" ,yytext); return COMMA; }
":" { printf("%s",yytext); return COLON; }
"true" {printf("%s",yytext) ; return TRUET;}
"false" {printf("%s",yytext) ; return FALSET;} 
[ \t\r\n]+ { /* eat whitespace */ }
\"[^"]*\" { yylval.string = strdup(yytext); printf("%s",yytext); return STRING;}
\-?[0-9]+[0-9]* {printf("%s",yytext); yylval.integer = atoi(yytext); return INTEGER;}

\-?[0-9]+"."?[0-9]*{EXP}? { printf("%s",yytext); float f = atof(yytext); yylval.decimal = f; return FLOAT;}



%%

