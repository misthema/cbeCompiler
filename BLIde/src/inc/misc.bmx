SuperStrict

Function isdigit:Byte(ch:Byte)
	Return ch >= Asc("0") And ch <= Asc("9")
End Function

Function isalpha:Byte(ch:Byte)
	Return ch=Asc("_") Or (ch>=Asc("a") And ch<=Asc("z")) Or (ch>=Asc("A") And ch<=Asc("Z"))
End Function

Function isxdigit:Byte(ch:Byte)
	Return ((ch >= Asc("0") And ch <= Asc("9")) Or (ch >= Asc("a") And ch <= Asc("f")) Or (ch >= Asc("A") And ch <= Asc("F")))
End Function
