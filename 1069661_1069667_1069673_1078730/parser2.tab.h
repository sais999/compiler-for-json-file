/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_PARSER2_TAB_H_INCLUDED
# define YY_YY_PARSER2_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    lastT = 258,
    activeT = 259,
    gameIdT = 260,
    drawIdT = 261,
    drawTimeT = 262,
    statusT = 263,
    drawBreakT = 264,
    visualDrawT = 265,
    pricePointsT = 266,
    winningNumbersT = 267,
    prizeCategoriesT = 268,
    wagerStatisticsT = 269,
    arrayPrizeCategoriesT = 270,
    idT = 271,
    dividentT = 272,
    winnersT = 273,
    distributedT = 274,
    jackpotT = 275,
    fixedT = 276,
    categoryTypeT = 277,
    gameTypeT = 278,
    minimumDistributedT = 279,
    columnsT = 280,
    wagersT = 281,
    addOnT = 282,
    amountT = 283,
    bonusT = 284,
    listT = 285,
    LCURLY = 286,
    RCURLY = 287,
    LBRAC = 288,
    RBRAC = 289,
    COMMA = 290,
    COLON = 291,
    contentT = 292,
    totalPagesT = 293,
    totalElementsT = 294,
    numberOfElementsT = 295,
    sortT = 296,
    firstT = 297,
    sizeT = 298,
    numberT = 299,
    directionT = 300,
    propertyT = 301,
    ignoreCaseT = 302,
    nullHandlingT = 303,
    descendingT = 304,
    ascendingT = 305,
    STRING = 306,
    DECIMAL = 307,
    INTEGER = 308,
    FLOAT = 309,
    TRUET = 310,
    FALSET = 311
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 71 "parser2.y"

  char *string;
  double decimal;
  int integer;

#line 120 "parser2.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_PARSER2_TAB_H_INCLUDED  */
