SuperStrict
Import brl.map
Import brl.linkedlist
Import "../TLexer/TLexer.bmx"
Import "scopes.bmx"


Global localScope:TScope = TScope(CreateScope(SCOPE_LOCAL))
Global globalScope:TScope = TScope(CreateScope(SCOPE_GLOBAL))



Function ScopeTokens(lexer:TLexer, FFL:TLexer(filename:String), globals:Byte)
	Local tokenIter:Int = 0
	Local token:TToken = lexer._tokens[0]
	
	Local funcScope:TFunction = Null
	Local typeScope:TType = Null
	
	Local inComment:Byte = False
	
	
	
	'Global, Type, Function and Array symbols first
	'If lexer._globalised = False And lexer._symbolised = False And globals = True

			While token.kind <> TOK_EOF
				token = lexer._tokens[tokenIter]
				
				If token.kind = TOK_REMSTART Then inComment = True
				If token.kind = TOK_REMEND Then inComment = False
				
				If inComment = False
					
					Select token.kind
						Case TOK_INCLUDE_KW
							token = lexer._tokens[tokenIter + 1]

							If token.kind = TOK_STRING_LIT
								ScopeTokens(FFL(token._string), FFL, False)
							End If
							
						Case TOK_DIM_KW
							tokenIter = ScopeTokens_Dim(lexer, tokenIter + 1)
							
							'Local symbol:TSymbol = CreateSymbol(tokenIter + 1, lexer, cbtyp, SCOPE_GLOBAL, SYM_TYPE_GBL, dimensions)
							
							'globalScope.AddSymbol(tok._string,)
							
						Case TOK_GLOBAL_KW
							'lexer._tokens[tokenIter] = readIdentifier(tokenIter + 1, lexer)
						Case TOK_TYPE_KW
							
						Case TOK_CONST_KW
						
						Case TOK_FUNCTION_KW
						Case TOK_ENDFUNCTION_KW
						
					End Select
				End If
				
				tokenIter:+1
			Wend

		lexer._globalised = True
	'EndIf
	
	tokenIter = 0
	
	'Normal, local variables second
	If lexer._globalised = True And lexer._symbolised = False And globals = False
		While lexer._tokens[tokenIter].kind <> TOK_EOF
			token = lexer._tokens[tokenIter]
			
			If token.kind = TOK_REMSTART Then inComment = True
			If token.kind = TOK_REMEND Then inComment = False
			
			If inComment = False
				Select token.kind
					Case TOK_INCLUDE_KW
						token = lexer._tokens[tokenIter + 1]
						
						If token.kind = TOK_STRING_LIT
							ScopeTokens(FFL(token._string), FFL, False)
						End If

					Case TOK_FUNCTION_KW
						'scope = SCOPE_FUNCTION
					
					Case TOK_ENDFUNCTION_KW
						'scope = SCOPE_LOCAL
					
					Case TOK_ID
						
				End Select
			EndIf
			
			tokenIter:+1
		Wend
		
		lexer._symbolised = True
	EndIf

End Function



Function ScopeTokens_Dim:Int(lexer:TLexer, iter:Int)
	Local token:TToken = lexer._tokens[iter]
	
	Local symbolName:String
	Local symbolType:Int
	Local arrDimensions:Int
	
	
	' If token is not an identifier, throw error
	If token.kind <> TOK_ID Then
		lexer.doLineError("Expected identifier but encountered '" + token._string + "'!", token.Line, token.column)
	End If
	
	
	While lexer._tokens[iter].kind <> TOK_NEWLINE

		arrDimensions = 0
		symbolType = -1
		symbolName = token._string
		iter:+1
		token = lexer._tokens[iter]
		
		' Now we have the identifiers name, check for its type
		If isTypeDef(token.kind)
			symbolType = getCBType(token.kind)
			
			iter:+1
			token = lexer._tokens[iter]
		EndIf
		
		' Check if it is an array declaration
		If token.kind = TOK_OPENPAREN
			' Get the dimensions
			iter:+1
			token = lexer._tokens[iter]
			
			While True
			
				If arrDimensions > 5 Then
					lexer.doLineError("Max. dimensions allowed is 5!", token.Line, token.column)
				EndIf
				
				If token.kind = TOK_NUMBER_LIT
					If token.isDec = False
						arrDimensions:+1
					
					Else
						lexer.doLineError("Expected integer but encountered float!", token.Line, token.column)
					End If
				
				ElseIf token.kind = TOK_ID
					arrDimensions:+1
					
					If isTypeDef(lexer._tokens[iter + 1].kind)
						iter:+1
						token = lexer._tokens[iter]
					End If
				
				Else
					lexer.doLineError("Expected dimension size but encountered '" + token._string + "'!", token.Line, token.column)
				End If
				
				iter:+1
				token = lexer._tokens[iter]
				
				If token.kind = TOK_CLOSEPAREN
					iter:+1
					token = lexer._tokens[iter]
					
					If isTypeDef(token.kind)
						If symbolType <> - 1
							lexer.doLineError("'" + symbolName + "' has two type definitions!", token.Line, token.column)
						End If
						symbolType = getCBType(token.kind)
						iter:+1
						token = lexer._tokens[iter]
					End If
					
					Exit
				
				ElseIf token.kind = TOK_COMMA
					iter:+1
					token = lexer._tokens[iter]
				
				Else
					lexer.doLineError("Expected ',' or ')' but encountered '" + token._string + "'!", token.Line, token.column)
				End If
			WEnd
			
		ElseIf token.kind = TOK_COMMA
			iter:+1
			token = lexer._tokens[iter]
			
			If token.kind = TOK_ID
				Continue
			Else
				lexer.doLineError("Expected new identifier but encountered '" + token._string + "'!", token.Line, token.column)
			End If
			
		End If
		
		? Debug
			Print "ScopeTokens_Dim():"
			Print "   " + symbolName
			Print "   " + symbolType
			Print "   " + arrDimensions
		?
	Wend
	
	
	Return iter
	
	Function isTypeDef:Byte(id:Int)
		Select id
			Case TOK_INT_TYPE, TOK_BYTE_TYPE, TOK_SHORT_TYPE, TOK_FLOAT_TYPE, TOK_STRING_TYPE
				Return True
		End Select
		Return False
	End Function
End Function