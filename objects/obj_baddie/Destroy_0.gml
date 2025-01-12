var hydra = (MOD.Hydra && instance_number(obj_baddie) < 64 && object_index != obj_twoliterdog)
&& (!elite or elitehit <= 0) && !killprotection;

if (room == rm_editor)
	exit;

if (!in_baddieroom() && (!elite || elitehit <= 0) && destroyable)
{
	if global.hitstun == HITSTUN_STYLES.early
		scr_sleep(50 * global.hitstun_multiplier);
	
	if object_index == obj_pizzaball
	{
		with instance_create(x, y, obj_sausageman_dead)
			sprite_index = spr_pizzaball_dead;
		if sit
		{
			with instance_create(x, y, obj_sausageman_dead)
				sprite_index = spr_pizzaball_dead2;
		}
	}
	else if (object_index != obj_peppinoclone && object_index != obj_ghoul && object_index != obj_bazookabaddie && object_index != obj_snowman)
	&& !(BO_NOISE && object_index == obj_twoliterdog) && !(SUGARY_SPIRE && (object_index == obj_bigcherry or object_index == obj_froth))
	&& !hydra && !(object_index == obj_pizzice && REMIX)
	{
		with instance_create(x, y, obj_sausageman_dead)
		{
			sprite_index = other.spr_dead;
			spr_palette = other.spr_palette;
			usepalette = other.usepalette;
			
			if other.object_index == obj_swapplayergrabbable
			{
				oldpalettetexture = other.patterntexture;
				if (other.spr_dead == spr_player_ratmountgameover && !other.gusrat)
					create_debris(x, y, spr_ratblock_dead);
			}
			
			paletteselect = !usepalette ? 0 : other.paletteselect;
			image_alpha = other.image_alpha;
			if (other.object_index == obj_ghostknight)
				image_alpha = 0.3;
			if (other.object_index == obj_noiseboss && other.pizzahead && obj_player1.character == "N")
			{
				sprite_index = spr_doise_deadair;
				hsp = 0;
				vsp = 0;
			}
			
			if SUGARY_SPIRE
				sugary = other[$ "sugary"] ?? false;
			image_blend = other.image_blend;
		}
	}
	else if (object_index == obj_peppinoclone)
	{
		with (instance_create(x, y, obj_explosioneffect))
		{
			image_speed = 0.35;
			depth = other.depth;
			sprite_index = spr_pepclone_death;
			image_xscale = other.image_xscale;
		}
	}
	else if (object_index == obj_ghoul)
	{
		var i = 0;
		repeat (sprite_get_number(spr_ghoul_gibs))
		{
			with (create_debris(x, y, spr_ghoul_gibs))
			{
				image_index = i;
				vsp = -irandom_range(10, 14);
			}
			i++;
		}
	}
	if (object_index == obj_sausageman && (whoopass or global.stylethreshold >= 3))
	{
		with (instance_create(x, y, obj_whoop))
		{
			create_particle(x, y, part.genericpoofeffect);
			vsp = -11;
		}
	}
	if (object_index == obj_tank)
	{
		repeat (3)
		{
			with (instance_create(x, y, obj_sausageman_dead))
				sprite_index = other.spr_content_dead;
		}
	}
	if (object_index == obj_bazookabaddie)
	{
		with (instance_create(x, y, obj_sausageman_dead))
			sprite_index = spr_tank_dead;
		repeat (4)
		{
			with (instance_create(x, y, obj_sausageman_dead))
				sprite_index = spr_tank_wheel;
		}
	}
	if object_index == obj_miniufo
	{
		if global.stylethreshold >= 3
		{
			with instance_create(x, y, obj_miniufo_grounded)
				important = true;
		}
		else
			instance_create(x, y, obj_playerexplosion);
	}
	if BO_NOISE
	{
		if object_index == obj_twoliterdog
		{
			var p = instance_nearest(x, y, obj_player);
			if p && x != p.x
				image_xscale = sign(x - p.x);
		
			with instance_create(x, y, obj_twoliterball)
			{
				if other.explodeInstant
					instance_destroy();
				image_xscale = other.image_xscale;
			}
		}
	}
	if object_index == obj_pizzice && REMIX
	{
		var i = 0;
		repeat 2
		{
			with instance_create(x, y, obj_sausageman_dead)
			{
				sprite_index = spr_pizzice_dead_NEW;
				image_index = i++;
				
				spr_palette = other.spr_palette;
				usepalette = other.usepalette;
				paletteselect = !usepalette ? 0 : other.paletteselect;
			}
		}
	}
	if object_index == obj_cheeseslime && snotty
	{
		if gamesave_open_ini()
		{
			ini_write_real("Game", "snotty", true);
			gamesave_close_ini(true);
			gamesave_async_save();
		}
	}
	notification_push(notifs.baddie_kill, [room, id, object_index]);
}
if (!in_baddieroom() && important == 0)
{
	if (global.prank_cankillenemy && !global.prank_enemykilled)
	{
		global.prank_enemykilled = true;
		trace("P Rank started!");
	}
	if (!instance_exists(obj_bosscontroller))
	{
		if (!elite || elitehit <= 0)
		{
			with (obj_player1)
				supercharge += 1;
		}
		if (!elite || elitehit <= 0)
		{
			global.combo += 1;
			global.enemykilled += 1;
			global.combotime = 60;
		}
		if (instance_exists(obj_hardmode))
			global.heatmeter_count++;
		
		if (!elite || elitehit <= 0) && !global.snickchallenge
		{
			var combototal = 10 + floor(global.combo * 0.5);
			global.collect += combototal;
			global.comboscore += combototal;
		}
	}
	sound_play_3d("event:/sfx/enemies/kill", x, y);
	
	shake_camera(3, 3 / room_speed);
	if !hydra
	{
		repeat 3
		{
			with create_debris(x, y, spr_slapstar)
			{
				hsp = random_range(-5, 5);
				vsp = random_range(-10, 10);
			}
		}
		instance_create(x, y, obj_bangeffect);
		
		if !MOD.Hydra
			add_baddieroom();
		
		if escape && !in_saveroom(ID, global.escaperoom)
			ds_list_add(global.escaperoom, ID);
		
		if 0.05 > random(1) && safe_get(id, "sugary")
			sound_play_3d("event:/modded/sfx/sugaryenemykill", x, y);
	}
	
	if global.leveltosave == "sucrose" && !instance_exists(obj_pizzaface) && global.fill != 0
		global.fill += calculate_panic_timer(0, 2.5);
	with create_baddiegibsticks(x, y)
	{
		hsp = clamp(other.hsp, -6, 6);
		vsp = other.vsp;
	}
}
else if (!in_baddieroom() && important == 1)
{
	//trace("destroy unimportant");
	sound_play_3d("event:/sfx/enemies/kill", x, y);
	shake_camera(3, 3 / room_speed);
	if !hydra
	{
		repeat 3
		{
			create_slapstar(x, y);
			create_baddiegibs(x, y);
		}
		add_baddieroom();
	}
}
if object_index != obj_pizzaball or destroyable
	fail_modifier(MOD.Pacifist);

if hydra && !in_baddieroom()
{
	var vars = variable_instance_get_names(id);
	
	mach3destroy = false;
	hp = 1;
	thrown = false;
	linethrown = false;
	boundbox = false;
	killbyenemybuffer = 30;
	
	hsp /= 3;
	if hsp == 0
		hsp = 3;
	else if abs(hsp) < 3
		hsp = 3 * sign(hsp);
	
	if scr_solid(x, y)
	{
		x = obj_player1.x;
		y = obj_player1.y;
	}
	
	with instance_create(x, y, object_index)
	{
		for(var i = 0, n = array_length(vars); i < n; i++)
			variable_instance_set(id, vars[i], variable_instance_get(other.id, vars[i]));
		
		sprite_index = other.sprite_index;
		alarm[11] = 15;
	}
	
	if bbox_in_camera()
	{
		with instance_create(x, y, object_index)
		{
			for(var i = 0, n = array_length(vars); i < n; i++)
				variable_instance_set(id, vars[i], variable_instance_get(other.id, vars[i]));
		
			hsp *= -1;
			vsp += random_range(1, -2);
			sprite_index = other.sprite_index;
			alarm[11] = 15;
		}
	}
}
