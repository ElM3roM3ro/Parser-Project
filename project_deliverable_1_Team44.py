######################################################
#   Authors: Victor Peralta, Nolan Rink, Zach Thomas
#   
######################################################

#Below are a bunch of assignments provided for testing,
#We can uncomment them later but i just used a simpler test

#assign1 = "20"
#assign2 = 123
#assign3 = 1.23
#assign4 = assign1
#arith_op1 = 1 + 2
#arith_op2 = 13 - 3
#arith_op3 = 10 / arith_op1
#arith_op4 = 4.2 * 10
#arith_op5 = arith_op1 % arith_op2
#arith_op1 += arith_op2
#arith_op2 -= arith_op3
#arith_op3 *= arith_op4
#arith_op4 /= arith_op5
#array1 = [1, 2, 3, 4, 5]
#array2 = ['a', 'b', 'c']
#array3 = [1.6, 2.7, 3.8, 4.9, 5.0]
#var1 = 10
#var2 = var1/2 + 5
#var3 = var2 % 2
#var4 = 1
#flag = True


from antlr4 import *

from delivOneLexer import delivOneLexer
from delivOneParser import delivOneParser
from antlr4.tree.Trees import Trees

def main():
    code = "int main(): x = 3 + 5"
    s = InputStream(code)
    # OR you can use a FileStream
    '''
    s = FileStream(filepath)
    '''
    lexer = pyParserLexer(s)
    stream = CommonTokenStream(lexer)
    parser = pyParserParser(stream) 
    tree = parser.prog()
    if parser.getNumberOfSyntaxErrors() > 0:
        print("failed")
    else:
        print("passed")
main()
