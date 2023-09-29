%{
   
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
void yyerror(char *);
extern char* yytext;
extern FILE *yyin;
extern FILE *yyout;
extern int yyparse();
extern int yylex();


%}
%token lastT 
%token activeT 
%token gameIdT 
%token drawIdT 
%token drawTimeT 
%token statusT 
%token drawBreakT 
%token visualDrawT 
%token pricePointsT 
%token winningNumbersT 
%token prizeCategoriesT 
%token wagerStatisticsT
%token arrayPrizeCategoriesT 
%token idT 
%token dividentT 
%token winnersT 
%token distributedT 
%token jackpotT 
%token fixedT 
%token categoryTypeT 
%token gameTypeT 
%token minimumDistributedT
%token columnsT 
%token wagersT
%token addOnT
%token amountT
%token bonusT
%token dividentT
%token listT
%token LCURLY
%token RCURLY
%token LBRAC
%token RBRAC
%token COMMA 
%token COLON
%token contentT
%token totalPagesT 
%token totalElementsT 
%token numberOfElementsT 
%token sortT 
%token firstT 
%token sizeT  
%token numberT
%token directionT 
%token propertyT 
%token ignoreCaseT 
%token nullHandlingT 
%token descendingT 
%token ascendingT
%token <string> STRING;
%token <decimal> DECIMAL;
%token <integer> INTEGER;
%token <float> FLOAT;
%token TRUET;
%token FALSET;

%union {
  char *string;
  double decimal;
  int integer;
}



%%
json: json1 |json2 ;
json1: LCURLY last active RCURLY ;
json2: LCURLY content totalPages totalElements last numberOfElements sort first size number RCURLY
      ;
content: contentT COLON LBRAC contents RBRAC COMMA  
      ;
contents: LCURLY  gameId drawId drawTime status drawBreak visualDraw pricePoints winningNumbers prizeCategories wagerStatistics  RCURLY COMMA contents 
      | LCURLY  gameId drawId drawTime status drawBreak visualDraw pricePoints winningNumbers prizeCategories wagerStatistics  RCURLY COMMA
      ;
totalPages: totalPagesT COLON INTEGER COMMA 
      ;
totalElements: totalElementsT COLON INTEGER COMMA
      ;
numberOfElements: numberOfElementsT COLON INTEGER COMMA
      ;
sort: sortT COLON LBRAC sorts RBRAC COMMA
      ;
sorts: LCURLY direction property ignoreCase nullHandling descending ascending RCURLY
      ;
direction: directionT COLON STRING COMMA
      ;
property: propertyT COLON STRING COMMA
      ;
ignoreCase: ignoreCaseT COLON TRUET COMMA | ignoreCaseT COLON FALSET COMMA
      ;
nullHandling: nullHandlingT COLON STRING COMMA
      ;
descending: descendingT COLON TRUET COMMA | descendingT COLON FALSET COMMA
      ;
ascending: ascendingT COLON TRUET |  ascendingT COLON FALSET
      ;
first: firstT COLON TRUET COMMA | firstT COLON FALSET COMMA 
      ;
size: sizeT COLON INTEGER COMMA 
      ;
number: numberT COLON INTEGER
      ;
last: lastT COLON LCURLY  gameId drawId drawTime status drawBreak visualDraw pricePoints winningNumbers prizeCategories wagerStatistics  RCURLY COMMA | lastT COLON TRUET COMMA |  lastT COLON FALSET COMMA
      ;
active: activeT COLON LCURLY  gameId drawId drawTime  drawBreak visualDraw pricePoints prizeCategories wagerStatistics  RCURLY  
      ;

gameId : gameIdT COLON INTEGER COMMA
      ;
drawId: drawIdT COLON INTEGER COMMA
      ;
drawTime: drawTimeT COLON INTEGER COMMA
      ;
status: statusT COLON STRING COMMA
      ;
drawBreak: drawBreakT COLON  INTEGER COMMA
      ;
visualDraw: visualDrawT COLON INTEGER COMMA
      ;
pricePoints: pricePointsT COLON LCURLY  amount RCURLY COMMA
      ;
amount: amountT COLON FLOAT
      ;
winningNumbers: winningNumbersT COLON LCURLY list bonus RCURLY COMMA
      ;
list: listT COLON LBRAC  lists RBRAC COMMA
      ;
lists: INTEGER | INTEGER COMMA lists
      ;      
bonus: bonusT COLON LBRAC bonuses RBRAC
      ;
bonuses: INTEGER | INTEGER COMMA bonuses
      ;
prizeCategories: prizeCategoriesT COLON LBRAC arrayPrizeCategories RBRAC COMMA
      ;  
      
      
arrayPrizeCategories: LCURLY id divident winners distributed jackpot fixed categoryType gameType minimumDistributed RCURLY  | LCURLY id divident winners distributed jackpot fixed categoryType gameType minimumDistributed RCURLY COMMA arrayPrizeCategories | LCURLY id divident winners distributed jackpot fixed categoryType gameType  RCURLY | LCURLY id divident winners distributed jackpot fixed categoryType gameType RCURLY COMMA arrayPrizeCategories
      ;      
id: idT COLON INTEGER COMMA
      ;
divident: dividentT COLON  FLOAT COMMA
      ;
winners: winnersT COLON INTEGER COMMA
      ;
distributed: distributedT COLON  FLOAT COMMA
      ;
jackpot: jackpotT COLON FLOAT COMMA
      ;
fixed: fixedT COLON FLOAT COMMA
      ;
categoryType: categoryTypeT COLON  INTEGER COMMA
      ;
gameType: gameTypeT COLON STRING COMMA | gameTypeT COLON STRING
      ;
minimumDistributed: minimumDistributedT COLON FLOAT 
      ;
wagerStatistics: wagerStatisticsT COLON LCURLY columns wagers addOn RCURLY
      ;
columns: columnsT COLON INTEGER COMMA
      ;
wagers: wagersT COLON INTEGER COMMA
      ;
addOn: addOnT COLON LBRAC addOns RBRAC 
      ;
addOns: INTEGER | INTEGER COMMA addOns | /* empty */ ; 
 
%%
void yyerror(char *s) {
    fprintf(stderr, "%s\n", s);
}									


int main ( int argc, char **argv  ) 
  {
  ++argv; --argc;
  if ( argc > 0 )
        yyin = fopen( argv[0], "r" );
  else
        yyin = stdin;
  yyout = fopen ( "output", "w" );	
  yyparse ();	    
  return 0;
  }   
