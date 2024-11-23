live_auto_call;

if !surface_exists(surf)
	surf = surface_create(SCREEN_WIDTH, SCREEN_HEIGHT);

// set up tiles
surface_set_target(surf);
draw_clear(c_white);

if keyboard_check_pressed(ord("T"))
{
	if instance_exists(obj_deliveryfollower)
	{
		with obj_deliverytimer
		{
			minutes = 0;
			seconds = 0;
		}
	}
	else
	{
		var follower = instance_create(x, y, obj_deliveryfollower);
		with instance_create(0, 0, obj_deliverytimer)
		{
			minutes = 0;
			seconds = 10;
			maxminutes = minutes;
			maxseconds = seconds;
		}
		with instance_create(0, 0, obj_clock)
		{
			objectID = follower;
			timedgate = false;
		}
	}
}

if !instance_exists(obj_deliverytimer)
	radius = lerp(radius, 0, 0.2);
else
	radius = lerp(radius, 1, 0.2);

for(var i = 0; i < array_length(spotlights); i++)
{
	with spotlights[i][0]
		other.draw_hole(
			x + other.spotlights[i][2][0], y + other.spotlights[i][2][1],
			other.spotlights[i][1] * (object_index == obj_player1 ? other.radius : 1),
			true
		);
}

var lays = room_get_tile_layers();
for(var i = 0; i < array_length(lays); i++)
	draw_tilemap(lays[i].tilemap, -CAMX, -CAMY);
for(var i = 0; i < array_length(darkners); i++)
{
	var me = darkners[i];
	with me
	{
		x -= CAMX;
		y -= CAMY;
		
		if me == obj_taunteffect
			draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, 1, 0, c_black, 1);
		else if me == obj_player
			draw_player();
		else
			draw_self();
		
		x += CAMX;
		y += CAMY;
	}
}


for(var i = 0; i < array_length(spotlights); i++)
{
	with spotlights[i][0]
		other.draw_hole(
			x + other.spotlights[i][2][0], y + other.spotlights[i][2][1],
			other.spotlights[i][1] * (object_index == obj_player1 ? other.radius : 1),
			false
		);
}

surface_reset_target();

// draw the surface
shader_set(shd_rank);

shader_set_uniform_f(black, 0.2, 0.2, 0.2);
shader_set_uniform_f(brown, 0, 0, 0);

draw_surface(surf, CAMX, CAMY);
shader_reset();

with obj_clock
	draw_self();
//draw_sprite_stretched_ext(spr_vignette, 0, CAMX, CAMY, CAMW, CAMH, c_black, 0.5);
