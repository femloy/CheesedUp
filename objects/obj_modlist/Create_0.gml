live_auto_call;

buffer = 2;
sel = 0;

scr_init_input();

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
		mod_struct: noone
	};
	array_push(mods, struct);
	return struct;
}

var cu = add_mod("Cheesed Up!", "Can't get enough Pizza Tower");
cu.icon_img = 1;
cu.enabled = 2;
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
}

with obj_option
	other.depth = depth - 1;
scroll = 0;
