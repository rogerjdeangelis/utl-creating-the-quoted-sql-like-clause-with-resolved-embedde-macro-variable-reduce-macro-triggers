%let pgm=utl-creating-the-quoted-sql-like-clause-with-resolved-embedde-macro-variable-reduce-macro-triggers;

%stop_submission;

Creating the quoted sql like clause with resolved embedde macro variable reduce macro triggers

   CONTENTS ( I edited the sas communties result to sibgle quote the resoved string, )

       1 %tslit(%nrstr(%%)&nam%nrstr(%%)); tslit yeilds single quotes  (7 macro triggers)  LYK='%John'"
       2 datastep time str=quote(cats('%',resolve('&nam'),'%'),"'");   (3 macro triggers)  STR='%John%'
       3 macro time  %dosubl(str=cats("'%",resolve("&nam"),"%'"))      (3 macro triggers)  STR='%John%'

github
https://tinyurl.com/4u8vc4hv
https://github.com/rogerjdeangelis/utl-creating-the-quoted-sql-like-clause-with-resolved-embedde-macro-variable-reduce-macro-triggers

communities.sas
https://tinyurl.com/muz54cue
https://communities.sas.com/t5/SAS-Programming/adding-percent-chars-to-macrovariable/m-p/761408#M240939

The purpose of theis code is make the macro klingon cod more readable.

/**************************************************************************************************************************/
/* PROCESS                                                     |         OUTPUT                                           */
/* =======                                                     |         ======                                           */
/* 1 "%NRSTR(%%)&NAM%NRSTR(%%)"                                |    NAME SEX AGE HEIGHT WEIGHT                            */
/* ============================                                |                                                          */
/* Obvious once you see the result, but creating is difficult. |                                                          */
/*                                                             |    John M    12     59   99.5                            */
/* %let lyk=%tslit(%nrstr(%%)&nam%nrstr(%%));                  |                                                          */
/* %put &=lyk;                                                 |    LYK='%John%' Note single quotes                       */
/*                                                             |                                                          */
/* proc sql;                                                   |                                                          */
/*   select                                                    |                                                          */
/*      *                                                      |                                                          */
/*   from                                                      |                                                          */
/*      sashelp.class                                          |                                                          */
/*   where                                                     |                                                          */
/*      name like &lyk                                         |                                                          */
/* ;quit;                                                      |                                                          */
/*                                                             |                                                          */
/* LYK="%John%"                                                |                                                          */
/*                                                             |                                                          */
/*-------------------------------------------------------------+----------------------------------------------------------*/
/*                                                             |                                                          */
/* 2 DATASTEP TIME (IGNORE WARNING UNDERSTANDABLE?)            |    NAME SEX AGE HEIGHT WEIGHT                            */
/* ================================================            |                                                          */
/*                                                             |    John M    12     59   99.5                            */
/* /*--- for development and testing ----*/                    |                                                          */
/* %symdel str / nowarn;                                       |    STR='%John%'                                          */
/* %deleteSasmacN;                                             |                                                          */
/*                                                             |                                                          */
/* %let nam=John;                                              |                                                          */
/*                                                             |                                                          */
/* data _null_;                                                |                                                          */
/*  str=quote(cats('%',resolve('&nam'),'%'),"'");              |                                                          */
/*  call symputx('str',str);                                   |                                                          */
/* run;quit;                                                   |                                                          */
/*                                                             |                                                          */
/* /*--- for development and testing ----*/                    |                                                          */
/* %deleteSasmacN;                                             |                                                          */
/*                                                             |                                                          */
/* proc sql;                                                   |                                                          */
/*   select                                                    |                                                          */
/*      *                                                      |                                                          */
/*   from                                                      |                                                          */
/*      sashelp.class                                          |                                                          */
/*   where                                                     |                                                          */
/*      name like &str                                         |                                                          */
/* ;quit;                                                      |                                                          */
/*                                                             |                                                          */
/* %put &=str;                                                 |                                                          */
/*                                                             |                                                          */
/*-------------------------------------------------------------+----------------------------------------------------------*/
/*                                                             |                                                          */
/* 3 MACRO TIME (IGNORE WARNING)                               |   NAME SEX AGE HEIGHT WEIGHT                             */
/* ================================                            |                                                          */
/*                                                             |   John M    12     59   99.5                             */
/* /*--- for development and testing ----*/                    |                                                          */
/* %symdel str nam / nowarn;                                   |   STR='%John%'                                           */
/*                                                             |                                                          */
/* %let nam=John;                                              |                                                          */
/*                                                             |                                                          */
/* %deleteSasmacN;                                             |                                                          */
/*                                                             |                                                          */
/* %put %dosubl(                                               |                                                          */
/*   data _null_;                                              |                                                          */
/*    str=cats("'%",resolve("&nam"),"%'");                     |                                                          */
/*    call symputx('str',str);                                 |                                                          */
/*   run;quit;                                                 |                                                          */
/*   );                                                        |                                                          */
/*                                                             |                                                          */
/* /*--- for development and testing ----*/                    |                                                          */
/* %deleteSasmacN;                                             |                                                          */
/*                                                             |                                                          */
/* proc sql;                                                   |                                                          */
/*   select                                                    |                                                          */
/*      *                                                      |                                                          */
/*   from                                                      |                                                          */
/*      sashelp.class                                          |                                                          */
/*   where                                                     |                                                          */
/*      name like &str                                         |                                                          */
/*                                                             |                                                          */
/* ;quit;                                                      |                                                          */
/*                                                             |                                                          */
/* %put &=str;                                                 |                                                          */
/**************************************************************************************************************************/

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/

