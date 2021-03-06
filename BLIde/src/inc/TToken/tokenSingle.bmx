rem
	bbdoc: Type description
end rem
Type TTokenSingle
	Field kind:Int
	Field matches:String
	Field case_sensitive:Byte
End Type

Global tokenSingle:TTokenSingle[]

Function AddTokenSingle(kind:Int, matches:String, case_sensitive:Byte = False)
	Local toks:TTokenSingle = New TTokenSingle
	
	toks.kind = kind
	toks.matches = matches
	toks.case_sensitive = case_sensitive
	
	tokenSingle:+[toks]
EndFunction

'#region singleToken[]
AddTokenSingle TOK_ABS_KW, "abs"
AddTokenSingle TOK_ACOS_KW, "acos"
AddTokenSingle TOK_ADDTEXT_KW, "addtext"
AddTokenSingle TOK_AFTER_KW, "after"
AddTokenSingle TOK_AND_KW, "and"
AddTokenSingle TOK_ANIMATIONHEIGHT_KW, "animationheight"
AddTokenSingle TOK_ANIMATIONPLAYING_KW, "animationplaying"
AddTokenSingle TOK_ANIMATIONWIDTH_KW, "animationwidth"
AddTokenSingle TOK_AS_KW, "as"
AddTokenSingle TOK_ASC_KW, "asc"
AddTokenSingle TOK_ASIN_KW, "asin"
AddTokenSingle TOK_ATAN_KW, "atan"
AddTokenSingle TOK_BEFORE_KW, "before"
AddTokenSingle TOK_BIN_KW, "bin"
AddTokenSingle TOK_BLUE_KW, "blue"
AddTokenSingle TOK_BOX_KW, "box"
AddTokenSingle TOK_BOXOVERLAP_KW, "boxoverlap"
AddTokenSingle TOK_BYTE_KW, "byte"
AddTokenSingle TOK_CALLDLL_KW, "calldll"
AddTokenSingle TOK_CAMERAANGLE_KW, "cameraangle"
AddTokenSingle TOK_CAMERAFOLLOW_KW, "camerafollow"
AddTokenSingle TOK_CAMERAPICK_KW, "camerapick"
AddTokenSingle TOK_CAMERAX_KW, "camerax"
AddTokenSingle TOK_CAMERAY_KW, "cameray"
AddTokenSingle TOK_CASE_KW, "case"
AddTokenSingle TOK_CENTERTEXT_KW, "centertext"
AddTokenSingle TOK_CHDIR_KW, "chdir"
AddTokenSingle TOK_CHR_KW, "chr"
AddTokenSingle TOK_CIRCLE_KW, "circle"
AddTokenSingle TOK_CLEARARRAY_KW, "cleararray"
AddTokenSingle TOK_CLEARCOLLISIONS_KW, "clearcollisions"
AddTokenSingle TOK_CLEARKEYS_KW, "clearkeys"
AddTokenSingle TOK_CLEARMOUSE_KW, "clearmouse"
AddTokenSingle TOK_CLEAROBJECTS_KW, "clearobjects"
AddTokenSingle TOK_CLEARTEXT_KW, "cleartext"
AddTokenSingle TOK_CLONECAMERAORIENTATION_KW, "clonecameraorientation"
AddTokenSingle TOK_CLONECAMERAPOSITION_KW, "clonecameraposition"
AddTokenSingle TOK_CLONEIMAGE_KW, "cloneimage"
AddTokenSingle TOK_CLONEOBJECT_KW, "cloneobject"
AddTokenSingle TOK_CLONEOBJECTORIENTATION_KW, "cloneobjectorientation"
AddTokenSingle TOK_CLONEOBJECTPOSITION_KW, "cloneobjectposition"
AddTokenSingle TOK_CLOSEFILE_KW, "closefile"
AddTokenSingle TOK_CLOSEINPUT_KW, "closeinput"
AddTokenSingle TOK_CLS_KW, "cls"
AddTokenSingle TOK_CLSCOLOR_KW, "clscolor"
AddTokenSingle TOK_COLLISIONANGLE_KW, "collisionangle"
AddTokenSingle TOK_COLLISIONX_KW, "collisionx"
AddTokenSingle TOK_COLLISIONY_KW, "collisiony"
AddTokenSingle TOK_COLOR_KW, "color"
AddTokenSingle TOK_COMMANDLINE_KW, "commandline"
AddTokenSingle TOK_CONST_KW, "const"
AddTokenSingle TOK_CONVERTTOINTEGER_KW, "converttointeger"
AddTokenSingle TOK_CONVERTTOTYPE_KW, "converttotype"
AddTokenSingle TOK_COPYBOX_KW, "copybox"
AddTokenSingle TOK_COPYFILE_KW, "copyfile"
AddTokenSingle TOK_COS_KW, "cos"
AddTokenSingle TOK_COUNTCOLLISIONS_KW, "countcollisions"
AddTokenSingle TOK_COUNTWORDS_KW, "countwords"
AddTokenSingle TOK_CRC32_KW, "crc32"
AddTokenSingle TOK_CURRENTDIR_KW, "currentdir"
AddTokenSingle TOK_CURVEANGLE_KW, "curveangle"
AddTokenSingle TOK_CURVEVALUE_KW, "curvevalue"
AddTokenSingle TOK_DATA_KW, "data"
AddTokenSingle TOK_DATE_KW, "date"
AddTokenSingle TOK_DECRYPT_KW, "decrypt"
AddTokenSingle TOK_DEFAULT_KW, "default"
AddTokenSingle TOK_DEFAULTMASK_KW, "defaultmask"
AddTokenSingle TOK_DEFAULTVISIBLE_KW, "defaultvisible"
AddTokenSingle TOK_DELETE_KW, "delete"
AddTokenSingle TOK_DELETEFILE_KW, "deletefile"
AddTokenSingle TOK_DELETEFONT_KW, "deletefont"
AddTokenSingle TOK_DELETEIMAGE_KW, "deleteimage"
AddTokenSingle TOK_DELETEMEMBLOCK_KW, "deletememblock"
AddTokenSingle TOK_DELETEOBJECT_KW, "deleteobject"
AddTokenSingle TOK_DELETESOUND_KW, "deletesound"
AddTokenSingle TOK_DIM_KW, "dim"
AddTokenSingle TOK_DISTANCE_KW, "distance"
AddTokenSingle TOK_DISTANCE2_KW, "distance2"
AddTokenSingle TOK_DOT_KW, "dot"
AddTokenSingle TOK_DOWNKEY_KW, "downkey"
AddTokenSingle TOK_DRAWANIMATION_KW, "drawanimation"
AddTokenSingle TOK_DRAWGAME_KW, "drawgame"
AddTokenSingle TOK_DRAWGHOSTIMAGE_KW, "drawghostimage"
AddTokenSingle TOK_DRAWIMAGE_KW, "drawimage"
AddTokenSingle TOK_DRAWIMAGEBOX_KW, "drawimagebox"
AddTokenSingle TOK_DRAWSCREEN_KW, "drawscreen"
AddTokenSingle TOK_DRAWTOIMAGE_KW, "drawtoimage"
AddTokenSingle TOK_DRAWTOSCREEN_KW, "drawtoscreen"
AddTokenSingle TOK_DRAWTOWORLD_KW, "drawtoworld"
AddTokenSingle TOK_EACH_KW, "each"
AddTokenSingle TOK_EDITMAP_KW, "editmap"
AddTokenSingle TOK_ELLIPSE_KW, "ellipse"
AddTokenSingle TOK_ELSE_KW, "else"
AddTokenSingle TOK_ELSEIF_KW, "elseif"
AddTokenSingle TOK_ENCRYPT_KW, "encrypt"
AddTokenSingle TOK_END_KW, "end"
AddTokenSingle TOK_ENDFUNCTION_KW, "endfunction"
AddTokenSingle TOK_ENDIF_KW, "endif"
AddTokenSingle TOK_ENDSELECT_KW, "endselect"
AddTokenSingle TOK_ENDTYPE_KW, "endtype"
AddTokenSingle TOK_ENDSEARCH_KW, "endsearch"
AddTokenSingle TOK_EOF_KW, "eof"
AddTokenSingle TOK_ERRORS_KW, "errors"
AddTokenSingle TOK_ESCAPEKEY_KW, "escapekey"
AddTokenSingle TOK_EXECUTE_KW, "execute"
AddTokenSingle TOK_EXIT_KW, "exit"
AddTokenSingle TOK_FALSE_KW, "false"
AddTokenSingle TOK_FIELD_KW, "field"
AddTokenSingle TOK_FILEEXISTS_KW, "fileexists"
AddTokenSingle TOK_FILEOFFSET_KW, "fileoffset"
AddTokenSingle TOK_FILESIZE_KW, "filesize"
AddTokenSingle TOK_FINDFILE_KW, "findfile"
AddTokenSingle TOK_FIRST_KW, "first"
AddTokenSingle TOK_FLIP_KW, "flip"
AddTokenSingle TOK_FLOAT_KW, "float"
AddTokenSingle TOK_FOR_KW, "for"
AddTokenSingle TOK_FOREVER_KW, "forever"
AddTokenSingle TOK_FPS_KW, "fps"
AddTokenSingle TOK_FRAMELIMIT_KW, "framelimit"
AddTokenSingle TOK_FUNCTION_KW, "function"
AddTokenSingle TOK_GETANGLE_KW, "getangle"
AddTokenSingle TOK_GETANGLE2_KW, "getangle2"
AddTokenSingle TOK_GETCOLLISION_KW, "getcollision"
AddTokenSingle TOK_GETEXENAME_KW, "getexename"
AddTokenSingle TOK_GETKEY_KW, "getkey"
AddTokenSingle TOK_GETMAP_KW, "getmap"
AddTokenSingle TOK_GETMAP2_KW, "getmap2"
AddTokenSingle TOK_GETMOUSE_KW, "getmouse"
AddTokenSingle TOK_GETPIXEL_KW, "getpixel"
AddTokenSingle TOK_GETPIXEL2_KW, "getpixel2"
AddTokenSingle TOK_GETRGB_KW, "getrgb"
AddTokenSingle TOK_GETWORD_KW, "getword"
AddTokenSingle TOK_GFXMODEEXISTS_KW, "gfxmodeexists"
AddTokenSingle TOK_GHOSTOBJECT_KW, "ghostobject"
AddTokenSingle TOK_GLOBAL_KW, "global"
AddTokenSingle TOK_GOSUB_KW, "gosub"
AddTokenSingle TOK_GOTO_KW, "goto"
AddTokenSingle TOK_GOTOSAVEDLOCATION_KW, "gotosavedlocation"
AddTokenSingle TOK_GREEN_KW, "green"
AddTokenSingle TOK_HEX_KW, "hex"
AddTokenSingle TOK_HOTSPOT_KW, "hotspot"
AddTokenSingle TOK_IF_KW, "if"
AddTokenSingle TOK_IMAGE_KW, "image"
AddTokenSingle TOK_IMAGEHEIGHT_KW, "imageheight"
AddTokenSingle TOK_IMAGESCOLLIDE_KW, "imagescollide"
AddTokenSingle TOK_IMAGESOVERLAP_KW, "imagesoverlap"
AddTokenSingle TOK_IMAGEWIDTH_KW, "imagewidth"
AddTokenSingle TOK_INCLUDE_KW, "include"
AddTokenSingle TOK_INITOBJECTLIST_KW, "initobjectlist"
AddTokenSingle TOK_INPUT_KW, "input"
AddTokenSingle TOK_INSERT_KW, "insert"
AddTokenSingle TOK_INSTR_KW, "instr"
AddTokenSingle TOK_INT_KW, "int"
AddTokenSingle TOK_ISDIRECTORY_KW, "isdirectory"
AddTokenSingle TOK_KEYDOWN_KW, "keydown"
AddTokenSingle TOK_KEYHIT_KW, "keyhit"
AddTokenSingle TOK_KEYUP_KW, "keyup"
AddTokenSingle TOK_LAST_KW, "last"
AddTokenSingle TOK_LEFT_KW, "left"
AddTokenSingle TOK_LEFTKEY_KW, "leftkey"
AddTokenSingle TOK_LEN_KW, "len"
AddTokenSingle TOK_LINE_KW, "line"
AddTokenSingle TOK_LOADANIMIMAGE_KW, "loadanimimage"
AddTokenSingle TOK_LOADANIMOBJECT_KW, "loadanimobject"
AddTokenSingle TOK_LOADFONT_KW, "loadfont"
AddTokenSingle TOK_LOADIMAGE_KW, "loadimage"
AddTokenSingle TOK_LOADMAP_KW, "loadmap"
AddTokenSingle TOK_LOADOBJECT_KW, "loadobject"
AddTokenSingle TOK_LOADPROGRAM_KW, "loadprogram"
AddTokenSingle TOK_LOADSOUND_KW, "loadsound"
AddTokenSingle TOK_LOCATE_KW, "locate"
AddTokenSingle TOK_LOCK_KW, "lock"
AddTokenSingle TOK_LOG_KW, "log"
AddTokenSingle TOK_LOG10_KW, "log10"
AddTokenSingle TOK_LOOPOBJECT_KW, "loopobject"
AddTokenSingle TOK_LOWER_KW, "lower"
AddTokenSingle TOK_LSET_KW, "lset"
AddTokenSingle TOK_MAKEDIR_KW, "makedir"
AddTokenSingle TOK_MAKEEMITTER_KW, "makeemitter"
AddTokenSingle TOK_MAKEERROR_KW, "makeerror"
AddTokenSingle TOK_MAKEIMAGE_KW, "makeimage"
AddTokenSingle TOK_MAKEMAP_KW, "makemap"
AddTokenSingle TOK_MAKEMEMBLOCK_KW, "makememblock"
AddTokenSingle TOK_MAKEOBJECT_KW, "makeobject"
AddTokenSingle TOK_MAKEOBJECTFLOOR_KW, "makeobjectfloor"
AddTokenSingle TOK_MAPHEIGHT_KW, "mapheight"
AddTokenSingle TOK_MAPWIDTH_KW, "mapwidth"
AddTokenSingle TOK_MASKIMAGE_KW, "maskimage"
AddTokenSingle TOK_MASKOBJECT_KW, "maskobject"
AddTokenSingle TOK_MAX_KW, "max"
AddTokenSingle TOK_MEMBLOCKSIZE_KW, "memblocksize"
AddTokenSingle TOK_MEMCOPY_KW, "memcopy"
AddTokenSingle TOK_MIN_KW, "min"
AddTokenSingle TOK_MID_KW, "mid"
AddTokenSingle TOK_MIRROROBJECT_KW, "mirrorobject"
AddTokenSingle TOK_MOD_KW, "mod"
AddTokenSingle TOK_MOUSEDOWN_KW, "mousedown"
AddTokenSingle TOK_MOUSEHIT_KW, "mousehit"
AddTokenSingle TOK_MOUSEMOVEX_KW, "mousemovex"
AddTokenSingle TOK_MOUSEMOVEY_KW, "mousemovey"
AddTokenSingle TOK_MOUSEMOVEZ_KW, "mousemovez"
AddTokenSingle TOK_MOUSEUP_KW, "mouseup"
AddTokenSingle TOK_MOUSEWX_KW, "mousewx"
AddTokenSingle TOK_MOUSEWY_KW, "mousewy"
AddTokenSingle TOK_MOUSEX_KW, "mousex"
AddTokenSingle TOK_MOUSEY_KW, "mousey"
AddTokenSingle TOK_MOVECAMERA_KW, "movecamera"
AddTokenSingle TOK_MOVEOBJECT_KW, "moveobject"
AddTokenSingle TOK_NEW_KW, "new"
AddTokenSingle TOK_NEXT_KW, "next"
AddTokenSingle TOK_NEXTOBJECT_KW, "nextobject"
AddTokenSingle TOK_NOT_KW, "not"
AddTokenSingle TOK_NULL_KW, "null"
AddTokenSingle TOK_OBJECTANGLE_KW, "objectangle"
AddTokenSingle TOK_OBJECTFLOAT_KW, "objectfloat"
AddTokenSingle TOK_OBJECTFRAME_KW, "objectframe"
AddTokenSingle TOK_OBJECTINTEGER_KW, "objectinteger"
AddTokenSingle TOK_OBJECTLIFE_KW, "objectlife"
AddTokenSingle TOK_OBJECTORDER_KW, "objectorder"
AddTokenSingle TOK_OBJECTPICK_KW, "objectpick"
AddTokenSingle TOK_OBJECTPICKABLE_KW, "objectpickable"
AddTokenSingle TOK_OBJECTPLAYING_KW, "objectplaying"
AddTokenSingle TOK_OBJECTRANGE_KW, "objectrange"
AddTokenSingle TOK_OBJECTSIGHT_KW, "objectsight"
AddTokenSingle TOK_OBJECTSIZEX_KW, "objectsizex"
AddTokenSingle TOK_OBJECTSIZEY_KW, "objectsizey"
AddTokenSingle TOK_OBJECTSOVERLAP_KW, "objectsoverlap"
AddTokenSingle TOK_OBJECTSTRING_KW, "objectstring"
AddTokenSingle TOK_OBJECTX_KW, "objectx"
AddTokenSingle TOK_OBJECTY_KW, "objecty"
AddTokenSingle TOK_OFF_KW, "off"
AddTokenSingle TOK_ON_KW, "on"
AddTokenSingle TOK_OPENTOEDIT_KW, "opentoedit"
AddTokenSingle TOK_OPENTOREAD_KW, "opentoread"
AddTokenSingle TOK_OPENTOWRITE_KW, "opentowrite"
AddTokenSingle TOK_OR_KW, "or"
AddTokenSingle TOK_PAINTOBJECT_KW, "paintobject"
AddTokenSingle TOK_PARTICLEANIMATION_KW, "particleanimation"
AddTokenSingle TOK_PARTICLEEMISSION_KW, "particleemission"
AddTokenSingle TOK_PARTICLEMOVEMENT_KW, "particlemovement"
AddTokenSingle TOK_PEEKBYTE_KW, "peekbyte"
AddTokenSingle TOK_PEEKFLOAT_KW, "peekfloat"
AddTokenSingle TOK_PEEKINT_KW, "peekint"
AddTokenSingle TOK_PEEKSHORT_KW, "peekshort"
AddTokenSingle TOK_PI_KW, "pi"
AddTokenSingle TOK_PICKCOLOR_KW, "pickcolor"
AddTokenSingle TOK_PICKEDANGLE_KW, "pickedangle"
AddTokenSingle TOK_PICKEDOBJECT_KW, "pickedobject"
AddTokenSingle TOK_PICKEDX_KW, "pickedx"
AddTokenSingle TOK_PICKEDY_KW, "pickedy"
AddTokenSingle TOK_PICKIMAGECOLOR_KW, "pickimagecolor"
AddTokenSingle TOK_PICKIMAGECOLOR2_KW, "pickimagecolor2"
AddTokenSingle TOK_PIXELPICK_KW, "pixelpick"
AddTokenSingle TOK_PLAYANIMATION_KW, "playanimation"
AddTokenSingle TOK_PLAYOBJECT_KW, "playobject"
AddTokenSingle TOK_PLAYSOUND_KW, "playsound"
AddTokenSingle TOK_POINTCAMERA_KW, "pointcamera"
AddTokenSingle TOK_POINTOBJECT_KW, "pointobject"
AddTokenSingle TOK_POKEBYTE_KW, "pokebyte"
AddTokenSingle TOK_POKEFLOAT_KW, "pokefloat"
AddTokenSingle TOK_POKEINT_KW, "pokeint"
AddTokenSingle TOK_POKESHORT_KW, "pokeshort"
AddTokenSingle TOK_POSITIONCAMERA_KW, "positioncamera"
AddTokenSingle TOK_POSITIONMOUSE_KW, "positionmouse"
AddTokenSingle TOK_POSITIONOBJECT_KW, "positionobject"
AddTokenSingle TOK_PRINT_KW, "print"
AddTokenSingle TOK_PUTPIXEL_KW, "putpixel"
AddTokenSingle TOK_PUTPIXEL2_KW, "putpixel2"
AddTokenSingle TOK_RAND_KW, "rand"
AddTokenSingle TOK_RANDOMIZE_KW, "randomize"
AddTokenSingle TOK_READ_KW, "read"
AddTokenSingle TOK_READBYTE_KW, "readbyte"
AddTokenSingle TOK_READFLOAT_KW, "readfloat"
AddTokenSingle TOK_READINT_KW, "readint"
AddTokenSingle TOK_READLINE_KW, "readline"
AddTokenSingle TOK_READSHORT_KW, "readshort"
AddTokenSingle TOK_READSTRING_KW, "readstring"
AddTokenSingle TOK_RED_KW, "red"
AddTokenSingle TOK_REDIM_KW, "redim"
AddTokenSingle TOK_REPEAT_KW, "repeat"
AddTokenSingle TOK_REPLACE_KW, "replace"
AddTokenSingle TOK_RESETOBJECTCOLLISION_KW, "resetobjectcollision"
AddTokenSingle TOK_RESIZEIMAGE_KW, "resizeimage"
AddTokenSingle TOK_RESIZEMEMBLOCK_KW, "resizememblock"
AddTokenSingle TOK_RESTORE_KW, "restore"
AddTokenSingle TOK_RETURN_KW, "return"
AddTokenSingle TOK_RIGHT_KW, "right"
AddTokenSingle TOK_RIGHTKEY_KW, "rightkey"
AddTokenSingle TOK_RND_KW, "rnd"
AddTokenSingle TOK_ROTATECAMERA_KW, "rotatecamera"
AddTokenSingle TOK_ROTATEIMAGE_KW, "rotateimage"
AddTokenSingle TOK_ROTATEOBJECT_KW, "rotateobject"
AddTokenSingle TOK_ROUNDDOWN_KW, "rounddown"
AddTokenSingle TOK_ROUNDUP_KW, "roundup"
AddTokenSingle TOK_RSET_KW, "rset"
AddTokenSingle TOK_SAFEEXIT_KW, "safeexit"
AddTokenSingle TOK_SAR_KW, "sar"
AddTokenSingle TOK_SAVEIMAGE_KW, "saveimage"
AddTokenSingle TOK_SAVEPROGRAM_KW, "saveprogram"
AddTokenSingle TOK_SCREEN_KW, "screen"
AddTokenSingle TOK_SCREENDEPTH_KW, "screendepth"
AddTokenSingle TOK_SCREENGAMMA_KW, "screengamma"
AddTokenSingle TOK_SCREENHEIGHT_KW, "screenheight"
AddTokenSingle TOK_SCREENPOSITIONOBJECT_KW, "screenpositionobject"
AddTokenSingle TOK_SCREENSHOT_KW, "screenshot"
AddTokenSingle TOK_SCREENWIDTH_KW, "screenwidth"
AddTokenSingle TOK_SEEKFILE_KW, "seekfile"
AddTokenSingle TOK_SELECT_KW, "select"
AddTokenSingle TOK_SETFONT_KW, "setfont"
AddTokenSingle TOK_SETMAP_KW, "setmap"
AddTokenSingle TOK_SETSOUND_KW, "setsound"
AddTokenSingle TOK_SETTILE_KW, "settile"
AddTokenSingle TOK_SETUPCOLLISION_KW, "setupcollision"
AddTokenSingle TOK_SETWINDOW_KW, "setwindow"
AddTokenSingle TOK_SHL_KW, "shl"
AddTokenSingle TOK_SHORT_KW, "short"
AddTokenSingle TOK_SHOWMOUSE_KW, "showmouse"
AddTokenSingle TOK_SHOWOBJECT_KW, "showobject"
AddTokenSingle TOK_SHR_KW, "shr"
AddTokenSingle TOK_SIN_KW, "sin"
AddTokenSingle TOK_SMOOTH2D_KW, "smooth2d"
AddTokenSingle TOK_SOUNDPLAYING_KW, "soundplaying"
AddTokenSingle TOK_SQRT_KW, "sqrt"
AddTokenSingle TOK_STARTSEARCH_KW, "startsearch"
AddTokenSingle TOK_STEP_KW, "step"
AddTokenSingle TOK_STOPANIMATION_KW, "stopanimation"
AddTokenSingle TOK_STOPOBJECT_KW, "stopobject"
AddTokenSingle TOK_STOPSOUND_KW, "stopsound"
AddTokenSingle TOK_STR_KW, "str"
AddTokenSingle TOK_STRING_KW, "string"
AddTokenSingle TOK_STRINSERT_KW, "strinsert"
AddTokenSingle TOK_STRMOVE_KW, "strmove"
AddTokenSingle TOK_STRREMOVE_KW, "strremove"
AddTokenSingle TOK_TAN_KW, "tan"
AddTokenSingle TOK_TEXT_KW, "text"
AddTokenSingle TOK_TEXTHEIGHT_KW, "textheight"
AddTokenSingle TOK_TEXTWIDTH_KW, "textwidth"
AddTokenSingle TOK_THEN_KW, "then"
AddTokenSingle TOK_TIME_KW, "time"
AddTokenSingle TOK_TIMER_KW, "timer"
AddTokenSingle TOK_TO_KW, "to"
AddTokenSingle TOK_TRANSLATECAMERA_KW, "translatecamera"
AddTokenSingle TOK_TRANSLATEOBJECT_KW, "translateobject"
AddTokenSingle TOK_TRIM_KW, "trim"
AddTokenSingle TOK_TRUE_KW, "true"
AddTokenSingle TOK_TURNCAMERA_KW, "turncamera"
AddTokenSingle TOK_TURNOBJECT_KW, "turnobject"
AddTokenSingle TOK_TYPE_KW, "type"
AddTokenSingle TOK_UNLOCK_KW, "unlock"
AddTokenSingle TOK_UNTIL_KW, "until"
AddTokenSingle TOK_UPDATEGAME_KW, "updategame"
AddTokenSingle TOK_UPKEY_KW, "upkey"
AddTokenSingle TOK_UPPER_KW, "upper"
AddTokenSingle TOK_VERTICALTEXT_KW, "verticaltext"
AddTokenSingle TOK_WAIT_KW, "wait"
AddTokenSingle TOK_WAITKEY_KW, "waitkey"
AddTokenSingle TOK_WAITMOUSE_KW, "waitmouse"
AddTokenSingle TOK_WEND_KW, "wend"
AddTokenSingle TOK_WHILE_KW, "while"
AddTokenSingle TOK_WRAPANGLE_KW, "wrapangle"
AddTokenSingle TOK_WRITE_KW, "write"
AddTokenSingle TOK_WRITEBYTE_KW, "writebyte"
AddTokenSingle TOK_WRITEFLOAT_KW, "writefloat"
AddTokenSingle TOK_WRITEINT_KW, "writeint"
AddTokenSingle TOK_WRITELINE_KW, "writeline"
AddTokenSingle TOK_WRITESHORT_KW, "writeshort"
AddTokenSingle TOK_WRITESTRING_KW, "writestring"
AddTokenSingle TOK_XOR_KW, "xor"
AddTokenSingle TOK_COLON, ":"
AddTokenSingle TOK_QUESTION, "?"
AddTokenSingle TOK_BANG, "!"
AddTokenSingle TOK_FLOAT_TYPE, "#"
AddTokenSingle TOK_DOT, "."
AddTokenSingle TOK_STRING_TYPE, "$"
AddTokenSingle TOK_INT_TYPE, "%"
AddTokenSingle TOK_SINGLEQUOTE, "'"
AddTokenSingle TOK_OPENPAREN, "("
AddTokenSingle TOK_CLOSEPAREN, ")"
AddTokenSingle TOK_OPENBRACKET, "["
AddTokenSingle TOK_CLOSEBRACKET, "]"
AddTokenSingle TOK_GREATERTHAN, ">"
AddTokenSingle TOK_LESSTHAN, "<"
AddTokenSingle TOK_EQUALS, "="
AddTokenSingle TOK_MINUS, "-"
AddTokenSingle TOK_PLUS, "+"
AddTokenSingle TOK_ASTERISK, "*"
AddTokenSingle TOK_CARET, "^"
AddTokenSingle TOK_BACKSLASH, "\"
AddTokenSingle TOK_SLASH, "/"
AddTokenSingle TOK_COMMA, ","
AddTokenSingle TOK_PIPE, "|"
AddTokenSingle TOK_AMPERSAND, "&"
AddTokenSingle TOK_NEWLINE, "~n"
AddTokenSingle TOK_REMSTART, "remstart"
AddTokenSingle TOK_REMEND, "remend"
AddTokenSingle TOK_INTEGER_KW, "integer"
AddTokenSingle TOK_INVALID, Null
'#endregion