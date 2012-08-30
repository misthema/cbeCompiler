Include "tokenConstants.bmx"
Include "tokenString.bmx"
Include "tokenSingle.bmx"
Include "tokenPair.bmx"
Include "tokenMark.bmx"


Type TToken
	'What type the token is
	Field kind:Int
	
	'Where is it, and where it ends to
	Field _from:Byte Ptr
	Field _to:Byte Ptr
	
	'What line is it at, what column
	Field line:Int, column:Int
	
	'Text format of the token
	Field _string:String
	
	'Where the token is visible
	Field scope:Int
	
	'What CB type this token is
	Field isDec:Int
	
	
	
	
	Method copy:TToken()
		Local t:TToken = New TToken
		
		t.kind = kind
		t._from = _from
		t._to = _to
		t.Line = Line
		t.column = column
		t._string = _string
		
		Return t
	End Method
	
	Method ExportString:String()
		Local cur:Byte Ptr = _from
		Local stop:Byte Ptr = _to
		Local ex:String = ""
		
		While cur < stop
			ex:+Chr(cur[0])
			cur:+1
		Wend
		
		Return ex
	End Method
	
EndType



