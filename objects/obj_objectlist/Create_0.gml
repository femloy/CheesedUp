event_inherited();
object_list = noone;
surface = noone;
scroll_y = 0;
scroll_ymax = 0;
hovered_object = -1;
OnSelect = function()
{
	if (hovered_object >= 0 && object_list != noone)
	{
		obj_editor.object = ds_list_find_value(object_list, hovered_object);
		obj_editor.state = 0;
		if (parent.OnDeselect != noone)
			parent.OnDeselect();
		selected = false;
	}
};
