%{
	#include <stdio.h>

	#define PACK4(op, a, b, c) 	(((op) << 12) | ((a) << 9) | ((b) << 6) | c)
	#define LCRT(op, a, b, c) 	(((op) << 12) | ((a) << 9) | ((b) << 6) | c)
	#define LCO9A(op, a, b, c) 	(((op) << 12) | ((a) << 9) | ((b) << 6) | c)

	extern FILE *yyin;
	extern int yylex();

	void yyerror(char const *);
%}

%token REG NUMBER
%token RTYPE O9A OPC

%%
input:
	%empty
| 	input line
;

line:
	'\n'
| 	stmt '\n' 			{ printf("%x\n", $1); }
;

stmt:
 	RTYPE REG ',' REG ',' REG 		{ 	$$ = PACK4($1, $2, $4, $6); }
| 	RTYPE REG ',' REG ',' NUMBER 	{ 	$$ = PACK4($1, $2, $4, $6) | 0x20; }

|	OPC REG ',' REG ',' REG 		{ 	$$ = PACK4($1, $2, $4, $6); }
| 	OPC REG ',' NUMBER 				{ 	$$ = PACK4($1, $2, 0, $4); 		}	
| 	OPC REG ',' REG ',' NUMBER 		{ 	$$ = PACK4($1, $2, $4, $6); 	}
| 	OPC REG ',' REG 				{ 	$$ = PACK4($1, $2, $4, 0x3F); 	}
| 	OPC 							{ 	$$ = PACK4($1, 0, 0x7, 0);		}
;

%%

void yyerror(char const *msg) {
	fprintf(stderr, "You noob! %s", msg);
}

int main(int argc, char *argv[]) {
	yyin = stdin;
	yyparse();
}