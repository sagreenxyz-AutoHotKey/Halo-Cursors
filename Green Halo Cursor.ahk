#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance Force

Cursor = C:\Users\sagre\OneDrive\Keep\Assets\Cursors\rev3626\green highlight.cur

    CursorHandle := DllCall( "LoadCursorFromFile", Str,Cursor )

    ; change cursor size
    IMAGE_BITMAP := 0x0
    IMAGE_CURSOR := 0x2
    IMAGE_ICON := 0x1

    ; size
    cx := 48, cy := cx

    ; fuFlags
    LR_COPYFROMRESOURCE := 0x4000

    CursorHandle := DllCall( "CopyImage", uint,CursorHandle, uint,IMAGE_CURSOR, int,cx, int,cy, uint,0 )

    ; replace cursor
    Cursors = 32512,32513,32514,32515,32516,32640,32641,32642
             ,32643,32644,32645,32646,32648,32649,32650,32651
    Loop, Parse, Cursors, `,
        DllCall( "SetSystemCursor", Uint,CursorHandle, Int,A_Loopfield )

return ; end of auto-execute section


$Esc:: ; restore system cursor
    SPI_SETCURSORS := 0x57
    DllCall( "SystemParametersInfo", UInt,SPI_SETCURSORS, UInt,0, UInt,0, UInt,0 )
    ExitApp

return