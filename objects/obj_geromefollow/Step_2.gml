yoffset = 0;
if (state != states.backbreaker)
{
	if (sprite_index != collectedspr && sprite_index != tauntspr)
	{
		event_inherited();
		if (!do_end)
			visible = obj_player1.visible;
		sprite_index = (x != xprevious) ? movespr : idlespr;
		if ((xprevious - x) != 0)
			image_xscale = -sign(xprevious - x);
		else if (playerid.hsp == 0)
			image_xscale = playerid.xscale;
		if (obj_player1.state == states.backbreaker)
		{
			sprite_index = tauntspr;
			image_index = irandom(sprite_get_number(sprite_index) - 1);
			state = states.backbreaker;
			tauntID = instance_create(x, y, obj_baddietaunteffect);
		}
	}
}
else
{
	if (sprite_index != collectedspr)
	{
		var s = obj_player1.sprite_index;
		if (s == obj_player1.spr_supertaunt1 || s == obj_player1.spr_supertaunt2 || s == obj_player1.spr_supertaunt3 || s == obj_player1.spr_supertaunt4 || s == obj_player1.spr_ratmount_supertaunt)
		{
			sprite_index = collectedspr;
			image_index = 0;
		}
	}
	if (obj_player1.state != states.backbreaker || (sprite_index == collectedspr && floor(image_index) == (image_number - 1)))
	{
		sprite_index = idlespr;
		instance_destroy(tauntID);
		state = states.normal;
	}
}
if (room == rank_room || room == timesuproom)
	visible = false;
if instance_exists(obj_geromeanim)
	visible = false;
