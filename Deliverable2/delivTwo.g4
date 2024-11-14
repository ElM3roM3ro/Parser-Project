//  Authors: Victor Peralta, Nolan Rink, Zach Thomas
//  Version: 2.0
//  Description: Below is our implementation for the second deliverable.

grammar delivTwo;

prog: (statement)+ EOF;

statement: assignment | expr | conBranch;

expr:	expr ('+'|'-') expr
	| expr ('*'|'/' | '%') expr
	| NUMBER
	| VARNAME
	| STRING
	| CHAR;

conBranch: 'if' conditional ':' (TAB statement)+;


conditional: expr '<' expr
   | expr '<=' expr
   | expr '>' expr
   | expr '>=' expr
   | expr '==' expr
	 | expr '!=' expr
	 | expr 'and' expr
	 | expr 'or' expr
	 | expr 'not' expr;

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

NUMBER: [0-9]+ ('.' [0-9]+)?;
CHAR: '\'' [a-zA-Z] '\'';
STRING: '"' (~["\r\n])* '"';
VARNAME: [a-zA-Z_][a-zA-Z0-9_]*;
//TAB: [\t];
TAB: '@';

WS:	[ \r\n]+ -> skip;
