if !collisioned
{
	while !grounded
	{
		hsp = 0;
		vsp = 50;
		scr_collide();
			
		if y > room_height
		{
			y = ystart;
			break;
		}
	}
	
	collisioned = true;
	hsp = 0;
	vsp = 0;
	ds_list_add(global.baddietomb, [room, x, y]);
}
