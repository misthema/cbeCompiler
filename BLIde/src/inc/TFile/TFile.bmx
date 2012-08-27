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
	Local fileStream:TStream = ReadFile(f.path + f._filename)
	
	If Not fileStream Throw "File doesn't exist!"
	
	While Not fileStream.Eof()
		Local _line:String = fileStream.ReadLine()
		
		If Instr(_line, "Include")
			'f.includes.AddFirst _line.Split(" ")[1].Replace("~q", "")
			AddFile f.path + _line.Split(" ")[1].Replace("~q", "")
		End If
	Wend
End Function

Function fprint()
	For Local f:TFile = EachIn FileList
		Print f._filename
	Next
End Function