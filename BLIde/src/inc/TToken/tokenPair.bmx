rem
	bbdoc: Type description
end rem
Type TTokenPair
	Field _left:Int, _right:Int
	Field kind:Int
	Field range:Int
End Type

Global tokenPair:TTokenPair[]

Function AddTokenPair(_left:Int, _right:Int, kind:Int, range:Int)
	Local toks:TTokenPair = New TTokenPair
	
	toks._left = _left
	toks._right = _right
	toks.kind = kind
	toks.range = range
	
	tokenPair:+[toks]
EndFunction

AddTokenPair TOK_END_KW, TOK_IF_KW, TOK_ENDIF_KW, 1
AddTokenPair TOK_END_KW, TOK_FUNCTION_KW, TOK_ENDFUNCTION_KW, 1
AddTokenPair TOK_END_KW, TOK_SELECT_KW, TOK_ENDSELECT_KW, 1
AddTokenPair TOK_END_KW, TOK_TYPE_KW, TOK_ENDTYPE_KW, 1
AddTokenPair TOK_ID, TOK_COLON, TOK_LABEL, 1
