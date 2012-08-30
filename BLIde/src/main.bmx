SuperStrict

Framework BRL.FileSystem
Import brl.standardio
Import brl.System

'Import "inc/TToken/TToken.bmx"
Import "inc/TLexer/TLexer.bmx"
Import "inc/TFile/TFile.bmx"
Import "inc/TScope/TScope.bmx"

Const CBEC_VERSION:String = "A#0.01"
AppTitle = "cbEnchanted Compiler " + CBEC_VERSION

Global TEST:Byte = True



? Not Debug
Try
?

	Local args:String[] = AppArgs
	Local path:String, source:String
	
	If Not TEST
		If args.Length < 2 Throw "No file input!"
		path = ExtractDir(args[1]) + "/".Replace("\", "/")
		source = StripDir(args[1])
	Else
		'path = "C:/Program Files (x86)/CoolBasic/Codes & Projects/Avaruusmätke/"
		'source = "main.cb"
		
		path = "../../test/"
		source = "hex.cb"
		
		'path = "C:/Program Files (x86)/CoolBasic/Codes & Projects/VesQ-NetMatch-e864029/cb_source/"
		'source = "NetMatch_TheEnd.cb"
	EndIf
		
	
	AddFile(path + source, True)
	
	fprint
	'End
	
	Local _lines:Int = 0
	Local _ttokens:TToken[]
	Global _lexers:TLexer[]
	
	
	
	Local totalTime:Int = 0, totalTime1:Int = 0, totalTime2:Int = 0
	WriteStdout "Scanning..."
	For Local file:TFile = EachIn FileList
		
		Local start:Int, _end:Int
		'WriteStdout "  ~q" + file._filename + "~q..."
		Local lexer:TLexer = New TLexer
		lexer.InitWithSource(file.path, file._filename)
		
		start = MilliSecs()
		lexer.Run
		_end = MilliSecs() - start
		totalTime1:+_end
		_lexers:+[lexer]
		
		'WriteStdout "DONE (" + _end + "ms)~n"
		_lines:+lexer._current.Line
		_ttokens:+lexer._tokens
	Next
	WriteStdout "DONE (" + totalTime1 + "ms)~n"
	
	For Local lex:TLexer = EachIn _lexers
		For Local tok:TToken = EachIn lex._tokens
			Print tok._string + " = " + tok.kind
		Next
	Next
	
	WriteStdout "Symbolising..."
	'For Local lexer:TLexer = EachIn _lexers
		Local start:Int, _end:Int
		
		' Symbolising tokens is recursive, so we don't want to run them again...
		' This system is pretty fucked up, but hey, I'm new to this kind of things! :-)
		'If lexer._symbolised = False
			'WriteStdout "  ~q" + lexer._fileName + "~q..."
			
			start = MilliSecs()
			ScopeTokens(_lexers[0], FindFileLexer, True)
			'ScopeTokens(_lexers[0], FindFileLexer, False)
			_end = MilliSecs() - start
			totalTime2:+_end
			
			'WriteStdout "DONE (" + _end + "ms)~n"
		'EndIf
		
		
	'Next
	
	WriteStdout "DONE (" + totalTime2 + "ms)~n"
	
	totalTime = totalTime1 + totalTime2
	
	Print "Scanned and symbolised " + FileList.Count() + " files (" + _lines + " lines) in " + (totalTime) + "ms"
	Print "Tokens: " + _ttokens.length

	system_("PAUSE")
	
	End
	
	Function FindFileLexer:TLexer(_filename:String)
		_filename = StripDir(_filename)
		For Local l:TLexer = EachIn _lexers
			If l._filename = _filename Return l
		Next
		Return Null
	End Function

? Not Debug
Catch exceptionError:String
	Notify "ERROR: " + exceptionError, True
	End
EndTry
?

