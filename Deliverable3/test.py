######################################################
#   Authors: Victor Peralta, Nolan Rink, Zach Thomas
#
######################################################

import sys
from antlr4 import *
from delivThreeLexer import delivThreeLexer
from delivThreeParser import delivThreeParser
from antlr4.error.Errors import ParseCancellationException
from antlr4.error.ErrorListener import ConsoleErrorListener

class ErrorListener(ConsoleErrorListener):
    """
    Custom error listener to capture syntax errors during parsing.
    """
    def syntaxError(self, recognizer, offendingSymbol, line, column, msg, e):
        raise ParseCancellationException(f"Syntax Error at line {line}:{column} - {msg}")

def test_line(line, parser_entry_point):
    """
    Test a single line against the grammar using ANTLR.
    """
    input_stream = InputStream(line)
    lexer = delivThreeLexer(input_stream)
    token_stream = CommonTokenStream(lexer)
    parser = delivThreeParser(token_stream)

    # Attach a custom error listener to handle syntax errors
    parser.removeErrorListeners()
    parser.addErrorListener(ErrorListener())

    try:
        # Dynamically call the parser entry point
        getattr(parser, parser_entry_point)()
        return True  # If parsing succeeds
    except ParseCancellationException as ex:
        return False, str(ex)  # Return the error message if parsing fails

def main(file_path, parser_entry_point):
    """
    Main function to test each line of a file against the grammar.
    """
    with open(file_path, 'r') as file:
        lines = file.readlines()

    for line_no, line in enumerate(lines, start=1):
        line = line.strip()
        if not line:  # Skip empty lines
            continue

        result = test_line(line, parser_entry_point)
        if isinstance(result, tuple) and not result[0]:
            print(f"Line {line_no}: Invalid - {result[1]}")
        else:
            print(f"Line {line_no}: Valid")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python test_antlr.py <file_to_test.py> <parser_entry_point>")
        print("Example: python test_antlr.py example.py single_input")
        sys.exit(1)

    file_path = sys.argv[1]
    parser_entry_point = sys.argv[2]  # e.g., 'single_input' or 'file_input'
    main(file_path, parser_entry_point)







