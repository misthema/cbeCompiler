Type TSymbol
	Field tokenID:Int
	Field lexer:TLexer
End Type

Function AddScopeVariable:Byte(tokenName:String, tokenID:Int, lexer:TLexer, _global:Byte = False, hasError:Byte = False)
	Local checkl:Byte, checkg:Byte, list:TList
	
	If _global
		checkg = symbolNamesGlobal.Contains(tokenName)
		checkl = False
		list = symbolNamesGlobal
	Else
		checkg = symbolNamesGlobal.Contains(tokenName)
		checkl = symbolNamesLocal.Contains(tokenName)
		list = symbolNamesLocal
	End If

	If checkl=False And checkg=False
		Local sv:TSymbol = New TSymbol
		
		sv.tokenID = tokenID
		sv.lexer = lexer
	
		symbols:+[sv]
		'symbolList.AddLast sv
		list.AddLast tokenName
	Else
		If hasError
			Return True
		EndIf
	EndIf
	
	Return False
End Function

