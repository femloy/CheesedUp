live_auto_call;

sound_instance_move(snd, johne.x, johne.y);
switch state
{
	case 0:
		with obj_player1
		{
			sprite_index = spr_idle;
			image_speed = 0.35;
			xscale = 1;
		}
		state++;
		timer = 100;
		break;
	
	case 1:
		johne.x = lerp(johne.x, obj_player1.x + 140, 0.05);
		johne.y = lerp(johne.y, obj_player1.y - 40, 0.05);
		
		timer--;
		if timer == 50
		{
			obj_player1.sprite_index = spr_vigihookcutscene1;
			obj_player1.image_index = 0;
		}
		with obj_player1
		{
			if image_index >= image_number - 1 && sprite_index == spr_vigihookcutscene1
				sprite_index = spr_vigihookcutscene2;
		}
		
		with hook
		{
			x = other.johne.x;
			y = other.johne.y;
		}
		
		if timer <= 0
		{
			sound_play_3d(sfx_vigilante_throw, johne.x, johne.y);
			state++;
			with johne
			{
				hsp = 5;
				vsp = 6;
			}
			hook.hsp = -5;
			hook.vsp = -5;
		}
		break;
	
	case 2:
		with hook
		{
			x += hsp;
			y += vsp;
			vsp += 0.5;
			
			if x <= obj_player1.x + 5 && y >= obj_player1.y - 5
			{
				x = 0;
				y = 0;
				other.state++;
				sound_play_3d(sfx_bosskey, x, y);
				other.timer = room_speed * 2;
			}
		}
		break;
	
	case 3:
		obj_player1.sprite_index = spr_vigihookcutscene3;
		if timer-- <= 0
		{
			obj_player1.state = states.normal;
			obj_player1.sprite_index = obj_player1.spr_idle;
			global.vigiweapon = VIGI_WEAPONS.hook;
			create_transformation_tip(lang_get_value("vigihooktip"),,,true);
			instance_destroy();
		}
		break;
}

if state >= 2
{
	with johne
	{
		x += hsp;
		y += vsp;
		vsp = Approach(vsp, -16, 0.5);
	}
}
if current_time % 5 == 0
	create_blur_afterimage(johne.x, johne.y, spr_johnecheese_grant, image_index, -1);
