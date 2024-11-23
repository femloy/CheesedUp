live_auto_call;

disable = safe_get(obj_player1, "cutscene");

highest_y = -250;
var _instY = collision_line(obj_player1.x, obj_player1.y, obj_player1.x, obj_player1.y + highest_y, obj_solid, false, true);
if _instY != noone
	highest_y = min(-(obj_player.bbox_top - _instY.bbox_bottom), -50);

if part_time-- <= 0
{
	part_time = 5;
	create_red_afterimage(x, y, sprite_index, image_index, image_xscale);
}

if state == 0
{
	if sprite_index == spr_pizzamancer_attack && image_index >= image_number - 1
		sprite_index = spr_pizzamancer_idle;
	
	if random_buffer > 0
		random_buffer--;
	else if !disable
	{
		var _col = collision_line(x, y, obj_player1.x, obj_player1.y, obj_solid, false, true);
		if !check_solid(x, y) && !check_slope(x, y) && _col == noone
		{
			state = 1;
			sprite_index = spr_pizzamancer_attack;
			image_index = 0;
		}
	}
}
if state == 1
{
	image_index = min(image_index, 5);
	if !check_solid(x, y) && !check_slope(x, y) && image_index >= 5
	{
		sound_play_3d(sfx_enemyprojectile, x, y);
		state = 2;
		image_index = 6;
	}
}
if state == 2
{
	var n = irandom(array_length(content) - 1);
	with instance_create(x, y, content[n])
	{
		important = true;
		state = states.stun;
		stunned = 50;
			
		if MOD.DoubleTrouble
			hsp = -4;
	}
	if MOD.DoubleTrouble
	{
		with instance_create(x, y, content[n])
		{
			important = true;
			state = states.stun;
			stunned = 50;
			hsp = 4;
		}
	}
	
	state = 0;
	
	var threshold = global.heatmeter_threshold;
	random_buffer = (random_max - (50 * threshold)) + irandom_range(-(60 * threshold), random_random - (30 * threshold));
}

hsp = Wave(-288, 288, 10, 0);
vsp = Wave(highest_y, highest_y + 70, 2, 0);
x = obj_player1.x + hsp;
y = lerp(y, obj_player1.y + obj_player1.vsp + vsp, 0.05);
