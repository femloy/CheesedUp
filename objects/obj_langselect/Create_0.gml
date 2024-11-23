live_auto_call;

image_speed = 0.35;
lang = [];
select = 0;
startbuffer = 10;
depth = -1000;

left_offset = 0;
right_offset = 0;

var key = ds_map_find_first(global.lang_map);
var i = 0;
while !is_undefined(key)
{
	var s = {
		lang: key,
		name: lang_get_value_raw(key, "display_name"),
		spr_name: noone,
		sprite: spr_lang_missing,
		locked: false
	};
	if !is_undefined(global.lang_sprite_map[? key])
	{
		s.sprite = global.lang_sprite_map[? key][? spr_lang_flag] ?? spr_lang_missing;
		s.spr_name = global.lang_sprite_map[? key][? spr_lang_name] ?? noone;
	}
	else if key == "en"
		s.sprite = spr_lang_flag;
	
	if global.lang_map[? key][? "is_wip"] ?? false
		s.name = s.name + " (WIP)";
	
	if global.lang == key
		select = i;
	
	array_push(lang, s);
	key = ds_map_find_next(global.lang_map, key);
	i++;
}
