flex assembly_grammar.l
bison assem.y
gcc lex.yy.c -l fl assem.tab.c -l bison -o assembler