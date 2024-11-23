SS_CODE_START;

mask_index = spr_juicepuddledone;
scr_collide();

if grounded
{
	hsp = Approach(hsp, 0, 0.1);
	
	var slope = check_slope(x, y + 1, true);
	if slope && global.sloperot
		draw_angle = scr_slope_angle(slope);
	else
		draw_angle = 0;
	
	if sprite_index != spr_juicepuddledone
		sprite_index = spr_juicepuddlesplash;
}
else
	draw_angle = Approach(draw_angle, 0, 45 / 16);

if sprite_index == spr_juicepuddlesplash && image_index >= image_number - 1
	sprite_index = spr_juicepuddledone;

if check_solid(x, y)
	instance_destroy(id, false);

SS_CODE_END;
