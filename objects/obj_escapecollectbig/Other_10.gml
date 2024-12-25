/// @description time gain
if (instance_exists(obj_pizzaface) or global.laps < 2) or global.lapmode == LAP_MODES.laphell
	exit;

if !instance_exists(obj_wartimer)
{
	switch obj_player1.character
	{
		case "G": case "N":
			global.fill += 36;
			break;
		default:
			global.fill += 32;
			break;
	}
}
else
{
	sound_play("event:/sfx/ui/wartimerup")
	with obj_wartimer
	{
		addseconds += 5;
		alarm[0] = -1
		alarm[2] = 1
	}
}
