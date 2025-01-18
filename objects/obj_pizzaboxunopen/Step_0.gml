if place_meeting(x, y, obj_player) && sprite_index != spr_pizzaboxopen
{
	global.heattime = 60;
	global.combotime = 60;
	
	var _instance_create = global.in_afom ? cyop_instance_create : instance_create;
	var oix = global.in_afom ? cyop_get_object(content) : content;
	
	if oix == obj_bigcollect
		sound_play(sfx_stompenemy);
	else
		sound_play(global.snd_collecttoppin);
	
	if oix == obj_noisebomb
	{
		with obj_player
		{
			state = states.animation;
			sprite_index = spr_player_bossintro;
			image_index = 0;
		}
		with _instance_create(x, y - 25, content)
			sprite_index = spr_noisebomb_intro;
		instance_create(x, y, obj_taunteffect);
		activate_panic();
	}
	else if oix == obj_afom_noisebomb
		_instance_create(x, y - 25, content, {box: true});
	else if object_is_ancestor(oix, obj_pizzakinparent)
	{
		with instance_create(x, y, obj_smallnumber)
			number = "1000";
		global.collect += 1000;
		if IT_toppin_taunt_effect()
			instance_create(x, y, obj_taunteffect);
		with _instance_create(x, y - 25, content)
		{
			/*
			if roomname == "strongcold"
				sprite_index = spr_intro_strongcold;
			else
			*/
				sprite_index = spr_intro;
		}
		global.toppintotal += 1;
		
		switch oix
		{
			case obj_pizzakinshroom: global.shroomfollow = true; break;
			case obj_pizzakincheese: global.cheesefollow = true; break;
			case obj_pizzakintomato: global.tomatofollow = true; break;
			case obj_pizzakinsausage: global.sausagefollow = true; break;
			case obj_pizzakinpineapple: global.pineapplefollow = true; break;
		}
		
		if global.hud == HUD_STYLES.final
		{
			if REMIX or (SUGARY_SPIRE && sugary)
			{
				var text = global.toppintotal == 2 ? "toppin_text2" : "toppin_text1";
				if SUGARY_SPIRE && sugary
					text += "ss";
				
				text = embed_value_string(lstr(text), [global.toppintotal - 1, 5]);
				create_transformation_tip(text);
			}
		}
		else
		{
			var text, val = 5 - (global.toppintotal - 1);;
			if val <= 0
				text = "message_toppin1";
			else
				text = val == 1 ? "message_toppin3" : "message_toppin2";
			old_hud_message(embed_value_string(lstr(text + ((SUGARY_SPIRE && sugary) ? "ss" : "")), [val]), 150);
		}
	}
	else if oix == obj_noisey
	{
		sound_play_3d("event:/sfx/enemies/projectile", x, y);
		with _instance_create(x, y - 25, content)
		{
			image_xscale = other.image_xscale;
			state = states.stun;
			stunned = 20;
			vsp = -5;
		}
	}
	else if oix != obj_bigcollect or global.in_afom
		_instance_create(x, y - 25, content);
	
	if sprite_index == spr_pizzaboxunopen_old
	{
		image_index = 0;
		sprite_index = spr_pizzaboxopen;
	}
	else
		instance_destroy();
}

if sprite_index == spr_pizzaboxopen
{
	if !global.in_afom && floor(image_index) >= 3 && !start && content == obj_bigcollect
	{
		start = true;
		depth = 105;
		with instance_create(x, y, content)
			ID = other.id;
	}
	if floor(image_index) >= image_number - 1
		instance_destroy(id, false);
}

subimg += 0.35;
if subimg > sprite_get_number(spr_toppinhelp) - 1 && sprite_index != spr_pizzaboxunopen_old && sprite_index != spr_pizzaboxopen
{
	subimg = frac(subimg);
	scr_fmod_soundeffect(snd, x, y);
}
