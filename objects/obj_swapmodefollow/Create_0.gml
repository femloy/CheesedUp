event_inherited();
image_speed = 0.35;
depth = -6;
xoffset = 25;
yoffset = 0;
usable = true;
spritequeue = ds_queue_create();
isgustavo = false;
animatronic = 0;
alarm[0] = 5;
taunttimer = 0;
tauntID = noone;
breakdance_pressed = 0;
breakdance_speed = 0.25;
breakdance_index = 0;
notecreate = 0;
grabbuffer = 0;
steppybuffer = 0;

swap_index = 1;
character = "P";
color_array = [1, 2];

get_character_spr = function()
{
	character = global.swap_characters[swap_index];
	
	if swap_index >= array_length(obj_player1.player_paletteselect)
	{
		obj_player1.player_paletteselect[swap_index] = 0;
		obj_player1.player_patterntexture[swap_index] = noone;
	}
	paletteselect = obj_player1.player_paletteselect[swap_index];
	patterntexture = obj_player1.player_patterntexture[swap_index];
	
	taunttimer = 0;
	breakdance_pressed = 0;
	breakdance_index = 0;
	instance_destroy(tauntID);
	tauntID = -4;
	
	scr_characterspr();
	color_array = global.Base_Pattern_Color;
	
	if isgustavo && character != "N"
	{
		spr_idle = spr_ratmount_idle;
		spr_move = spr_ratmount_move;
		spr_air = spr_ratmount_balloon;
		spr_suplexdash = spr_lonegustavopunch;
		spr_fall = spr_ratmount_groundpoundfall;
		spr_dead = spr_ratmount_gameover;
		spr_taunt = spr_ratmount_taunt;
		spr_walkfront = spr_ratmountexitdoor;
	}
}

is_visible = true;
