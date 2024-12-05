# Parser-Project
### Team Members:
- Nolan Rink
- Victor Peralta
- Zach Thomas

### Requirements:
Basic overview: The first file is a .g4 file, where we implemented our parser The second (test.py) is a python file that we used to test our antlr grammar. We mainly tested on the ANTLR Lab website. The third file is project_deliverable_3.py, the one provided on canvas
Steps for setup:
1. Download antlr jar file. We used 4.13.2
2. Download python (we used 3.12.0)
3. Honesltly any version of either works, as long as you ensure wherever your running the python program-> the python downloaded must match the version of python you generate the .g4 files with. 

### How to use/Run:
Steps for running: (Note that all files should be in same folder/directory)
1. Download files from Deliverable3. (There are three)
2. Generate needed files by running the following command in terminal:
    antlr4 -Dlanguage=Python3 delivThree.g4
4. Run the following command in terminal - NOTE: the test.py should be ran with 2 additonal parameters, the name of the file provided on canvas, and the start of the grammar. In this case its "prog". 
    python3 test.py project_deliverable_3.py prog
5. The program will then print out the results of each line, whether it was a valid or invalid match.
6. You can also just copy code from .g4 file into ANTLR lab parser section, copy code from project_deliverable_3.py into the input section, and then press run. This is also how we derived our tree. 
### Link to Demo

