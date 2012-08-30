SuperStrict
Import brl.FileSystem
Import BRL.Retro



rem
	bbdoc: Type description
end rem
Type TFile
	Field _filename:String
	Field path:String
End Type

Global FileList:TList = New TList

Function AddFile(filename:String, main_:Byte = False)
	Local f:TFile = New TFile
	
	filename = filename.Replace("\", "/")
	
	f._filename = StripDir(filename)
	f.path = ExtractDir(filename) + "/"
	
	FileList.AddLast f
	FindIncludes f
End Function

Function FindIncludes(f:TFile)

	WriteStdout "FincIncludes():~n  path: " + f.path + "~n  file: " + f._filename + "~n"

	Local fileStream:TStream = ReadFile(f.path + f._filename)
	
	If Not fileStream Throw "File '" + f.path + f._filename + "' doesn't exist!"
	
	While Not fileStream.Eof()
		Local _line:String = fileStream.ReadLine()
		
		Local incPos:Int = Instr(_line, "Include")
		Local incFileStart:Int = Instr(_line, "~q", incPos)
		Local incFileEnd:Int = Instr(_line, "~q", incFileStart + 1)
		
		If incPos > 0 And incFileStart > 0 And incFileEnd > incFileStart
			AddFile f.path + Mid(_line, incFileStart, incFileEnd - incFileStart).Replace("~q", "")
		End If
	Wend
End Function

Function fprint()
	For Local f:TFile = EachIn FileList
		Print f._filename
	Next
End Function