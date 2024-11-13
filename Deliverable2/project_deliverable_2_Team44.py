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



def test_case(code, case_name):
    s = InputStream(code)
    lexer = delivOneLexer(s)
    stream = CommonTokenStream(lexer)
    parser = delivOneParser(stream)

    if parser.getNumberOfSyntaxErrors() > 0:
        print(f"{case_name}: failed")
    else:
        print(f"{case_name}: passed")

def main():
    test_cases = {
        "assign1": "assign1 = \"20\"",
        "assign2": "assign2 = 123",
        "assign3": "assign3 = 1.23",
        "assign4": "assign4 = assign1",
        "arith_op1": "arith_op1 = 1 + 2",
        "arith_op2": "arith_op2 = 13 - 3",
        "arith_op3": "arith_op3 = 10 / arith_op1",
        "arith_op4": "arith_op4 = 4.2 * 10",
        "arith_op5": "arith_op5 = arith_op1 % arith_op2",
        "arith_op1_update": "arith_op1 += arith_op2",
        "arith_op2_update": "arith_op2 -= arith_op3",
        "arith_op3_update": "arith_op3 *= arith_op4",
        "arith_op4_update": "arith_op4 /= arith_op5",
        "array1": "array1 = [1, 2, 3, 4, 5]",
        "array2": "array2 = ['a', 'b', 'c']",
        "array3": "array3 = [1.6, 2.7, 3.8, 4.9, 5.0]",
        "var1": "var1 = 10",
        "var2": "var2 = var1 / 2 + 5",
        "var3": "var3 = var2 % 2",
        "var4": "var4 = 1",
        "flag": "flag = True"
    }

    for case_name, code in test_cases.items():
        test_case(f"{code}", case_name)

main()
