//  Authors: Victor Peralta, Nolan Rink, Zach Thomas
//  Version: 3.0
//  Description: Below is our implementation for the third deliverable.
grammar delivThree;

// Entry point
prog: (statement | COMMENT | MULTILINE_COMMENT | NEWLINE)* EOF;

// Statements
statement
    : assignment NEWLINE
    | augmentedAssignment NEWLINE
    | arrayAssignment NEWLINE
    | ifBlock 
    | whileLoop 
    | forLoop 
    ;

// Assignments
assignment
    : VARNAME '=' expr
    ;

// Augmented Assignments (e.g., +=, -=, etc.)
augmentedAssignment
    : VARNAME ('+=' | '-=' | '*=' | '/=') expr
    ;

// Array Assignments
arrayAssignment
    : VARNAME '=' '[' arrayElements ']'
    ;

arrayElements
    : expr (',' expr)*
    ;

// If/Elif/Else blocks
ifBlock
    : 'if' expr ':' NEWLINE TAB (statement TAB)* (elifBlock | elseBlock)?
    ;

elifBlock
    : 'elif' expr ':' NEWLINE TAB (statement TAB)* 
    ;

elseBlock
    : 'else' ':' NEWLINE TAB (statement TAB)* 
    ;

// While loops
whileLoop
    : 'while' expr ':' NEWLINE TAB (statement | COMMENT)* UNTAB
    ;

// For loops
forLoop
    : 'for' VARNAME 'in' expr ':' NEWLINE TAB (statement | COMMENT)* UNTAB
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
    | comparisonExpr
    ;

comparisonExpr
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
    | STRING
    | CHAR
    | VARNAME
    | 'True'
    | 'False'
    ;

// Comments
COMMENT: '#' ~[\r\n]* -> skip;
MULTILINE_COMMENT: '\'\'\'' .*? '\'\'\'' -> skip;

// Tabs for fixed indentation
TAB: '\t'; // Tab character for indentation
UNTAB: '<UNTAB>'; // Explicit token to signify dedentation

// Newline handling
NEWLINE: [\r\n]+;

// Variables and literals
VARNAME: [a-zA-Z_][a-zA-Z0-9_]*;
NUMBER: [0-9]+ ('.' [0-9]+)?;
STRING: '"' (~["\r\n])* '"';
CHAR: '\'' [a-zA-Z] '\'';

// Whitespace
WS: [ ]+ -> skip;
BLANKLINE: [ \t]* NEWLINE -> skip;

// Lexer rules for arithmetic operators
PLUS: '+';
MINUS: '-';
MULT: '*';
DIV: '/';
MOD: '%';

// Relational operators
LT: '<';
LE: '<=';
GT: '>';
GE: '>=';
EQ: '==';
NEQ: '!=';

// Assignment operators
ASSIGN: '=';
PLUSEQ: '+=';
MINUSEQ: '-=';
MULTEQ: '*=';
DIVEQ: '/=';
