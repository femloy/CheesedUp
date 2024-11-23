if (room == rm_editor)
	exit;
if !in_saveroom()
	add_saveroom();
scr_ghostcollectible();
