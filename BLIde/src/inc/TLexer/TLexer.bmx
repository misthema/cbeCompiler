SuperStrict
Import BRL.FileSystem
Import BRL.TextStream
Import BRL.StandardIO
Import "../TToken/TToken.bmx"
Import "../misc.bmx"

Global noErrors:Byte
? Debug
	noErrors = False
? Not Debug
	noErrors = False
?

rem
	bbdoc: Type description
end rem
Type TLexer
	Field _fileName:String
	Field _filePath:String
	Field _run:Byte
	Field _source:String
	Field _length:Int
	Field _sourceStart:Byte Ptr
	Field _sourceEnd:Byte Ptr
	Field _tokens:TToken[]
	Field _error:String
	Field _current:TTokenMark
	Field _symbolised:Byte = False
	Field _globalised:Byte = False
	
	Method InitWithSource:Byte(path:String, file:String)
		If _current
			Throw "Lexer already initialized"
		EndIf
		
		_fileName = StripDir(file)
		If path.Length > 0 Then
			_filePath = path
		Else
			_filePath = ExtractDir(file)
		EndIf
		
		If FileType(_filePath + _filename) = 0 doError("File doesn't exist!")
		
		_source = LoadText(_filePath + _fileName)
		
		? Debug
			Print _fileName + " size: " + _source.Length + " bytes"
		?
		
		_current = New TTokenMark
		_current.place = _source.ToCString()
		_current.Line = 1
		_current.column = 1
		
		_sourceStart = _current.place
		_sourceEnd = _current.place + _source.Length
		_length = _source.Length
		_error = Null
		_run = False
		
	End Method
	
	' ***** LEXER RUN *****
	Method Run:Byte()
		If Not _current Or _run
			_error = "File " + _fileName + " already scanned!"
			Return True
		EndIf
		
		Local mark:TTokenMark = New TTokenMark
		Local comment:TToken = New TToken
		Local token:TToken = New TToken
		Local cur:Byte
		
		comment.kind = TOK_INVALID
		
		
		' ** Main Loop **
		While lexerHasNext()
			token.kind = TOK_INVALID
			skipWhiteSpace
			
			mark = lexerMark()
			cur = lexerCurrent()
			
			If cur = 0 Then Continue
			
			If comment.kind = TOK_INVALID
				
				If cur = Asc(".")
					If isdigit(lexerPeek())
						token = readNumber()
					Else
						' Meh, it's only a dot :<
						token.kind = TOK_DOT
						token._from = mark.place
						token._to = _current.place
						token.Line = mark.Line
						token.column = mark.column
					End If
					
				End If
			
				If cur = Asc("$") And isxdigit(lexerPeek())
					token = readBaseNumber()
				End If
				
				If isdigit(cur)
					token = readNumber()
				End If
				
				If cur = Asc("'")
					'token = readLineComment()
					readLineComment()
				End If
				
				If cur = Asc("/") And lexerPeek() = Asc("/")
					'token = readLineComment()
					readLineComment()
				End If
				
				If cur = Asc("~q")
					token = _readString()
				End If
				
				If token.kind = TOK_INVALID
					Local alter:Int = tokenKindForSingle(_current.place, 1)
					If alter <> TOK_INVALID
						token.kind = alter
						token._from = mark.place
						token._to = _current.place + 1
						token.Line = mark.Line
						token.column = mark.column
					End If
				End If
			End If
			
			If isalpha(cur)
				token = readWord()
			End If
			
			If Not(token.kind = TOK_INVALID) And comment.kind = TOK_INVALID
				AddToken token
			End If
			
			
			lexerNext()
		Wend
		' ^^ Main Loop ^^
		
		' End-of-file
		token.kind = TOK_EOF
		token.Line = _current.Line
		token.column = _current.column
		token._from = _current.place
		token._to = Null
		AddToken token
		
		
		runTokenMerge
		resizeTokenArray

		
		Return False
	End Method
	
	Method resizeTokenArray()
		Local i:Int
		For i = 0 To _tokens.Length - 1
			If _tokens[i].kind = TOK_EOF
				Exit
			End If
		Next
		
		_tokens = _tokens[..i+1]
	End Method
	
	Method AddToken(token:TToken)
		_current.token:+1
		token._string = token.ExportString()
		_tokens:+[token.copy()]
		
		'newToken.kind = token.kind
		'newToken.Line = token.Line
		'newToken.column = token.column
		'newToken._from = token._from
		'newToken._to = token._to
	End Method


	Method runTokenMerge:Byte()
		Local tleft:TToken, tright:TToken
		Local tokenIter:Int = 0
		Local pairIter:Int = 0
		Local merged:Byte
		
		While _tokens[tokenIter].kind <> TOK_EOF
			merged = False
			tleft = _tokens[tokenIter]
			tright = _tokens[tokenIter + 1]
			
			pairIter = 0
			While pairIter < tokenPair.length
				If tokenPair[pairIter]._left = tleft.kind And tokenPair[pairIter]._right = tright.kind 'And tright._from <= tleft._to + tokenPair[pairIter].range

					If tokenPair[pairIter].kind = TOK_LABEL And _tokens[tokenIter + 2].kind = TOK_NEWLINE
						? Debug
							Print "Merge: " + tokenToString(tleft.kind) + " + " + tokenToString(tright.kind) + " = " + tokenToString(tokenPair[pairIter].kind)
						?
						mergeTokens(tokenIter, tokenIter + 1, tokenPair[pairIter].kind)
						merged = True
					ElseIf Not tokenPair[pairIter].kind = TOK_LABEL
						Print "Merge: " + tokenToString(tleft.kind) + " + " + tokenToString(tright.kind) + " = " + tokenToString(tokenPair[pairIter].kind)
						mergeTokens(tokenIter, tokenIter + 1, tokenPair[pairIter].kind)
						merged = True
					End If
					
					

					Exit
				End If
				
				pairIter:+1
			Wend
			'If Not merged
				tokenIter:+1
			'End If
		Wend
	End Method
	
	Method mergeTokens(from:Int, _to:Int, newkind:Int)
		_tokens[from]._to = _tokens[_to]._to
		_tokens[from].kind = newkind
		
		Local offset:Int = from - _to
		Local idx:Int
		
		For idx = _to + 1 Until _tokens.Length
			_tokens[idx + offset] = _tokens[idx]
		Next
		
		
		
		_current.token:+offset
		
	End Method
	
	Method skipWhiteSpace()
		Local cur:Byte = lexerCurrent()
		While (cur = Asc(" ") Or cur = Asc("~t") Or cur = Asc("~r")) And lexerHasNext()
			cur = lexerNext()
		WEnd
	End Method
	
	Method readLineComment:TToken()
		'Local mark:TTokenMark = lexermark()
		'Local token:TToken = New TToken
		Local cur:Byte
		
		'token.kind = TOK_LINE_COMMENT
		'token.Line = mark.Line
		'token.column = mark.column
		'token._from = mark.place
		'token._to = Null
		
		While cur <> Asc("~n")
			cur = lexerNext()
		Wend
		
		'token._to = _current.place
		
		'Return token
		
	End Method
	
	Method _readString:TToken()
		Local mark:TTokenMark = lexermark()
		Local token:TToken = New TToken
		Local cur:Byte = lexerNext()
		
		token.kind = TOK_STRING_LIT
		token.Line = mark.Line
		token.column = mark.column
		token._from = mark.place
		token._to = Null
		
		'cur = lexerNext()
		While lexerHasNext() And cur <> Asc("~q")
			
			If cur = Asc("~n")
				doError("String literal does not terminate before newline or EOF.")
			End If
			
			cur = lexerNext()
		Wend
		
		token._to = _current.place
		
		Return token
		
	End Method
	
	Method readWord:TToken()
		Local mark:TTokenMark = lexermark()
		Local token:TToken = New TToken
		Local cur:Byte
		
		token.kind = TOK_ID
		token.Line = mark.Line
		token.column = mark.column
		token._from = mark.place
		token._to = Null
		
		While lexerHasNext()
			cur = lexerPeek()
			If isalpha(cur) Or isdigit(cur)
				lexerNext()
			Else
				Exit
			End If
		Wend
		
		'lexerNext()
		token._to = _current.place + 1
		
		Local alter:Int = tokenKindForSingle(token._from, (token._to - token._from))
		If Not(alter = TOK_INVALID)
			token.kind = alter
		End If
		
		Return token
	End Method
	
	Method readNumber:TToken()
		Local cur:Byte = lexerCurrent()
		Local token:TToken = New TToken
		Local mark:TTokenMark = lexerMark()
		
		Local isDec:Byte = False
		Local isExp:Byte = False
		
		If cur = Asc(".") isDec = True
		
		token.kind = TOK_NUMBER_LIT
		token.Line = mark.Line
		token.column = mark.column
		token._from = mark.place
		token._to = Null
		
		While lexerHasNext() And Not(cur = 0)
		
			cur = lexerPeek()
		
			If cur = Asc(".")
				If isDec
					Exit
				End If
				
				isDec = True
				cur = lexerNext()
				Continue
			End If
			
			If isdigit(cur) cur = lexerNext() ;Continue
			
			' e = *x^10
			Rem
			If cur = Asc("e") Or cur = Asc("E")
				If isExp
					Throw doError("Malformed number literal encountered.~r~nExponent already provided.")
				End If
				
				isExp = True
				
				cur = lexerPeek()
				
				If cur = Asc("+") Or cur = Asc("-")
					lexerNext()
					cur = lexerPeek()
				End If
				
				If Not isdigit(cur)
					Throw doError("Malformed number literal encountered.~r~nExponent expected but not found")
				End If
				
				cur = lexerNext()
				Continue
			End If
			endrem
			
			Exit
		Wend
		
		token._to = _current.place + 1
		
		'ExportString(token)
		
		Return token
	End Method
	
	Method readBaseNumber:TToken()
		Local cur:Byte = lexerCurrent()
		Local token:TToken = New TToken
		Local mark:TTokenMark = lexerMark()
		
		token.kind = TOK_NUMBER_LIT
		token.Line = mark.Line
		token.column = mark.column
		token._from = mark.place
		token._to = Null
		
		If cur = Asc("$") ' Hexadecimal
			cur = lexerNext()
			While lexerHasNext() And isxdigit(cur)
				cur = lexerNext()
			Wend
		EndIf
		
		'lexerNext()
		token._to = _current.place
		
		'ExportString(token)
		
		Return token
		
	End Method
	
	Method tokenKindForSingle:Int(single:Byte Ptr, _len:Int)
		Local t:TTokenSingle

		For t = EachIn tokenSingle
			If t.matches.Length = _len And strcmp(t.matches, single, _len)
				Return t.kind
			EndIf
		Next
		
		Return TOK_INVALID
			
	End Method
	
	Method strcmp:Int(toWhat:String, start:Byte Ptr, _len:Int)
		Local cur:Byte Ptr = start
		Local stop:Byte Ptr = start + _len
		Local ex:String = ""
		
		While cur < stop
			ex:+Chr(cur[0])
			cur:+1
		Wend
		
		Return (toWhat.ToLower() = ex.ToLower())
		
	End Method
	
	Method ExportString:String(token:TToken)
		Local cur:Byte Ptr = token._from
		Local stop:Byte Ptr = token._to
		Local ex:String = ""
		
		While cur < stop
			ex:+Chr(cur[0])
		Wend
		
		Print "ExportString: " + ex
	End Method
	
