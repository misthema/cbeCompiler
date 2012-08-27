SuperStrict

Framework brl.StandardIO
Import brl.FileSystem
Import brl.linkedlist
Import brl.retro
Import brl.System
Import "shunting_yard.c"

Extern "C"
	Function shunting_yard(_input:Byte Ptr, _output:Byte Ptr)
End Extern

Global stack:TList = New TList

Local calculus:String' = "3+4*2/(1-5)^2^3"


While Not calculus

	calculus = Input("Input your expression:~r~n")
	
WEnd



Local in:Byte Ptr = calculus.ToCString()
Local out:Byte Ptr = New String[128] ' olevinaan char *out[128] =D
Local output:String

shunting_yard(in, out)

output = String.FromCString(out)

Print "Input: " + calculus
Print "Output: " + output
Print " = " + calculate(output)

WaitSystem()

End


Function push(value:String)
	stack.AddLast value
End Function

Function pop:String()
	Return stack.RemoveLast().ToString()
End Function

Function calculate:Int(in:String)
	Local out:Int
	Local a:Int
	Local b:Int
	Local i:Int = 1
	While i <= in.Length
		Local ch:String = Mid(in, i, 1)
		
		If isdigit(ch)
			push(ch)
		End If
		
		If isop(ch)
			Local temp:Int
			b = Int(pop())
			a = Int(pop())
			Select ch
				Case "+"
					temp = a + b
				Case "-"
					temp = a - b
				Case "/"
					temp = a / b
				Case "*"
					temp = a * b
				Case "%"
					temp = a Mod b
				Case "^"
					temp = a ^ b
				Case "="
					temp = a = b
			End Select
			
			push(String(temp))
		End If
		i:+1
	Wend
	
	Return Int(pop())
End Function

Function isdigit:Byte(ch:String)
	Local c:Byte = Asc(ch)
	Return (c >= Asc("0") And c <= Asc("9"))
End Function

Function isop:Byte(ch:String)
	Select ch
		Case "+", "-", "/", "*", "%", "^", "="
			Return True
		Default
			Return False
	End Select
End Function