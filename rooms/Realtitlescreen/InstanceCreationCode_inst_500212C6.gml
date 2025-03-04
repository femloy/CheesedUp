if global.titlecutscene
{
	global.titlecutscene = false;
	
	scene_info = [
		[cutscene_title_start],
		[cutscene_set_sprite, obj_player1, spr_file2, 0.35, 1],
		//[cutscene_wait, 120],
		[cutscene_title_middle],
		[cutscene_set_sprite, obj_player1, spr_player_bossintro, 0.3, -1],
		[cutscene_set_vsp, obj_player1, -6],
		[cutscene_waitfor_sprite, obj_player1],
		[cutscene_title_end]
	];
}
else
{
	with obj_title
		collide = true;
	scene_info = [
		[cutscene_wait, 2],
		[cutscene_title_end]
	];
}

var did = false;
with obj_player1
{
	did = true;
	
	hallway = false;
	box = false;
	var door_pos = scr_door_spawnpos(obj_doorA);
	
	repeat 2
		array_insert(other.scene_info, 0, [cutscene_set_player_actor], [cutscene_set_player_pos, door_pos[0], door_pos[1]], [cutscene_wait, 1]);
}
if !did
	trace("[WARNING] Did not did");
