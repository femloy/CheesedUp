if !in_saveroom()
{
	add_saveroom();
	if object_index == obj_escapecollectbig
		add_saveroom(id, global.escaperoom);
}
event_user(0);
