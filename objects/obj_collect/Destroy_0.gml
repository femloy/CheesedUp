if (room == rm_editor)
	exit;
if !in_saveroom()
{
	add_saveroom();
	if (object_index == obj_escapecollect)
		add_saveroom(id, global.escaperoom);
}
if (!gotowardsplayer)
	scr_ghostcollectible();
