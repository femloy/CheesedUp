if in_saveroom()
{
	instance_destroy();
	exit;
}
if !is_real(content)
	content = real(content);

if (content == obj_pizzakinshroom && global.shroomfollow)
{
	instance_destroy(id, false);
	exit;
}
if (content == obj_pizzakincheese && global.cheesefollow)
{
	instance_destroy(id, false);
	exit;
}
if (content == obj_pizzakintomato && global.tomatofollow)
{
	instance_destroy(id, false);
	exit;
}
if (content == obj_pizzakinsausage && global.sausagefollow)
{
	instance_destroy(id, false);
	exit;
}
if (content == obj_pizzakinpineapple && global.pineapplefollow)
{
	instance_destroy(id, false);
	exit;
}

if global.snickchallenge or global.timeattack
{
	instance_destroy(id, false);
	exit;
}

if content == obj_bigcollect
{
	sprite_index = spr_pizzaboxunopen_old;
	mask_index = -1;
}

if sprite_index != spr_pizzaboxunopen_old
	scr_fmod_soundeffect(snd, x, y);
