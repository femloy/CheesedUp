var _transfo = false;
var _state = other.state;
with (other)
{
	if (!scr_transformationcheck() && state != states.comingoutdoor && state != states.door)
	{
		if (state == states.ghost)
			notification_push(notifs.priest_ghost, [ghosttimer, room]);
		if (state == states.mort || state == states.mortjump || state == states.morthook || state == states.mortattack || state == states.mortjump || state == states.boxxedpep || state == states.boxxedpepjump || state == states.boxxedpepspin || state == states.ghost || state == states.barrelslide || state == states.barrel || state == states.barreljump)
		{
			if (hsp != 0)
				xscale = sign(hsp);
			movespeed = abs(hsp);
		}
		with (obj_mortprojectile)
		{
			create_particle(x, y, part.genericpoofeffect);
			instance_destroy();
		}
		transformationsnd = false;
		state = states.normal;
		sprite_index = spr_idle;
		input_buffer_grab = 0;
		if isgustavo
		{
			state = states.ratmount;
			sprite_index = spr_ratmount_idle;
		}
		dir = xscale;
		ghostdash = false;
		ghostpepper = 0;
		_transfo = true;
		create_particle(x, y, part.genericpoofeffect);
	}
}
if (_transfo)
{
	sound_play("event:/sfx/pep/pray");
	var p = other.id;
	with (instance_create(other.x - 540, camera_get_view_y(view_camera[0]) - 100, obj_priestangel))
	{
		priestID = other.id;
		playerid = p;
	}
	with (other)
	{
		if (_state == states.mort || _state == states.morthook || _state == states.mortjump || _state == states.mortattack)
			create_debris(x, y - 40, spr_mortdead);
	}
	if (sprite_index != spr_angelpriest)
		sprite_index = spr_pray;
	if (collect && !in_saveroom())
	{
		notification_push(notifs.priest_collect, [room, id, _state]);
		add_saveroom();
		
		if !global.snickchallenge
		{
			var val = 500;
			global.collect += val;
			global.combotime = 60;
			global.heattime = 60;
			with (instance_create(x + 16, y, obj_smallnumber))
				number = string(val);
			scr_sound_multiple(global.snd_collect, x, y);
			if (escape)
				add_saveroom(id, global.escaperoom);
			var d = round(val / 16);
			for (var i = 0; i < val; i += d)
			{
				spr_palette = noone;
				paletteselect = 0;
				
				var spr = scr_collectspr(obj_collect, , false);
				create_collect(other.x + irandom_range(-60, 60), other.y + irandom_range(-60, 60), spr, d, spr_palette, paletteselect);
			}
		}
	}
}
