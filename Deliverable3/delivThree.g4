//  Authors: Victor Peralta, Nolan Rink, Zach Thomas
//  Version: 3.0
//  Description: Below is our implementation for the third deliverable.
grammar delivThree;

prog: (statement NEWLINE?)* EOF;

// Statements include assignments, conditionals, loops, and comments
statement
    : assignment
    | ifBlock
    | loop
    | COMMENT
    ;

// Assignments
assignment
    : VARNAME '=' expr
    | VARNAME '+=' expr
    | VARNAME '-=' expr
    | VARNAME '*=' expr
    | VARNAME '/=' expr
    | VARNAME '=' '[' array ']'
    ;

array: expr (',' expr)*;

// If/Elif/Else blocks
ifBlock
    : 'if' expr ':' NEWLINE TAB (statement NEWLINE)+
      (elifBlock | elseBlock)?
    ;

elifBlock
    : 'elif' expr ':' NEWLINE TAB (statement NEWLINE)+
    ;

elseBlock
    : 'else' ':' NEWLINE TAB (statement NEWLINE)+
    ;

// Loops
loop
    : 'while' expr ':' NEWLINE TAB (statement NEWLINE)+
    | 'for' VARNAME 'in' expr ':' NEWLINE TAB (statement NEWLINE)+
    ;

// Expressions
expr
    : orExpr
    ;

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

// Primary expressions
primary
    : '(' expr ')'
    | NUMBER
    | STRING
    | VARNAME
    | CHAR
    | 'True'
    | 'False'
    ;

// Lexer Rules

// Keywords
IF: 'if';
ELIF: 'elif';
ELSE: 'else';
WHILE: 'while';
FOR: 'for';
IN: 'in';
OR: 'or';
AND: 'and';
NOT: 'not';
TRUE: 'True';
FALSE: 'False';

// Operators
EQ: '=';
PLUSEQ: '+=';
MINUSEQ: '-=';
MULTEQ: '*=';
DIVEQ: '/=';
PLUS: '+';
MINUS: '-';
MULT: '*';
DIV: '/';
MOD: '%';
LT: '<';
LE: '<=';
GT: '>';
GE: '>=';
EQEQ: '==';
NEQ: '!=';

// Delimiters
COLON: ':';
LPAREN: '(';
RPAREN: ')';

// Variables and Literals
VARNAME: [a-zA-Z_][a-zA-Z0-9_]*;
NUMBER: [0-9]+ ('.' [0-9]+)?;
STRING: '"' (~["\r\n])* '"';
CHAR: '\'' [a-zA-Z] '\'';

// Comments
COMMENT: '#' ~[\r\n]* -> skip;

// Tabs for Indentation
TAB: '\t';

// Blank Lines
BLANKLINE: [ \t]* NEWLINE -> skip;

// Newlines
NEWLINE: [\n\r]+;
//NEWLINE: '\r'? '\n';
// Whitespace
WS: [ \t]+ -> skip;
