#MaxThreadsPerHotkey 2
#SingleInstance
#Include <Graphics>
#Persistent

Menu, Tray, NoStandard
Menu, Tray, Icon, Resources\icon.ico
Menu, Tray, Add, Bloquear posición, MenuHandler
_Toggle := false ; 0
Menu, Tray, Add, Salir, Exit

RenderImageI("Resources\Tutorial.png", "time:" 3300 " x:50%vw")
Sleep, 3300

+S::
RenderImageI("Resources\Saliendo.png", "time:" 2200 " x:50%vw")
Sleep, 2200
ExitApp

F1::
{
	Toggle := !Toggle ; Toggle hotkey check
	If (Toggle != false)
	{
		RenderImageI("Resources\Tirabolas.png", "time:" 720 " x:50%vw")
		Sleep, 720
	}
	While, Toggle
	{
		If (_Toggle != false) ; 1
		{
			BlockInput, MouseMove
		}
		Else ; 0
		{
			BlockInput, MouseMoveOff
		}
		Send t
		Sleep, 100
		Send {Click}
	}
}
BlockInput, MouseMoveOff
Return

F2::
If (_Toggle != false) ; 1
{
	_Toggle := false ; 0
	RenderImageI("Resources\Desbloqueado.png", "time:" 350 " x:50%vw")
    Menu, Tray, UnCheck, Bloquear posición
}
Else
{
	_Toggle := true ; 1
	RenderImageI("Resources\Bloqueado.png", "time:" 350 " x:50%vw")
    Menu, Tray, Check, Bloquear posición
}

Return


MenuHandler:
If (_Toggle != false)
{
	_Toggle := false ; 0
    Menu, Tray, UnCheck, Bloquear posición
}
Else
{
	_Toggle := true ; 1
    Menu, Tray, Check, Bloquear posición
}
Return

!F4::
Exit:
ExitApp