flags.do_save = 0
condition = function()
{
    with obj_player
    {
        if targetDoor == "F"
            return id;
    }
	return false;
}
output = function(player)
{
    with player
	{
		sound_play_3d("event:/sfx/pep/slip", x, y);
		sprite_index = spr_slipbanan1;
		vsp = -11;
		movespeed = abs(movespeed);
		hsp = movespeed * xscale;
		image_index = 0;
		state = states.slipbanan;
		instance_destroy(other);
	}
}
