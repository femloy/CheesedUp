if (!trapped)
{
	if (comeback == 1 && obj_player1.state != states.ratmountpunch && obj_player1.sprite_index != obj_player1.spr_lonegustavohurt && obj_player1.state != states.ratmountgroundpound)
	{
		var fuck = true;
		with other
			fuck = scr_transformationcheck();
		
		other.brick = true;
		if (other.state != states.ratmountcrouch && other.state != states.tumble && other.state != states.backbreaker && other.state != states.bump && other.state != states.ratmounthurt && other.state != states.victory && fuck)
		{
			if (!other.grounded)
				other.sprite_index = other.spr_ratmount_fall;
			else
				other.sprite_index = other.spr_ratmount_idle;
		}
		if (other.state == states.ratmountjump)
		{
			other.sprite_index = other.spr_ratmount_fall;
			other.jumpAnim = false;
		}
		else if (other.state == states.bump)
			other.sprite_index = other.spr_ratmount_bump;
		instance_create(other.x, other.y, obj_genericpoofeffect);
		instance_destroy();
	}
}
else if (other.state == states.ratmountpunch && baddieID == noone)
{
	sound_play_3d("event:/sfx/pep/punch", x, y);
	vsp = -6;
	hsp = other.xscale * 8;
	trapped = false;
	wait = true;
	comeback = false;
	alarm[0] = 30;
}
