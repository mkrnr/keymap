#Include, %A_ScriptDir%\virtual-desktop-enhancer.ahk

#Persistent
SetCapsLockState, AlwaysOff





Capslock::Esc
Capslock & h::Left
Capslock & j::Down
Capslock & k::Up
Capslock & l::Right

#e::Run explorer.exe
#Enter::Run C:\source\wsl-terminal\open-wsl.exe
#b::Run C:\Program Files (x86)\Google\Chrome\Application\chrome.exe

#v::Run Spotify.exe
#IfWinActive, ahk_class Chrome_WidgetWin_0
    #v::
        PostMessage, 0x112, 0xF060,,, A
        Send {Alt down}{Tab}{Alt up}
#IfWinActive

Capslock & 1::F1
Capslock & 2::F2
Capslock & 3::F3
Capslock & 4::F4
Capslock & 5::F5
Capslock & 6::F6
Capslock & 7::F7
Capslock & 8::F8
Capslock & 9::F9
Capslock & 0::F10
Capslock & -::F11
Capslock & =::F12

#u::
Capslock & u::SwitchToDesktop(1)
#i::
Capslock & i::SwitchToDesktop(2)
#o::
Capslock & o::SwitchToDesktop(3)
#p::
Capslock & p::SwitchToDesktop(4)
#[::
Capslock & [::SwitchToDesktop(5)
#n::
Capslock & n::SwitchToDesktop(6)
#m::
Capslock & m::SwitchToDesktop(7)
#,::
Capslock & ,::SwitchToDesktop(8)
#.::
Capslock & .::SwitchToDesktop(9)
#/::
Capslock & /::SwitchToDesktop(10)

+#u::MoveAndSwitchToDesktop(1)
+#i::MoveAndSwitchToDesktop(2)
+#o::MoveAndSwitchToDesktop(3)
+#p::MoveAndSwitchToDesktop(4)
+#[::MoveAndSwitchToDesktop(5)
+#n::MoveAndSwitchToDesktop(6)
+#m::MoveAndSwitchToDesktop(7)
+#,::MoveAndSwitchToDesktop(8)
+#.::MoveAndSwitchToDesktop(9)
+#/::MoveAndSwitchToDesktop(10)

#if getkeystate("lwin")
    h::left
    k::up
    j::down
    l::right
#if

Capslock & d::ShiftAltTab
LWin & d::ShiftAltTab
Capslock & f::AltTab
LWin & f::AltTab

RAlt & o::
    ShiftState := GetKeyState("Shift", "P")
    If (ShiftState) {
        Send, {Ö}
    } Else {
        Send, {ö}
    }
    return

RAlt & 5::SendInput {Text}€

RAlt & a::
    ShiftState := GetKeyState("Shift", "P")
    If (ShiftState) {
        Send, {Ä}
    } Else {
        Send, {ä}
    }
    return


RAlt & u::
    ShiftState := GetKeyState("Shift", "P")
    If (ShiftState) {
        Send, {Ü}
    } Else {
        Send, {ü}
    }
    return

RAlt & s::Send {ß}

#c::PostMessage, 0x112, 0xF060,,, A

RAlt & c::Send {Control Down}{Insert}{Control Up}
RAlt & v::Send {Shift Down}{Insert}{Shift Up}

#q::WinGetClass, Clipboard, A

;eclipse 
#IfWinActive, ahk_class SWT_Window0
	Capslock & s::^PgUp
	Capslock & g::^PgDn

	Capslock & e::^e
	Capslock & r::+^r
	Capslock & t::+^t
	Capslock & c::!^h
	Capslock & x::^1
	Capslock & Space::^Space



#IfWinActive, ahk_class SWT_Window0
    Capslock & v::
#IfWinActive, ahk_class #32770
    Capslock & v::
        if(!GetKeyState("LControl"))
            Send {LControl Down}
        if(GetKeyState("LShift"))
            Send {LShift Up}
        Send {F7}
        SetTimer, WaitForCapslockUp, 100
        return
#IfWinActive

WaitForCapslockUp:
    if(!GetKeyState("Capslock", "P")){
        Send {LControl Up}
        Send {LShift Up}
        SetTimer, WaitForCapslockUp, Off
    }
    return

Capslock & s::^+Tab
Capslock & g::^Tab



;OneNote, from: https://www.reddit.com/r/OneNote/comments/4jxy3j
SetTitleMatchMode, 2

winTitlePart := "- OneNote"
onenotem := "Send To OneNote"

#r::
IfWinNotExist, %onenotem%
{
    Run "C:\Program Files (x86)\Microsoft Office\root\Office16\ONENOTEM.EXE" /tsr,, hide
    Send, #!n
}
else {
    Send, #!n
}
return

#t::
IfWinExist, %winTitlePart%
{
        IfWinNotActive, %winTitlePart%
                WinActivate, %winTitlePart%
}
else {
    IfWinNotActive, %winTitlePart%
        Run, "C:\Program Files (x86)\Microsoft Office\root\Office16\ONENOTE.EXE"

}
SetTitleMatchMode, 1
return
