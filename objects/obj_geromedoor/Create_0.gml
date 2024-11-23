targetRoom = room;
target_x = 0;
target_y = 0;
image_speed = 0;
depth = 150;
targetDoor = "A";
visited = false;
uparrow = false;
uparrowID = noone;

spr_shake = spr_geromedoor_shake;

if SUGARY_SPIRE
{
	sugary = SUGARY;
	if sugary
	{
		sprite_index = spr_geromedoor_ss;
		spr_shake = spr_geromedoor_shake;
	}
}
