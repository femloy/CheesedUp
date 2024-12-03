live_auto_call;

if !MOD.CosmicClones or room == timesuproom
{
	instance_destroy();
	exit;
}

if state != states.dead && state != states.fall
{
	if room == rank_room
	{
		state = states.dead;
		grace_period = 60;
	}
	else if !instance_exists(tracker)
	{
		tracker = instance_create(0, 0, obj_objecticontracker);
		tracker.objectID = id;
		tracker.sprite_index = spr_icon_cosmicclone;
	}
}
else
	instance_destroy(tracker);

var pitch = 1 + sin(current_time / 10) * .1;
sound_instance_move(snd_voicehurt, x, y);
sound_instance_move(snd_jump, x, y);

fmod_event_instance_set_pitch(snd_voicehurt, pitch);
fmod_event_instance_set_pitch(snd_jump, pitch);
fmod_event_instance_set_pitch(snd_taunt, pitch * .9);

var struct = noone;
while ds_queue_size(queue) >= distance
	struct = ds_queue_dequeue(queue);

var parry_sprites = [obj_player1.spr_parry1, obj_player1.spr_parry2, obj_player1.spr_parry3];
switch state
{
	case states.normal:
		if struct == noone
		{
			if is_visible
			{
				x = obj_player1.x;
				y = obj_player1.y;
			}
			grace_period = 10;
			is_visible = false;
			break;
		}
		else if obj_player1.state == states.secretenter or (obj_player1.cutscene && obj_player1.state != states.chainsaw)
		or obj_player1.state == states.actor or obj_player1.state == states.comingoutdoor or obj_player1.state == states.bombgrab
		or obj_player1.sprite_index == obj_player1.spr_shotgunpullout or obj_player1.state == states.slipbanan
		or obj_player1.state == states.teleport or obj_player1.state == states.animation
		{
			grace_period = 60;
			is_visible = true;
			break;
		}
		else
		{
			if grace_period > 0
				grace_period--;
			
			if grace_period > 0
			{
				if global.time % 3 == 0
					is_visible = !is_visible;
			}
			else
			{
				parried = false;
				is_visible = true;
			}
		}
		
		// parry
		var par = collision_rectangle(bbox_left - 15, bbox_top - 15, bbox_right + 15, bbox_bottom + 15, obj_parryhitbox, false, false);
		if par && grace_period <= 0
		{
			var old_xscale = image_xscale;
			if x != par.x
				image_xscale = -sign(x - par.x);
			
			if image_xscale != old_xscale
				sprite_index = obj_player1.spr_hurtjump;
			else
				sprite_index = obj_player1.spr_hurt;
			
			with par
				event_user(0);
			grace_period = 60;
			state = states.hurt;
			ds_queue_clear(queue);
			struct = noone;
			is_visible = true;
			vsp = -14;
			
			scr_sleep(100);
			
			instance_create(x, y, obj_bangeffect);
			image_index = 0;
			instance_create(x, y, obj_spikehurteffect);
			
			fmod_event_instance_play(snd_voicehurt);
			parried = true;
		}
		break;
	
	case states.hurt:
		image_speed = 0.35;
		if !grounded
			hsp = 8 * -image_xscale;
		else
			hsp = 0;
		
		scr_collide();
		break;
	
	case states.dead:
		is_visible = true;
		
		image_speed = 0.35;
		x = room_width / 2 + random_range(-5, 5);
		y = room_height / 2 + random_range(-5, 5);
		sprite_index = obj_player1.spr_hurtjump;
		
		if --grace_period <= 0
		{
			state = states.fall;
			hsp = random_range(10, 18) * choose(-1, 1);
			vsp = random_range(-10, -18);
			
			fmod_event_instance_play(snd_voicehurt);
			instance_create(x, y, obj_bangeffect);
			sound_play_3d(sfx_killenemy, x, y);
		}
		exit;
	
	case states.fall:
		sprite_index = obj_player1.spr_deathend;
		x += hsp;
		y += vsp;
		vsp += 0.5;
		exit;
}

if struct != noone
{
	if state == states.hurt && is_visible
	{
		repeat 10
		{
			with instance_create(x, y, obj_debris)
			{
				sprite_index = spr_keyparticles;
				image_blend = other.random_color();
				vsp -= 4;
				hsp *= 1.5;
			}
		}
		is_visible = false;
	}
	
	x = struct.x;
	y = struct.y;
	sprite_index = struct.sprite_index;
	image_xscale = struct.image_xscale;
	image_yscale = struct.image_yscale;
	
	if (!scr_solid(x, y + image_yscale) && struct.grounded)
	or (!scr_solid(x + image_xscale, y) && (sprite_index == obj_player1.spr_climbwall))
		sprite_index = obj_player1.spr_air;
	else
		image_index = struct.image_index;
	
	if (sprite_index == obj_player1.spr_hurt or sprite_index == obj_player1.spr_hurtjump)
	&& obj_player1.state != states.secretenter && !instance_exists(obj_secretportalstart)
	{
		sprite_index = obj_player1.spr_air;
		if x - xprevious != 0
			image_xscale = sign(x - xprevious);
	}
	
	if state == states.hurt
		state = states.normal;
	
	if parried && array_contains(parry_sprites, sprite_index, 0, infinity)
		is_visible = false;
	else if parried && array_contains(parry_sprites, sprite_previous, 0, infinity)
	{
		with instance_create(x, y, obj_parryeffect)
			image_blend = other.random_color();
	}
	
	if vsp >= 0 && y - yprevious < 0 && is_visible && !scr_solid(x, y + 1)
	{
		fmod_event_instance_play(snd_jump);
		if scr_solid(x, yprevious + 1)
		{
			with instance_create(x, yprevious, obj_highjumpcloud2)
				image_blend = other.random_color();
		}
	}
	vsp = y - yprevious;
	
	if sprite_index == obj_player1.spr_taunt && sprite_previous != sprite_index
	{
		sound_instance_move(snd_taunt, x, y);
		fmod_event_instance_play(snd_taunt);
		
		with instance_create(x, y, obj_baddietaunteffect)
			image_blend = other.random_color();
	}
	sprite_previous = sprite_index;
}

if global.time % 5 == 0 or !is_visible
{
	with instance_create(x + random_range(-50, 50), y + random_range(-50, 50), obj_keyeffect)
		image_blend = other.random_color();
}

ds_queue_enqueue(queue, 
{
	x : target_object.x + target_object.smoothx, 
	y : target_object.y, 
	sprite_index : player_sprite(target_object),
	image_index : target_object.image_index,
	image_xscale : target_object == obj_player1 ? target_object.xscale * target_object.scale_xs : target_object.image_xscale,
	image_yscale : target_object == obj_player1 ? target_object.yscale * target_object.scale_ys : target_object.image_yscale,
	grounded : target_object.grounded
});

layer_4_index = (layer_4_index + 0.1) % sprite_get_number(spr_cosmicclone_layer4);
for (var i = 0; i < array_length(layers); i++)
	layer_offsets[i] = layer_offsets[i] + (i * .1) % 64;
