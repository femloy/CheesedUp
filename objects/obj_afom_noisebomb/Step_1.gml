if !box
	exit;

#macro AFOM_MESSAGE {message = "Stop adding shit I can't realistically recreate if you don't want me to copy paste"\
					message = "I improved your shitty code though so at least it's constructive"}

if buffer-- == 0
{
	if !YYC
		AFOM_MESSAGE;
	
	switch step
	{
		case 0:
			with playerid
            {
                if grounded
                {
                    state = states.actor;
                    image_speed = 0.35;
                    image_index = 0;
                    sprite_index = spr_idle;
                    other.lock = true;
                    xscale *= -1;
                    if xscale == other.image_xscale
                        other.image_xscale *= -1;
                    other.image_speed = 0.35;
                    other.image_index = 0;
                    other.sprite_index = spr_noisebomb_idle;
                    sound_play_3d("event:/sfx/voice/noisepositive", other.x, other.y);
                    movespeed = 0;
                    hsp = 0;
                    other.buffer = 33;
                    other.step = 1;
					
					/*
                    var distance = x - other.x;
					with other
					{
						if abs(distance) <= 10 && distance != 0
						{
							hsp = sign(distance);
							image_xscale = hsp;
						}
						else
						{
							if distance != 0
								image_xscale = -sign(distance);
							hsp = 0;
							step = 1;
						}
					}
					*/
                }
                else
                {
                    hsp = 0;
                    movespeed = 0;
                }
            }
			break;
		
		case 1:
			with playerid
			{
				image_speed = 0.35;
	            image_index = 0;
	            sprite_index = spr_bossintro;
			}
            image_speed = 0.35;
            image_index = 0;
            sprite_index = spr_noisebomb_intro;
            sound_play_3d(global.snd_screamboss, playerid.x, playerid.y);
            buffer = 40;
            step = 2;
			break;
		
		case 2:
			with playerid
			{
				image_speed = 0.35;
	            image_index = 0;
	            sprite_index = spr_idle1;
			}
            image_speed = 0.35;
            image_index = 0;
            sprite_index = spr_noisebomb;
            step = 3;
			break;
		
		case 3:
			if playerid.sprite_index != playerid.spr_bombpepend
				break;
			visible = false;
			activate_panic();
			step = 4;
			break;
		
		case 4:
			if playerid.sprite_index == playerid.spr_bombpepend && floor(playerid.image_index) == playerid.image_number - 1
            {
                playerid.state = states.normal;
                instance_destroy();
            }
			break;
	}
	
	with playerid
	{
		if sprite_index == spr_bossintro && floor(image_index) == image_number - 2
	        image_index = image_number - 4;
		if sprite_index == spr_idle1 && floor(image_index) == image_number - 1
        {
            image_speed = 0.35;
            image_index = 0;
            sprite_index = spr_bombpepend;
			
			with other
			{
	            image_speed = 0.35;
	            image_index = 2;
	            sprite_index = spr_bombexplosion;
	            scr_fmod_soundeffect(global.snd_explosion, x, y);
			}
        }
	}
	if sprite_index == spr_noisebomb_intro && floor(image_index) == image_number - 2
        image_index = 2;
}
