function in_saveroom(_id = id, _map = global.saveroom)
{
	if !is_string(_id) && variable_instance_exists(_id, "ID")
		_id = _id.ID;
	return ds_list_find_index(_map, _id) > -1; // INDEX CAN BE 0
}
function add_saveroom(_id = id, _map = global.saveroom)
{
	if !is_string(_id) && variable_instance_exists(_id, "ID")
		_id = _id.ID;
	ds_list_add(_map, _id);
}
function in_baddieroom(_id = id)
{
	return in_saveroom(_id, global.baddieroom);
}
function add_baddieroom(_id = id)
{
	add_saveroom(_id, global.baddieroom);
}
