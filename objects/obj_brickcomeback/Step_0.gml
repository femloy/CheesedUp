if (obj_player.isgustavo == 0)
{
	create_particle(x, y, part.genericpoofeffect);
	instance_destroy();
}
if (!trapped)
{
	if (obj_player1.state == states.ratmountgrind || obj_player1.state == states.ratmountladder || obj_player1.state == states.ratmountcrouch || obj_player1.state == states.door or obj_player1.state == states.tumble)
	{
		wait = true;
		sprite_index = spr_lonebrick_wait;
		alarm[0] = buffed ? 10 : 30;
		depth = obj_player1.depth + 1;
		comeback = false;
	}
	if (comeback == 1)
	{
		depth = obj_player1.depth + 1;
		x = Approach(x, obj_player1.x, cbspeed);
		y = Approach(y, obj_player1.y, cbspeed);
		cbspeed = Approach(cbspeed, buffed ? max(20, abs(obj_player1.vsp * 3)) : 20, buffed ? 3 : 1);
	}
	else if (wait == 0)
	{
		x += hsp;
		y += vsp;
		if (vsp < 20)
			vsp += 0.5;
	}
	if (comeback)
		sprite_index = spr_lonebrick_comeback;
}
else if (baddieID == noone)
{
	vsp = -10;
	if ((y + vsp) < 80 || scr_solid(x, y - 78))
		vsp = 0;
	y += vsp;
}
else if (!instance_exists(baddieID))
	trapped = false;
