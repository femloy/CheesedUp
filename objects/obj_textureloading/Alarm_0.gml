if instance_exists(obj_langload)
{
	alarm[0] = 1;
	exit;
}

var item = array_shift(tex_list);
if item != undefined
{
	var tex = item[0];
	text = embed_value_string(lstr("loading_texture"), [item[1]]);
	
	trace("Loading texture: ", tex);
	if !texture_is_ready(tex)
		texture_prefetch(tex);
	
	alarm[0] = 1;
}
else
{
	image_alpha -= 0.1;
	if image_alpha <= -0.1
	{
		//room_goto(Realtitlescreen);
		room_goto(Initroom);
		screen_apply_vsync();
	}
	
	alarm[0] = 1;
}
