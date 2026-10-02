Global myTimerisRunning := False ; Don't Touch
Global mySpeedSetting := 10 ; My default is 10
*^Esc:: ExitApp ; Ctrl+Esc will close the script
*up::
*left::
*down::
*right:: Fn_MouseRemap("up", "left", "down", "right")
Shift::LButton
Fn_MouseRemap(ParamUp, ParamLeft, ParamDown, ParamRight){
If (myTimerisRunning=True)
Return
Else
{
myTimerisRunning := True
BoundFunc := Func("Timer_MouseKeys").Bind(ParamUp, ParamLeft, ParamDown, ParamRight)
SetTimer, % BoundFunc, 1
}
}
Timer_MouseKeys(ParamUp, ParamLeft, ParamDown, ParamRight){
StateUp := GetKeyState(ParamUp, "P") * -1
StateLeft := GetKeyState(ParamLeft, "P") * -1
StateDown := GetKeyState(ParamDown, "P")
StateRight := GetKeyState(ParamRight, "P")
If StateUp or StateLeft or StateDown or StateRight
{
MouseX := mySpeedSetting * (StateLeft + StateRight)
MouseY := mySpeedSetting * (StateUp + StateDown)
DllCall("mouse_event", "UInt", 0x0001, "Int", MouseX, "Int", MouseY, "UInt", 0, "UPtr", 0)
}
Else
{
myTimerisRunning := False
SetTimer,, Off
}
}