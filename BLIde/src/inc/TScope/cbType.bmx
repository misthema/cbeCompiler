Type TCBType
	Field matches:String
	Field kind:Int
End Type

Const CB_TYPE_UNKNOWN:Int = 0
Const CB_TYPE_BYTE:Int = 1
Const CB_TYPE_SHORT:Int = 2
Const CB_TYPE_INT:Int = 3
Const CB_TYPE_FLOAT:Int = 4
Const CB_TYPE_STRING:Int = 5

Global cbTypes:TCBType[]

AddCBType CB_TYPE_BYTE, "byte"
AddCBType CB_TYPE_SHORT, "short"
AddCBType CB_TYPE_INT, "integer"
AddCBType CB_TYPE_INT, "%"
AddCBType CB_TYPE_FLOAT, "float"
AddCBType CB_TYPE_FLOAT, "#"
AddCBType CB_TYPE_STRING, "string"
AddCBType CB_TYPE_STRING, "$"

Function AddCBType(kind:Int, matches:String)
	Local cbt:TCBType = New TCBType
	
	cbt.matches = matches
	cbt.kind = kind
	
	cbTypes:+[cbt]
End Function

Function getCBTypeMatch:Int(ch:String)
	For Local cbt:TCBType = EachIn cbTypes
		If cbt.matches = ch.ToLower()
			Return cbt.kind
		End If
	Next
	Return 0
End Function