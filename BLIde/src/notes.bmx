Rem

	TODO:
		- BASIC BLOCKS
			- Three-address statements
		- Scopes
			- Variables (local, global)
			- Arrays
			- Types
			- Functions
		>- Syntax analyser aka Grammar-Check
			- Functions
			- Arrays
			- Types
			- Variables
			- blabla...
		- Translator
			- Basic blocks
		- Compiler
			- Bytecode
	
	PHASES:
		- Code input
		- Lexer
		- Scoping & Symbols
		>- Syntax analyzer
		- Translate to TAS code
		- Compile TAS code to bytecode
		- Output: exe

		
	Parser rules:
		S = Expression
		Expression = Term OR Term [+,- Term]
		Term = Factor OR Factor [*,/ Factor]
		Factor = Number OR '(' Expression ')'
		
		Note:
			Every variable in programming is a Number
			(memory address, handler, value and so on).
			
		Expr = Term | Term & (TOK_PLUS | TOK_MINUS) & Term
		Term = Factor | Factor & (TOK_ASTERISK | TOK_SLASH) & Factor
		Factor = TOK_NUM_LIT | TOK_OPENPAREN & Expr & TOK_CLOSEPAREN
		
endrem
