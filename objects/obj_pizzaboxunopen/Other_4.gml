if in_saveroom()
{
	instance_destroy();
	exit;
}

var oix = content;
if global.in_afom && is_array(oix)
	oix = cyop_get_object(oix[0]);

if (oix == obj_pizzakinshroom && global.shroomfollow)
or (oix == obj_pizzakincheese && global.cheesefollow)
or (oix == obj_pizzakintomato && global.tomatofollow)
or (oix == obj_pizzakinsausage && global.sausagefollow)
or (oix == obj_pizzakinpineapple && global.pineapplefollow)
or global.snickchallenge or global.timeattack
{
	instance_destroy(id, false);
	exit;
}

if oix == obj_bigcollect
{
	sprite_index = spr_pizzaboxunopen_old;
	mask_index = -1;
}

if sprite_index != spr_pizzaboxunopen_old
	scr_fmod_soundeffect(snd, x, y);
