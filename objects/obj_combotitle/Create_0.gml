title_index = 0;
title = 0;
vsp = 0;
alarm[1] = 120;
depth = -300;
alarm[0] = 3;
image_speed = 0;
depth = -100;
x = -128;
y = global.hud == HUD_STYLES.final ? 290 : 197;
very = false;
afterimages = array_create(0);

if global.hud == HUD_STYLES.final
	sound_play("event:/sfx/ui/comboup");

if SUGARY_SPIRE
{
	sugary = check_sugarychar();
	if sugary
	{
		sprite_index = spr_comboend_titleSP;
	
		x -= 2;
		if global.hud == HUD_STYLES.final
			y -= 40;
	
		image_alpha = 3;
		type = clamp(floor(global.combo / 25), 0, 3);
	
		switch type
		{
			case 0: image_xscale = 0 image_yscale = 0 break;	
			case 1: image_xscale = 3 image_yscale = 0 break;	
			case 2: image_xscale = 0 image_yscale = 3 break;	
			case 3: image_xscale = 0 image_yscale = 0 break;	
		}
	}
}
if BO_NOISE
{
	bo = (obj_player1.character == "BN");
	if bo
	{
		alarm[1] = 100;
		image_alpha = 3;
		type = 0;
		sprite_index = spr_comboend_titleBN;
	
		if global.combo <= 40
		{
		    type = 0;
			sound_play("event:/modded/sfx/MLgood");
		}
		else if global.combo <= 60
		{
		    type = 1;
		    image_xscale = 0;
		    sound_play("event:/modded/sfx/MLgreat");
		}
		else
		{
		    type = 2;
		    sound_play("event:/modded/sfx/MLexcellent");
		}
	}
}

ystart = y;
if REMIX
	persistent = true;
