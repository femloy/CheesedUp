if other.state == 0
{
	if (ds_list_find_index(global.saveroom, id) == -1)
		add_saveroom();
	if alarm[0] == -1
		alarm[0] = 1;
	other.state++;
}
