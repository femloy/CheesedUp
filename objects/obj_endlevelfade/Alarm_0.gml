reset_modifier();
if do_rank
{
	with instance_create(room_width / 2, room_height / 2, obj_rank)
	{
		toppinvisible = other.toppinvisible;
		if !toppinvisible && global.leveltosave != "exit" && global.leveltosave != "secretworld" && !global.timeattack
		{
			if !global.swapmode
				array_delete(text, 0, 1);
			else
				array_delete(text, 0, 3);
			array_pop(text);
		}
		depth = other.depth - 2;
		
		var leveltosave = global.leveltosave;
		if instance_exists(obj_cyop_loader)
			leveltosave = string_replace(leveltosave, "cyop_", "");
		
		if gamesave_open_ini()
		{
			for (var i = 0; i < array_length(toppin); i++)
			{
				if !global.sandbox && global.newtoppin[i] && array_contains(base_game_levels(false), global.leveltosave)
					toppin[i] = 1;
				else if ini_read_real("Toppin", leveltosave + string(i + 1), false)
					toppin[i] = 2;
				else
					toppin[i] = 0;
			}
			gamesave_close_ini(false);
		}
		else
			toppinvisible = false;
	}
}
else
{
	instance_create(0, 0, obj_endgamefade);
	alarm[1] = 120;
}
if instance_exists(obj_treasureviewer) || !do_rank
	exit;

with obj_player
	visible = false;

if global.collect >= global.collectN
{
	with instance_create(obj_player2.x, obj_player2.y, obj_dashcloud)
		sprite_index = spr_bombexplosion;
	repeat 6
		instance_create(obj_player2.x, obj_player2.y, obj_baddiegibs);
}
if global.collectN > global.collect
{
	with instance_create(obj_player1.x, obj_player1.y, obj_dashcloud)
		sprite_index = spr_bombexplosion;
	repeat 6
		instance_create(obj_player1.x, obj_player1.y, obj_baddiegibs);
	sound_play("event:/sfx/misc/explosion");
}
