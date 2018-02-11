%{
	#include "assem.tab.h"
	#include <stdlib.h>
	// int fetch_opcode_value(char const *instr);
	// int are_str_equal(char const *a, char const *b);
%}

DIGIT 			[0-9]
ALPHA 			[A-Za-z]
ALPHANUMERIC 	[A-Za-z0-9]
WHITESPACE 		[\ \t]

%%

(ADD|add) 					{ 	yylval = 1; return RTYPE; }
(AND|and) 					{ 	yylval = 5; return RTYPE; }

(NOT|not) 					{ 	yylval = 9; 	return OPC; }

(-)?{DIGIT}+ 				{ 	yylval = atoi(yytext); return NUMBER; } 						
(R|r)[0-7] 					{
								yylval = yytext[1] - '0';
								return REG;
							}
{WHITESPACE} 				{ 	}
\n 							{ 	return yytext[0]; }
. 							{ 	return yytext[0]; }

%%

int yywrap() {
	return 1;
}

// /// String equality checker, ignore case.
// int are_str_equal(char const *a, char const *b) {
// 	while (*a && *b && toupper(*a) == toupper(*b)) {
// 		a++;
// 		b++;
// 	}
// 	if (*a == *b) {
// 		// They must both be zero.
// 		return 1;
// 	}
// 	return 0;
// }

// int fetch_opcode_value(char const *instr) {
// 	if (are_str_equal(instr, "ADD")) {
// 		return 1;
// 	}
// }



// int main(void) {
//  	yylex();
// // }