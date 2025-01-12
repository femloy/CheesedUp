ensure_order;

unlocked = true;
key = false;

if gamesave_open_ini()
{
	unlocked = ini_read_real(save, "door", false);
	key = ini_read_real(save, "bosskey", false);
	gamesave_close_ini(false);
}

if key && !unlocked
	instance_create(obj_player1.x, obj_player1.y, obj_giantkeyfollow);
if unlocked
	sprite_index = spr_elevatoropen;
if unlocked || key
	scr_create_uparrowhitbox();
if global.panic
{
	instance_create(x + 50, y + 96, obj_rubble);
	instance_destroy();
}
