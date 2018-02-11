flex assembly_grammar.l
bison assem.y -d
gcc lex.yy.c assem.tab.c -l fl -o assembler