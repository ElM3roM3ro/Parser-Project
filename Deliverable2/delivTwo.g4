//  Authors: Victor Peralta, Nolan Rink, Zach Thomas
//  Version: 2.0
//  Description: Below is our implementation for the second deliverable.
grammar delivTwo;

prog: (statement)* EOF;

statement: assignment | conBranch;

assignment:
      VARNAME '=' expr
    | VARNAME '+=' expr
    | VARNAME '-=' expr
    | VARNAME '*=' expr
    | VARNAME '/=' expr
    | VARNAME '=' '[' array ']'
    ;

array: expr (',' expr)*;

conBranch
    : 'if' expr ':'  block elifClause* elseClause?
    ;

elifClause
    : 'elif' expr ':'  block
    ;

elseClause
    : 'else' ':'  block
    ;

block: (TAB statement)+;

expr: orExpr;

orExpr
    : andExpr ('or' andExpr)*
    ;

andExpr
    : notExpr ('and' notExpr)*
    ;

notExpr
    : 'not' notExpr
    | relationalExpr
    ;

relationalExpr
    : additiveExpr (('<' | '<=' | '>' | '>=' | '==' | '!=') additiveExpr)?
    ;

additiveExpr
    : multiplicativeExpr (('+' | '-') multiplicativeExpr)*
    ;

multiplicativeExpr
    : unaryExpr (('*' | '/' | '%') unaryExpr)*
    ;

unaryExpr
    : '-' unaryExpr
    | primary
    ;

primary
    : '(' expr ')'
    | NUMBER
    | VARNAME
    | STRING
    | CHAR
    | 'True'
    | 'False'
    ;

NUMBER: [0-9]+ ('.' [0-9]+)?;
CHAR: '\'' [a-zA-Z] '\'';
STRING: '"' (~["\r\n])* '"';
VARNAME: [a-zA-Z_][a-zA-Z0-9_]*;

TAB: '@'; // Four spaces representing indentation


WS:	[ \r\n]+ -> skip; // Modify this rule to avoid skipping indentation spaces
