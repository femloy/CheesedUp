if character == "V"
	exit;

if ((grounded or (((SUGARY_SPIRE && character == "SP") or sprite_index == spr_lunge) && state == states.handstandjump))
&& other.sprite_index == spr_swordstone && (state == states.handstandjump || state == states.punch || state == states.lungeattack))
{
	var yy = y;
	if !grounded while !scr_solid(x, y + 1)
	{
		if ++y > room_height
		{
			y = yy;
			break;
		}
	}
	grounded = true;
	
	transformationlives = 3;
	sound_play_3d("event:/sfx/knight/start", x, y);
	global.SAGEknighttaken = true;
	momentum = false;
	movespeed = 0;
	other.image_index = 1;
	image_index = 0;
	image_speed = 0.35;
	sprite_index = spr_knightpepstart;
	state = states.knightpep;
	hsp = 0;
	vsp = 0;
	notification_push(notifs.knighttaken, [room]);
	create_transformation_tip(lang_get_value("knighttip"), "knight");
}
