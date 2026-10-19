#NoEnv
SendMode Input
SetBatchLines -1

Global myTimerisRunning := False
Global mySpeedSetting := 10
Global MouseModeActive := False ; Gestione dello stato

; ==========================================
; F8: Interruttore ON/OFF (Toggle)
; ==========================================
F8::
    MouseModeActive := !MouseModeActive
    if (MouseModeActive)
        ToolTip, 🖱️ Modalita' Mouse: ATTIVA
    else
        ToolTip, ⌨️ Modalita' Mouse: DISATTIVA
    SetTimer, RemoveToolTip, -1500
return

RemoveToolTip:
    ToolTip
return

*^Esc:: ExitApp ; Ctrl+Esc chiude l'app d'emergenza

; ==========================================
; BLOCCO CONDIZIONALE: Funziona SOLO se MouseModeActive è True
; ==========================================
#If MouseModeActive

*up::
*left::
*down::
*right:: Fn_MouseRemap("up", "left", "down", "right")

; Ora Shift si comporta da Clic Sinistro SOLO quando la modalità mouse è attiva
*Shift::LButton

#If ; Fine del blocco condizionale
; ==========================================

Fn_MouseRemap(ParamUp, ParamLeft, ParamDown, ParamRight){
    if (myTimerisRunning)
        return
    
    myTimerisRunning := True
    BoundFunc := Func("Timer_MouseKeys").Bind(ParamUp, ParamLeft, ParamDown, ParamRight)
    
    ; Modificato a 10ms: abbassa il carico CPU del 90% mantenendo la fluidità visiva
    SetTimer, % BoundFunc, 10 
}

Timer_MouseKeys(ParamUp, ParamLeft, ParamDown, ParamRight){
    ; Utilizzo dell'operatore ternario per garantire tipi di dato integer puliti (0, 1, -1)
    StateUp := GetKeyState(ParamUp, "P") ? -1 : 0
    StateLeft := GetKeyState(ParamLeft, "P") ? -1 : 0
    StateDown := GetKeyState(ParamDown, "P") ? 1 : 0
    StateRight := GetKeyState(ParamRight, "P") ? 1 : 0
    
    if (StateUp || StateLeft || StateDown || StateRight) {
        MouseX := mySpeedSetting * (StateLeft + StateRight)
        MouseY := mySpeedSetting * (StateUp + StateDown)
        
        ; Chiamata di sistema a basso livello
        DllCall("mouse_event", "UInt", 0x0001, "Int", MouseX, "Int", MouseY, "UInt", 0, "UPtr", 0)
    } else {
        ; Spegnimento pulito del timer
        myTimerisRunning := False
        SetTimer,, Off
    }
}