.orig x3000
;; INVALID FILE! see if the errors are caught!
ADD RR6    , R6,    		-1 ; THIS FILE IS INVALID
AND 	R0 R0, 0
ADD R9, R0 		,R1
ADD R0		, 	R0,		 4

AND R1, R1, 0
NOT R0 			, R0
LDR R0, R1, 6
STR R0, R12, 0
LDR R0, R6, 0
ADD 9, R7, R2

HALT
.end