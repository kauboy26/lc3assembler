.orig x3000
;; This thing is just a test for the assembler.
;; Let's see if the stupid thing works.

ADD R6    , R6,    		-1 ; This file has ;strange indentations, etc.
;; but in the end, it should all work. This file is a valid assembly file.
; I've included a good number of commands in this file.
AND 	R0,R0, 0
ADD R0, R0 		, 		R7
ADD R0		, 	R0,		 4

AND R1, R1, 0
NOT R0 			, R0
LDR R0, R1, 6
STR R0, R6, 0
LDR R0, R6, 0
ADD R7, R2, 9

HALT
.end