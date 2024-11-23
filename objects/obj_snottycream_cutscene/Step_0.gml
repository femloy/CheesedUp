live_auto_call;

/*
if keyboard_check_pressed(ord("R"))
{
	instance_destroy();
	instance_create(0, 0, object_index);
	exit;
}
*/

t--;
switch con
{
	case 0:
		if t <= 0
		{
			player.sprite_index = spr_vigilante_vulnerable;
			boss.sprite_index = spr_vigilante_vulnerable;
			con++;
			t = 100;
		}
		break;
	
	case 1:
		if t <= 0
		{
			con++;
			player.sprite_index = spr_playerV_snottycream1;
			player.image_index = 0;
			boss.sprite_index = spr_playerV_snottycream1;
			boss.image_index = 0;
		}
		break;
	
	case 2:
		if player.image_index >= 5 && !screamed
		{
			screamed = true;
			sound_play_3d(global.snd_screamboss, player.x, player.y);
			sound_play_3d("event:/modded/sfx/enemyscream", boss.x, boss.y);
		}
		if player.image_index >= player.image_number - 1 && player.hsp == 0
		{
			sound_play_3d(sfx_suplexdash, player.x, player.y);
			sound_play_3d(sfx_suplexdash, boss.x, boss.y);
			player.sprite_index = spr_playerV_snottycream2;
			player.image_index = 0;
			boss.sprite_index = spr_playerV_snottycream2;
			boss.image_index = 0;
			player.hsp = 10;
			boss.hsp = -10;
		}
		with player
		{
			if place_meeting(x, y, other.boss)
				other.con++;
		}
		break;
	
	case 3:
		sound_play_3d(sfx_bumpwall, player.x, player.y);
		
		con++;
		with player
		{
			sprite_index = spr_playerV_bump;
			hsp = -5;
			vsp = -3;
		}
		with boss
		{
			sprite_index = spr_playerV_bump;
			hsp = 5;
			vsp = -3;
		}
		break;
	
	case 4:
		// bump state
		with player
		{
			if grounded && vsp >= 0
				hsp = 0;
		}
		with boss
		{
			if grounded && vsp >= 0
				hsp = 0;
		}
		
		if donkey.x >= room_width / 2
		{
			donkey.hspeed = 0;
			player.sprite_index = spr_playerV_snottycream3;
			player.image_index = 0;
			donkey.image_speed = 0;
			donkey.image_index = 0;
			con++;
		}
		break;
	
	case 5:
		if player.image_index >= 2 && boss.sprite_index == spr_playerV_bump
		{
			boss.sprite_index = spr_playerV_snottycream3;
			boss.image_index = 0;
		}
		if player.image_index >= player.image_number - 1
		{
			con++;
			t = 200;
		}
		break;
	
	case 6:
		if player.sprite_index != spr_playerV_snottycream4
		{
			if t <= 180
			{
				player.image_speed = 0.35;
				boss.image_speed = 0.35;
				player.sprite_index = spr_playerV_snottycream4;
				boss.sprite_index = spr_playerV_snottycream5;
				boss.image_xscale *= -1;
			}
			else
			{
				player.image_index = player.image_number - 1;
				boss.image_index = boss.image_number - 1;
			}
		}
		
		if t <= 0
		{
			with obj_bosscontroller
				image_alpha = Approach(image_alpha, 0, 0.15);
			fade += 0.1;
			if fade >= 5
			{
				con++;
				fade = 0;
				sound_play_centered(sfx_lighting);
				shake = 6;
				t = room_speed * 3;
			}
		}
		break;
	
	case 7:
		with obj_bosscontroller
		{
			image_alpha = 0;
			boss_hp = 0;
			boss_prevhp = 0;
		}
		
		with boss
			instance_destroy(id, false);
		
		shake = Approach(shake, 0, 0.1);
		if t <= 0
		{
			fade += 0.1;
			if fade >= 5
			{
				con++;
				fade = 1;
			}
		}
		break;
	
	case 8:
		player.sprite_index = player.spr_idle;
		player.image_speed = 0.35;
		
		fade = Approach(fade, -1, 0.1);
		if fade <= -1
		{
			player.state = states.normal;
			instance_destroy();
		}
		break;
}
