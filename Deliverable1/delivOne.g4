//  Authors: Victor Peralta, Nolan Rink, Zach Thomas
//  Version: 1.0
//  Description: Below is our implementation for the first deliverable.

grammar delivOne;


endExpr: expr ;

expr:	assignment
	| expr ('+'|'-') expr
	| expr ('*'|'/' | '%') expr
	| NUMBER
	| VARNAME
	| STRING
	| CHAR;

NUMBER: [0-9]+ ('.' [0-9]+)?;
CHAR: '\'' [a-zA-Z] '\'';
STRING: '"' (~["\r\n])* '"';
VARNAME: [a-zA-Z_][a-zA-Z0-9_]*;

assignment:	VARNAME '=' expr
   | VARNAME '+=' expr
   | VARNAME '-=' expr
   | VARNAME '*=' expr
   | VARNAME '/=' expr
   | VARNAME  '=' '[' array ']';

array: element (',' element)*;

element: NUMBER
   | CHAR
   | VARNAME
   | STRING;
WS:	[ \t\r\n]+ -> skip;
