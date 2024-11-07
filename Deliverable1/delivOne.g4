//  Authors: Victor Peralta, Nolan Rink, Zach Thomas
//  Version: 1.0
//  Description: Below is our implementation for the first deliverable.

grammar delivOne;

prog:	'def main():'  expr  EOF;

endExpr: expr ;

expr:	assignment
	| expr ('+'|'-') expr
	| expr ('*'|'/' | '%') expr
	| INT ;

INT:	[0-9]+;
VARNAME: [a-zA-Z]+;
assignment:	VARNAME '=' expr
   | VARNAME '+=' expr
   | VARNAME '-=' expr
   | VARNAME '*=' expr
   | VARNAME '/=' expr;

WS:	[ \t\r\n]+ -> skip;
