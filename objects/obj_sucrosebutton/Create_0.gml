SS_CODE_START;

event_inherited();

depth = 4;
image_speed = 0.35;
enum ButtonState
{
	RELEASED,
	PRESSED,
	PRESSING,
	REVERTING
}
currentState = ButtonState.RELEASED;

// Sprites
spr_Lowering = spr_sucrosebuttonLowering;
spr_Pressed = spr_sucrosebuttonPressed; 
spr_Released = spr_sucrosebuttonReleased; 
spr_Reverting = spr_sucrosebuttonReverting;

SS_CODE_END;
