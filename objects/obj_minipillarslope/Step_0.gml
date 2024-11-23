if (room == rm_editor)
{
	mask_index = wokespr;
	exit;
}
if (player < 2)
{
    if (place_meeting(xstart, ystart, obj_player1) && obj_player1.state != states.chainsaw)
        player = 1;
    else if (global.panic && !place_meeting(xstart, ystart, obj_player1))
        player = 2;
}
if (global.panic == false || player <= 1)
{
	x = -10000;
	y = -10000;
	sprite_index = sleepspr;
	mask_index = sleepspr;
}
else
{
	mask_index = wokespr;
	sprite_index = wokespr;
	x = xstart;
	y = ystart;
}
