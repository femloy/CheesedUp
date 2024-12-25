live_auto_call;

fadein = false;
fadealpha = 0;
start = false;
loading = false;
group_arr = noone;
title_music = noone;
title_musicID = noone;
offload_arr = noone;
event_user(0);

depth = -600;
with obj_gusbrickchase
	fmod_event_instance_stop(snd, true);
with obj_gusbrickfightball
	alarm[1] = -1;

// pto
cyop_level = "";

modif_t = 0;
modifiers = [];
modif_con = 0;
modif_shake = 0;

var names = struct_get_names(MOD);
for(var i = 0; i < array_length(names); i++)
{
	if MOD[$ names[i]] > 0
		array_push(modifiers, get_modifier_icon(names[i]));
}

screen_shake = 0;

vigigolf = false;
vigigolf_con = 0;
vigigolf_t = 0;
dynamite = {a: 0, img: 0};
particles = [];
