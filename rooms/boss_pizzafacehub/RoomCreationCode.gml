pal_swap_init_system(shd_pal_swapper);
notification_push(notifs.boss_dead, [boss_pizzafacehub]);
gameframe_caption_text = lang_get_value("caption_boss_pizzafacehub");

ini_open_from_string(obj_savesystem.ini_str);
ini_write_real("w5stick", "bosskey", true);
obj_savesystem.ini_str = ini_close();
gamesave_async_save();

if obj_player1.character == "N" or global.swapmode
{
	var bg = layer_background_get_id("Backgrounds_Ring2");
	layer_background_sprite(bg, bg_pizzaface1_3N);
}

with obj_player1
{
	tauntstoredstate = states.normal;
	landAnim = true;
	state = states.animation;
	buffer = 100;
	sprite_index = spr_slipbanan2;
	image_index = sprite_get_number(spr_slipbanan2) - 1;
	image_speed = 0.35;
	if character == "N"
	{
		sprite_index = spr_playerN_bombend;
		image_index = 0;
	}
}
global.roommessage = "TOP OF THE PIZZA TOWER";
global.leveltorestart = tower_finalhallway;
