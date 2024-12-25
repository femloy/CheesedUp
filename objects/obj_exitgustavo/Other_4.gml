/// @description switch characters
var stick = irandom(100) <= 15;
switch obj_player1.character
{
	default:
		if check_sugarychar()
		{
			if stick
			{
				// sugary polka
				spr_fall = spr_polka_fall;
				spr_idle = spr_polka_exit;
				spr_taunt = spr_polka_taunt;
			}
			else
			{
				// sugary rosette
				spr_fall = spr_rosette_fall;
				spr_idle = spr_rosette_exit;
				spr_taunt = spr_rosette_cheer;
				spr_dull = spr_rosette_dull;
			}
		}
		else
		{
			if global.leveltosave == "forest" || global.leveltosave == "street"
				stick = true;
			
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

if MOD.FromTheTop or (global.gerome && global.lapmode == LAP_MODES.april)
	image_xscale *= -1;
