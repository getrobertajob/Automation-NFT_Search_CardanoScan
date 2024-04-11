#Created by Robert Lute
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir%A_ScriptDir%  ; Ensures a consistent starting directory.


WinGetTitle, winid, A
init := 1
DetectHiddenWindows, On
Gui Font, s100
Gui, add, Text, vMyText x - 8 y - 45 gMove, %Chr(9679)
Gui - Caption + AlwaysOnTop + LastFound
WinSet, TransColor, 0xF0F0F0
Gui Show, w70 h70


;Variables
;-------------
VarTog = False ;Variable to toggle all of the buttons on/off
VarTogKey = False ;Variable to check if individual buttons are on
VarCurColor = 0x800080
VarCount = 0
VarMin = 100
VarMax = 200
VarMinC = 1500
VarMaxC = 2000
VarNFT = 8179


;Sets starting Toggle mode and MaxThreads
;-------------------------------------------------------------
toggle = 0
#MaxThreadsPerHotkey 2


;Function to randomize pause for button loop for letter keys
;-------------------------------------------------------------
_ran(min, max)
{
    random, ran, %min%, %max%
    ;send %ran%
    return ran
}


;Script to change toggle for all keys, including an interupt
;------------------------------------------------------------------------------
$F12::
Gui Font, cBlack
GuiControl, Font, MyText
if (VarTog = "True")
{
    VarTog = False
    if (VarTogKey = "True")
    {
        Toggle := !Toggle
        VarTogKey = False
        t := !t
    }
}
else if (VarTogKey = "True")
{
    Toggle := !Toggle
    VarTogKey = False
    t := !t
}
else
{
    VarTog = True
    Gui Font, cYellow
    GuiControl, Font, MyText
}
Return


;Script to run for t button
;-------------------------------------------------
$t::
if (VarTog = "True")
{
    if (t := !t) {
        Gui Font, cGreen
        GuiControl, Font, MyText
    } else {
        Gui Font, cRed
        GuiControl, Font, MyText
    }
}
if (VarTog = "True")
{
    Toggle := !Toggle
    While Toggle
    {
        If !Toggle
            Break
        VarTogKey = True
        GetKeyState, state, Shift
        if (state = "D")
        {
            Send, {
                Shift down} {
                    F10}
        }
        else
        Send, ^ f
        Sleep, 1000
        Send, %VarNFT%
        Sleep, 3000
        MouseMove, 1765, 95
        Sleep, 1000
        MouseGetPos, MouseX, MouseY
        PixelGetColor, color, %MouseX%, %MouseY%
        Sleep, 1000

        if color = 0xECEBEB
        {
            MsgBox YES it is Found.
            Break
        }
        else
        {
            Sleep, 1000
            MouseMove, 1665, 270
            Sleep, 1000
            MouseClick, left
            Sleep, 1000
            MouseMove, 1665, 370
            Sleep, 1000
            Send {
                Home}
            Sleep, 1000
            MouseClick, left
        }
        If !Toggle
            Break
    }
}
else
{
    Send, t
}
Return


Move:
    PostMessage, 0xA1, 2, , , A
Return