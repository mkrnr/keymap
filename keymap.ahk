#Include, %A_ScriptDir%\virtual-desktop-enhancer.ahk

#Persistent
SetCapsLockState, AlwaysOff
SetTitleMatchMode, Regex

Capslock::Esc
Capslock & h::Left
Capslock & j::Down
Capslock & k::Up
Capslock & l::Right

Capslock & q::Delete
Capslock & z::Tab


Capslock & y::Run C:\Windows\System32\DisplaySwitch.exe


#y::
    Runwait C:\Windows\System32\wsl.exe python3 ~/git/stenodicts/upload_to_website.py ~/git/stenodicts/
	Run C:\git\dotfiles\windows\plover\reconnect.ahk
	return
	
#z::Run C:\git\dotfiles\windows\plover\stenojig-focus.ahk

#e::Run explorer.exe
#Enter::Run, %LOCALAPPDATA%\Microsoft\WindowsApps\wt.exe, C:\source\windows-terminal\home

#b::
	Sleep, 100
	Send ^a
	Sleep, 200
	Send ^c
	Sleep, 200
	Send f
	Sleep, 200
	Send s
	Sleep, 500
	Run C:\git\dotfiles\windows\plover\stenojig-focus.ahk
	Run python C:\git\stenoscores\stenoscores\score_writer.py C:\Users\mkoerner\iCloudDrive\Personal\stenography\progress\stats
	return

#s::Run, launcher.exe, C:\source\launcher, Hide

#v::Run Spotify.exe
#IfWinActive, ahk_class Chrome_WidgetWin_0
    #v::
        PostMessage, 0x112, 0xF060,,, A
        Send {Alt down}{Tab}{Alt up}
#IfWinActive


Capslock & 1::#1
Capslock & 2::#2
Capslock & 3::#3
Capslock & 4::#4
Capslock & 5::#5
Capslock & 6::#6
Capslock & 7::#7
Capslock & 8::#8
Capslock & 9::#9

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
    j::down
    k::up
    l::right
#if

Capslock & d::ShiftAltTab
LWin & d::ShiftAltTab
Capslock & f::AltTab
LWin & f::AltTab


#c::PostMessage, 0x112, 0xF060,,, A

RAlt & c::Send {Control Down}{Insert}{Control Up}
RAlt & v::Send {Shift Down}{Insert}{Shift Up}


;eclipse
#IfWinActive, ahk_class SWT_Window0
	Capslock & s::Send {Control Down}{PgUp}{Control Up}
	Capslock & g::Send {Control Down}{PgDn}{Control Up}

	Capslock & w::^w
	Capslock & e::^e
	Capslock & r::+^r
	Capslock & t::+^t
	Capslock & c::!^h
	Capslock & x::^1
	Capslock & Space::^Space
#IfWinActive

	
#IfWinActive, ahk_class CASCADIA_HOSTING_WINDOW_CLASS
	Capslock & s::Send {Control Down}{PgUp}{Control Up}
	Capslock & g::Send {Control Down}{PgDn}{Control Up}

	Capslock & w::^w
	Capslock & e::^e
	Capslock & r::+^r
	Capslock & t::+^t
	Capslock & c::!^h
	Capslock & x::^1
	Capslock & Space::^Space

	;this also requires a remapping in the NVIM config such as nnoremap <A-1> 1gt
	^1::send !{1}
	^2::send !{2}
	^3::send !{3}
	^4::send !{4}
	^5::send !{5}
	^6::send !{6}
	^7::send !{7}
	^8::send !{8}
	^9::send !{9}
	^0::send !{10}
#IfWinActive
	
;#IfWinActive, ahk_class SWT_Window0
;    Capslock & v::
;#IfWinActive, ahk_class #32770
;    Capslock & v::
;        if(!GetKeyState("LControl"))
;            Send {LControl Down}
;        if(GetKeyState("LShift"))
;            Send {LShift Up}
;        Send {F7}
;        SetTimer, WaitForCapslockUp, 100
;        return
;#IfWinActive

;WaitForCapslockUp:
;    if(!GetKeyState("Capslock", "P")){
;        Send {LControl Up}
;        Send {LShift Up}
;        SetTimer, WaitForCapslockUp, Off
;    }
;    return

Capslock & s::Send {Control Down}{Shift Down}{Tab}{Shift Up}{Control Up}
Capslock & g::Send {Control Down}{Tab}{Control Up}



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

;remapping to make some plover commands work in WSL
>^h::Send ^{left}
>^j::send {PgDn}
>^k::Send {PgUp}
>^l::send ^{right}
>^s::send {Home}
>^d::send ^{Home}
>^f::send ^{End}
>^g::Send {End}

>^F1::Send {F1}
>^F5::Send {F5}
+>^F1::Send +{F1}
!>^F1::Send ^{F1}
	
	

;RAlt & q::
;CtrlKeyDown := !CtrlKeyDown
;If CtrlKeyDown
;	Send {Ctrl down}
;Else
;	Send {Ctrl up}
;Return

;RAlt & w::
;ShiftKeyDown := !ShiftKeyDown
;If ShiftKeyDown
;	Send {Shift down}
;Else
;	Send {Shift up}
;Return

ShowMessage(message)
{
    Gui, -Caption +AlwaysOnTop +Disabled -SysMenu +Owner  ; +Owner avoids a taskbar button.
	Gui, Font, s20,
	Gui, Add, Text, , %message%
	Gui, Show, x50 y50, NoActivate ; NoActivate avoids deactivating the currently active window.
	return
}

SendUp()
{
	Send {LShift Up}
	Send {LCtrl Up}
	Gui, Destroy
	return
}


!w::
	Send {LShift Down}
	ShowMessage("Shift on")
	return

<+!w::
	SendUp()
	return	
	
!q::
	Send {LCtrl Down}
	ShowMessage("Ctrl on")
	return

<^!q::
	SendUp()
	return

