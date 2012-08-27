SuperStrict
Import brl.linkedlist
Import "../TLexer/TLexer.bmx"
Include "cbType.bmx"
Include "scopeVar.bmx"


Const SCOPE_LOCAL:Int = 1
Const SCOPE_GLOBAL:Int = 2
Const SCOPE_FUNCTION:Int = 3

Global symbols:TSymbol[]
Global symbolList:TList = New TList
Global symbolNamesLocal:TList = New TList
Global symbolNamesGlobal:TList = New TList


Function ScopeTokens(lexer:TLexer, FFL:TLexer(filename:String))
	Local tokenIter:Int = 0
	Local token:TToken
	
	Local scope:Int
	

	'Global, Type, Function and Array symbols first
	If lexer._symbolised = False
		If lexer._globalised = False
			While lexer._tokens[tokenIter].kind <> TOK_EOF
				token = lexer._tokens[tokenIter]
				
				Select token.kind
					Case TOK_INCLUDE_KW
						token = lexer._tokens[tokenIter + 1]
						
						If token.kind = TOK_STRING_LIT
							FFL(token._string)
						End If
					Case TOK_GLOBAL_KW
						If scope = SCOPE_FUNCTION
							lexer.doLineError("Cannot define global inside a function!", token.Line, token.column)
						End If
						token = lexer._tokens[tokenIter + 1]
						
						If token.kind = TOK_ID
							token.scope = SCOPE_GLOBAL
							If AddScopeVariable(token._string, tokenIter + 1, lexer, True, True)
								lexer.doLineError("Global variable '" + token._string + "' already defined!", token.Line, token.column)
							End If
						End If
					
					Case TOK_DIM_KW
						token = lexer._tokens[tokenIter + 1]
						
						If token.kind = TOK_ID And lexer._tokens[tokenIter + 2].kind = TOK_OPENPAREN
							token.scope = SCOPE_GLOBAL
							If scope = SCOPE_FUNCTION token.scope = SCOPE_FUNCTION
							If AddScopeVariable(token._string, tokenIter + 1, lexer, True, True)
								lexer.doLineError("Array '" + token._string + "' already defined!", token.Line, token.column)
							End If
						End If
					
					Case TOK_TYPE_KW
						If scope = SCOPE_FUNCTION
							lexer.doLineError("Cannot define type inside a function!", token.Line, token.column)
						End If
						token = lexer._tokens[tokenIter + 1]
						
						If token.kind = TOK_ID
							token.scope = SCOPE_GLOBAL
							If AddScopeVariable(token._string, tokenIter + 1, lexer, True, True)
								lexer.doLineError("Type '" + token._string + "' already defined!", token.Line, token.column)
							End If
						End If
					
					Case TOK_FUNCTION_KW
						If scope = SCOPE_FUNCTION
							lexer.doLineError("Cannot find missing EndFunction!", token.Line, token.column)
						End If
						token = lexer._tokens[tokenIter + 1]
						
						If token.kind = TOK_ID
							token.scope = SCOPE_GLOBAL
							If AddScopeVariable(token._string, tokenIter + 1, lexer, True, True)
								lexer.doLineError("Function '" + token._string + "' already defined!", token.Line, token.column)
							End If
						End If
						scope = SCOPE_FUNCTION
				
					Case TOK_ENDFUNCTION_KW
						scope = SCOPE_LOCAL

					
					Case TOK_CONST_KW
						If scope = SCOPE_FUNCTION
							lexer.doLineError("Cannot define constant inside a function!", token.Line, token.column)
						End If
						token = lexer._tokens[tokenIter + 1]
						
						If token.kind = TOK_ID
							token.scope = SCOPE_GLOBAL
							If AddScopeVariable(token._string, tokenIter + 1, lexer, True, True)
								lexer.doLineError("Constant variable '" + token._string + "' already defined!", token.Line, token.column)
							End If
						End If
					
					Case TOK_LABEL
						token = lexer._tokens[tokenIter + 1]
						
						If token.kind = TOK_ID
							token.scope = SCOPE_GLOBAL
							If scope = SCOPE_FUNCTION token.scope = SCOPE_FUNCTION
							If AddScopeVariable(token._string, tokenIter + 1, lexer, True, True)
								lexer.doLineError("Label '" + token._string + "' already defined!", token.Line, token.column)
							End If
						End If
				End Select
				
				tokenIter:+1
			Wend
		EndIf
		lexer._globalised = True
		
		tokenIter = 0
		
		'Normal, local variables second
		While lexer._tokens[tokenIter].kind <> TOK_EOF
			token = lexer._tokens[tokenIter]
			
			
			
			Select token.kind
				Case TOK_FUNCTION_KW
					scope = SCOPE_FUNCTION
				
				Case TOK_ENDFUNCTION_KW
					scope = SCOPE_LOCAL

				Case TOK_DIM_KW
					token = lexer._tokens[tokenIter + 1]
					
					If token.kind = TOK_ID
						If Not AddScopeVariable(token._string, tokenIter + 1, lexer, False, True)
							token.scope = SCOPE_LOCAL
						Else
							lexer.doLineError("Variable '" + token._string + "' already defined!", token.Line, token.column)
						End If
					End If
				
				Case TOK_ID
					
					If Not AddScopeVariable(token._string, tokenIter, lexer, False, True)
						token.scope = SCOPE_LOCAL
					End If
	
			End Select
			
			tokenIter:+1
		Wend
		
		lexer._symbolised = true
	EndIf

End Function