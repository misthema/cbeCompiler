SuperStrict

Import brl.map
Import "../TLexer/TLexer.bmx"
Include "cbType.bmx"
Include "scopeVar.bmx"

Const SYM_TYPE_VAR:Int = 1
Const SYM_TYPE_ARR:Int = 2
Const SYM_TYPE_TYP:Int = 3
Const SYM_TYPE_GBL:Int = 4
Const SYM_TYPE_FNC:Int = 5
Const SYM_TYPE_LBL:Int = 6
Const SYM_TYPE_CNS:Int = 7

Const SCOPE_FUNCTION:Byte = 1
Const SCOPE_TYPE:Byte = 2
Const SCOPE_GLOBAL:Byte = 3
Const SCOPE_LOCAL:Byte = 4

' This has all the scopes stored.
' Scopes have symbols, and symbols might have data:
' - TFunction
' - TType
Global scopes:TMap = CreateMap()

' Functions
Type TFunction
	' Symbols inside function
	Field symbols:TMap = CreateMap()
	
	' What CB type function returns
	Field rtnType:Int
	
	' What function passes
	Field parameters:TMap = CreateMap()
	
	
	Method AddSymbol(name:String, sym:TSymbol)
		If symbols.Contains(name) = False
			symbols.Insert(name, sym)
		End If
	End Method
	
	Method AddParameter(name:String, sym:TSymbol)
		If parameters.Contains(name) = False
			parameters.Insert(name, sym)
		Else
			sym.lexer.doLineError("Identifier '" + name + "' is already defined!", sym.lexer._tokens[sym.tokenID].Line, sym.lexer._tokens[sym.tokenID].column)
		End If
	End Method
	
	' Find a symbol in map
	Method FindSymbol:TSymbol(name:String)
		
		' Check if the symbol-key is found in the map
		If symbols.Contains(name) = True
		
			' Return the symbol
			Return TSymbol(symbols.ValueForKey(name))
		End If
		
		' Else return an 'empty' symbol
		Return Null
	End Method
End Type

' Types
Type TType
	' Fields and maybe methods
	Field symbols:TMap = CreateMap()
	
	' Add new symbol (field name or method name)
	Method AddSymbol(name:String, sym:TSymbol)
		If symbols.Contains(name) = False
			symbols.Insert(name, sym)
		Else
			sym.lexer.doLineError("Field '" + name + "' is already defined!", sym.lexer._tokens[sym.tokenID].Line, sym.lexer._tokens[sym.tokenID].column)
		End If
	End Method
	
	' Find a symbol in map
	Method FindSymbol:TSymbol(name:String)
		
		' Check if the symbol-key is found in the map
		If symbols.Contains(name) = True
		
			' Return the symbol
			Return TSymbol(symbols.ValueForKey(name))
		End If
		
		' Else return an 'empty' symbol
		Return Null
	End Method
End Type

' Globals and locals
Type TScope
	' Symbols
	Field symbols:TMap = CreateMap()
	
	Method AddSymbol(name:String, sym:TSymbol)
		If symbols.Contains(name) = False
			symbols.Insert(name, sym)
		End If
	End Method
	
	' Find a symbol in map
	Method FindSymbol:TSymbol(name:String)
		
		' Check if the symbol-key is found in the map
		If symbols.Contains(name) = True
		
			' Return the symbol
			Return TSymbol(symbols.ValueForKey(name))
		End If
		
		' Else return an 'empty' symbol
		Return Null
	End Method
End Type

' Symbol details
Type TSymbol
	Field tokenID:Int
	Field lexer:TLexer
	Field cbType:Int
	
	Field dimensions:Int = 0
	
	Field symType:Int
	
	' We need this to be mroe quicker to define the data type
	Field scopeType:Int
	
	' Can be either TFunction, TType, or null
	Field data:Object = Null

End Type

' Creates new scope
' Use with constants:
' - SCOPE_FUNCTION
' - SCOPE_TYPE
' - SCOPE_GLOBAL/LOCAL
Function CreateScope:Object(_type:Int)
	Select _type
		Case SCOPE_FUNCTION
			Return New TFunction
		Case SCOPE_TYPE
			Return New TType
		Default
			Return New TScope
	End Select
EndFunction

' Creates new symbol
Function CreateSymbol:TSymbol(tokenID:Int, lexer:TLexer, cbType:Int, scopeType:Int, symType:Int, data:Object = Null)
	Local sym:TSymbol = New TSymbol
	
	sym.tokenID = tokenID
	sym.lexer = lexer
	sym.cbType = cbType
	sym.scopeType = scopeType
	sym.symType = symType
	sym.data = data
	
	Return sym
End Function
