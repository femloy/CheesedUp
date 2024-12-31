live_auto_call;

buffer = 2;
sel = -1;
anim_t = 0;

outback = animcurve_get_channel(curve_menu, "outback");
incubic = animcurve_get_channel(curve_menu, "incubic");
mod_sel_safe = 0;

with obj_option
	other.depth = depth - 1;
scroll = 0;

scr_init_input();

with create_transformation_tip("")
{
	depth = other.depth - 1;
	fadeout_speed = fadein_speed;
}

mods = array_create(0);
add_mod = function(name, desc, icon = noone)
{
	var struct =
	{
		name: name,
		desc: desc,
		icon: icon,
		icon_img: 0,
		enabled: true,
		select_func: noone,
		mod_struct: noone,
		can_enable: true,
		can_disable: true
	};
	array_push(mods, struct);
	return struct;
}

var cu = add_mod("Cheesed Up!", "Can't get enough Pizza Tower");
cu.icon_img = 1;
cu.can_enable = false;
cu.can_disable = false;
cu.select_func = function()
{
	sound_play(sfx_select);
	instance_create(0, 0, obj_modconfig);
	instance_destroy();
};

for(var i = 0; i < array_length(global.mods); i++)
{
	var this = global.mods[i];
	
	var m = add_mod(this.name, this.desc, this.icon);
	m.mod_struct = this;
	m.enabled = this.enabled;
	
	if this.conditions != noone && live_snippet_call(this.conditions)
	{
		if is_struct(live_result)
		{
			m.can_enable = live_result[$ "enable"] ?? true;
			m.can_disable = live_result[$ "disable"] ?? true;
		}
		else if !live_updating_enabled
		{
			audio_play_sound(sfx_pephurt, 0, false);
			show_message($"Error for mod \"{this.name}\": conditions.gml return value needs to be a struct containing \{enable, disable\}. {live_result} was returned.");
		}
	}
}
