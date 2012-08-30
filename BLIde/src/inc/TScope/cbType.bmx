Type TCBType
	Field matches:Int
	Field kind:Int
End Type

Const CB_TYPE_UNKNOWN:Int = 0
Const CB_TYPE_BYTE:Int = 1
Const CB_TYPE_SHORT:Int = 2
Const CB_TYPE_INT:Int = 3
Const CB_TYPE_FLOAT:Int = 4
Const CB_TYPE_STRING:Int = 5

Global cbTypes:TCBType[]

AddCBType CB_TYPE_BYTE, TOK_BYTE_TYPE
AddCBType CB_TYPE_SHORT, TOK_SHORT_TYPE
AddCBType CB_TYPE_INT, TOK_INT_TYPE
AddCBType CB_TYPE_FLOAT, TOK_FLOAT_TYPE
AddCBType CB_TYPE_STRING, TOK_STRING_TYPE

Function AddCBType(kind:Int, id:Int)
	Local cbt:TCBType = New TCBType
	
	cbt.matches = id
	cbt.kind = kind
	
	cbTypes:+[cbt]
End Function

Function getCBType:Int(id:Int)
	For Local cbt:TCBType = EachIn cbTypes
		If cbt.matches = id
			Return cbt.kind
		End If
	Next
	Return CB_TYPE_UNKNOWN
End Function