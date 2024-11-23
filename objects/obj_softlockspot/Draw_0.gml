live_auto_call;

if state > 0
{
	var spr = spr_grabbiehand_catch;
	if state == 2
		spr = spr_grabbiehand_fall;
	if state == 5
		spr = spr_grabbiehand_idle;
	draw_sprite_ext(spr, -1, handx, handy, player.xscale, 1, 0, c_white, 1);
}
