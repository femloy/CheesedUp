live_auto_call;

var col = false;
with obj_player
{
	if vsp < 0 && place_meeting(x, y + vsp, other)
		col = true;
}
if col && image_speed == 0
{
	if global.pizzacoinOLD >= coins
	{
		sound_play_3d("event:/modded/sfx/weaponmachine", x, y);
		global.pizzacoinOLD -= coins;
		image_speed = 0.35;
	}
	else if sprite_index == spr_weaponmachine_custom
	{
		sound_play_3d(sfx_bumpwall, x, y);
		shake = 2;
		sprite_index = spr_weaponmachine_custom_press;
		image_index = 0;
		image_speed = 0.35;
	}
}
shake = Approach(shake, 0, 0.1);