'	Method ReadWord:TToken()
'		If _current.place[0] <> Null
'			Print Chr(_current.place[0]) + " [" + _current.Line + ":" + _current.column + "]"
'		EndIf
'	End Method
	
	Method lexerMark:TTokenMark()
		Return _current
	End Method
	
	Method lexerCurrent:Byte()
		Return _current.place[0]
	End Method
	
	Method lexerPtr:Byte Ptr()
		Return _current.place
	End Method
	
	Method lexerNext:Byte()
		If _current
			If _current.place[0] = Asc("~n")
				_current.Line:+1
				_current.column = 1
			Else
				_current.column:+1
			EndIf
			
			'Increase if has next
			If lexerHasNext() _current.place:+1
			Return _current.place[0]' | 0
		Else
			_error = "Lexer not initialized with source code!"
		End If
	End Method
	
	Method lexerPeek:Byte()
		Return (_current.place + 1)[0]
	End Method
	
	Method lexerHasNext:Byte()
		Return _current.place<_sourceEnd
	End Method
	
	Method getError:String()
		Return _error
	End Method
	
	Method doLineError(msg:String, line:Int = Null, col:Int = Null)
		If Not noErrors
			If Not(line And col)
				Throw _fileName + " [" + _current.line + ":" + _current.column + "]~n" + msg
			Else
				Throw _fileName + " [" + line + ":" + col + "]~n" + msg
			EndIf
		EndIf
	End Method
	
	Method doError(msg:String)
		If Not noErrors
			Throw _fileName + "~n" + msg
		EndIf
	End Method
	
End Type


