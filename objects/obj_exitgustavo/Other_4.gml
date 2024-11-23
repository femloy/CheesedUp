/// @description switch characters
var stick = false;
if global.leveltosave == "forest" || global.leveltosave == "street"
	stick = true;
else if irandom(100) <= 15
	stick = true;

switch obj_player1.character
{
	default:
		var r = string_letters(room_get_name(room));
		if sprite_index != spr_gustavo_exitsign || r == "saloon" || room == space_11b || r == "freezer" || r == "chateau" || r == "floor5"
			stick = false;
		
		if obj_player1.character == "G"
			stick = true;
		
		if stick
		{
			ystart -= 6;
			
			spr_fall = spr_stick_fall;
			spr_idle = spr_stick_exit;
		}
		break;
	
	case "N":
		spr_fall = spr_noiseyexit_fall;
		spr_idle = spr_noiseyexit_idle;
		
		if stick
		{
			ystart -= 6;
			
			spr_fall = spr_noisette_fall;
			spr_idle = spr_noisette_exit;
			//if REMIX
			//	spr_taunt = spr_noisette_ass;
		}
		break;
	
	case "V":
		var spr = choose(spr_vigiescapepointer1, spr_vigiescapepointer2);
		spr_fall = spr;
		spr_idle = spr;
		break;
}

if MOD.FromTheTop or (global.gerome && global.lapmode == lapmodes.april)
	image_xscale *= -1;
