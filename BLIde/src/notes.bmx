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
		
endrem
