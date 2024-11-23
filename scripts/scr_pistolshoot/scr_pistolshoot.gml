function scr_pistolshoot(required_state, allow_charge = false)
{
	if !global.pistol // attack style
	{
		if floor(global.bullet) == 0
		or instance_exists(obj_bosscontroller)
			exit;
	}
	
	if character == "N"
	{
		scr_bombshoot();
		exit;
	}
	if !allow_charge && pistolchargeshooting
		exit;
	
	if ((pistolcooldown <= 0 && state == required_state && state != states.bump && instance_number(obj_pistolbullet) < 3) or pistolchargeshooting == 1)
	{
		input_buffer_shoot = 0;
		input_buffer_pistol = 0;
		pistolanim = spr_pistolshot;
		pistolindex = 0;
		pistolcooldown = 10;
		machslideAnim = false;
		landAnim = false;
		jumpAnim = false;
		crouchslideAnim = false;
		crouchAnim = false;
		stompAnim = false;
		if (required_state == states.mach3 or required_state == states.mach2)
			state = states.normal;
		windingAnim = 0;
		with (instance_create(x + (xscale * 35), y, obj_parryeffect))
		{
			if (allow_charge && other.pistolchargeshooting)
				sprite_index = spr_giantpistoleffect;
			else
				sprite_index = spr_player_pistoleffect;
			image_xscale = other.xscale;
			image_speed = 0.4;
		}
		if allow_charge && pistolchargeshooting
			sound_play_3d("event:/sfx/pep/revolverBIGshot", x + (xscale * 20), y);
		else
			sound_play_3d("event:/sfx/pep/pistolshot", x + (xscale * 20), y);
		
		var bullet = instance_create(x + (xscale * 20), y, obj_pistolbullet);
		with bullet
		{
			image_xscale = other.xscale;
			if allow_charge && other.pistolchargeshooting
			{
				GamepadSetVibration(0, 1, 1, 0.8);
				sprite_index = spr_peppinobulletGIANT;
				x += 25;
			}
			else
				GamepadSetVibration(0, 0.3, 0.3, 0.6);
		}
		
		if !global.pistol
		{
			pistolcooldown = 20;
			pistol = true;
			global.bullet = floor(global.bullet - 1);
			bullet.april = true;
			sound_play_3d(sfx_killingblow, x, y);
			
			if global.hud == hudstyles.old
			{
				with obj_tv
				{
					alarm[0] = 100;
					tvsprite = spr_tvrevolver;
					image_index = 0;
					image_speed = 0.35;
				}
			}
		}
	}
}
