if deactivate
{
	x = room_width / 2;
	y = room_height + 100;
	
	hitboxcreate = false;
	visible = false;
	
	appear = 0;
	appeartimer = room_speed * 5;
	gotoplayer = 0;
	exit;
}

if obj_player1.state == states.parry && distance_to_object(obj_player1) < 50 && alarm[0] == -1
{
	alarm[0] = 10;
	knocked = true
	
	if x > obj_player1.x
		hspeed = 16;
	else
		hspeed = -16;
		
	if y > obj_player1.y
		vspeed = 16
	else
		vspeed = -16;
}

if room == dungeon_pizzamart
{
	x = room_width / 2
	y = -200
}
else
{
	if knocked
	{
		xcam += hspeed;
		ycam += vspeed;
	}
	else
	{
		lockcam = false;
		image_xscale = 1;
		
		// abilities
		if appeartimer > 0
		{
			appeartimer -= 1;
			if room == dungeon_10 or room == dungeon_9 or room == snick_challengeend
				appeartimer -= 4;
			
			xcam = -500;
			ycam = -500;
			maxspeed = 10;
		}
		else
		{
			if appear == 0
			{
				sprite_index = (appeared ? spr_snick_exh : spr_snick_exh_shadow);
				
				popfrom = irandom(3);
				if popfrom == 0 // top left corner
				{
					xcam = -100;
					ycam = -100;
				}
				if popfrom == 1 // top right corner
				{
					xcam = 960 + 100;
					ycam = -100;
				}
				if popfrom == 2 // bottom left corner
				{
					xcam = -100;
					ycam = 540 + 100;
				}
				if popfrom == 3 // bottom right corner
				{
					xcam = 960 + 100;
					ycam = 540 + 100;
				}
			
				appear = 1;
				gotoplayer = room_speed * 5;
			}
			if appear == 1
			{
				with obj_tv
					manualhide = false;
				with obj_camera
					manualhide = false;
				var xx, yy;
			
				if popfrom == 0 // top left corner
				{
					xx = 150;
					yy = 100;
				
					with obj_camera
						manualhide = true;
				}
				if popfrom == 1 // top right corner
				{
					xx = 960 - 150;
					yy = 100;
				
					with obj_tv
						manualhide = true;
				}
				if popfrom == 2 // bottom left corner
				{
					xx = 150;
					yy = 540 - 100;
				}
				if popfrom == 3 // bottom right corner
				{
					xx = 960 - 150;
					yy = 540 - 100;
				}
			
				xcam = Approach(xcam, xx + random_range(-2, 2), maxspeed);
				ycam = Approach(ycam, yy + random_range(-2, 2), maxspeed);
			
				lockcam = true;
				gotoplayer--;
				if room == dungeon_10 or room == dungeon_9 or room == snick_challengeend
					gotoplayer -= 2;
				
				if gotoplayer <= 0
					appear = 2;
			}
			if appear == 2
			{
				appeared = true;
				lockcam = true;
			
				if sprite_index != spr_snick_exhattack && sprite_index != spr_snick_exhattackstart
				{
					image_index = 0;
					sprite_index = spr_snick_exhattackstart;
					create_heatattack_afterimage(x, y, sprite_index, 10, 1);
				}
				if sprite_index == spr_snick_exhattackstart && image_index >= 13
				{
					appear = 3;
					lockcam = false;
				
					xcam += CAMX;
					ycam += CAMY;
				}
			}
			if appear == 3
			{
				with obj_tv
					manualhide = false;
				with obj_camera
					manualhide = false;
			
				if x != obj_player1.x
					image_xscale = sign(obj_player1.x - x);
			
				if sprite_index == spr_snick_exhattackstart && image_index >= image_number - 1
					sprite_index = spr_snick_exhattack;
			
				if !(sprite_index == spr_snick_exhattackstart && image_index < 15)
				{
					xcam = median(xcam - maxspeed, obj_player1.x, xcam + maxspeed);
					ycam = median(ycam - maxspeed, obj_player1.y, ycam + maxspeed);
				}
				maxspeed += 0.1;
			
				if place_meeting(x, y, obj_player1) && !place_meeting(x, y, obj_parryhitbox)
				{
					sound_play_3d("event:/sfx/pep/hurt", x, y);
					with obj_player1
					{
						if state != states.hurt && state != states.parry
						&& state != states.door && state != states.victory && !cutscene
						{
							hsp = 0;
							if vsp >= 0
								vsp = -3;
							movespeed = 0;
							
							scr_hitstun_player(200);
							
							sprite_index = spr_hurt;
							state = states.frozen;
						}
					}
					create_particle(x, y, part.genericpoofeffect);
					
					appear = 0;
					appeartimer = room_speed * (8 + random(5));
					gotoplayer = room_speed * 5;
				}
				with obj_parryhitbox
				{
					if place_meeting(x, y, other)
						event_user(0);
				}
			}
		}
	}
}

// aftarimages
if appear == 3
{
	if --after <= 0
	{
		after = 5;
		create_red_afterimage(x, y, sprite_index, image_index, image_xscale);
	}
}
