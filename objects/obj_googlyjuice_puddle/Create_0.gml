SS_CODE_START;

init_collision();

hsp = 0;
vsp = 0;
grav = 0.5;
image_speed = 0.5;
grounded = false;
sprite_index = spr_juicepuddleair;
mask_index = spr_juicepuddledone;
draw_angle = 0;
vsp = 0.2;

spr_palette = spr_googlyjuice_palette;
switch global.leveltorestart
{
	case "entryway": paletteselect = 1; break;
	default: paletteselect = 2; break;
	case "molasses": paletteselect = 3; break;
	case "mines": paletteselect = 4; break;	
	case "fudge": paletteselect = 5; break;
}

SS_CODE_END;
