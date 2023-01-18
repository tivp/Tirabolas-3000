#MaxThreadsPerHotkey 2
#SingleInstance
#Include <Graphics>
#Persistent

Menu, Tray, NoStandard
Menu, Tray, Icon, resources\icon.ico
Menu, Tray, Add, Bloquear posición, MenuHandler
_Toggle := false ; 0
Menu, Tray, Add, Salir, Exit

RenderImageI("resources\tutorial.png", "time:" 3300 " x:50%vw")
Sleep, 3300

+S::
RenderImageI("resources\saliendo.png", "time:" 2200 " x:50%vw")
Sleep, 500
ExitApp

F1::
{
	Toggle := !Toggle ; Toggle hotkey check
	If (Toggle != false)
	{
		RenderImageI("resources\tirabolas.png", "time:" 720 " x:50%vw")
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
	RenderImageI("resources\desbloqueado.png", "time:" 350 " x:50%vw")
    Menu, Tray, UnCheck, Bloquear posición
}
Else
{
	_Toggle := true ; 1
	RenderImageI("resources\bloqueado.png", "time:" 350 " x:50%vw")
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