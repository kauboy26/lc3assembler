DIGIT 			[0-9]
ALPHA 			[A-Za-z]
ALPHANUMERIC 	[A-Za-z0-9]
REGISTER 		R[0-7]
WHITESPACE 		[\ \t]
%%
ADD|AND|NOT|LD|LDR|ST|STR|LEA|JSR|BR|JMP|RET 	{
					printf("Found instruction %s\n", yytext);
				}
{REGISTER} 		printf("Found register %s\n", yytext);
{WHITESPACE}+
.
\n
%%

int main() {
	yylex();
}		