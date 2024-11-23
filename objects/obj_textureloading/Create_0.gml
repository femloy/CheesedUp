group_arr = ["hudgroup", "playergroup", "introgroup", "smallgroup", "levelstructuregroup", "baddiegroup"];
//if DEBUG
	array_push(group_arr, "debuggroup");

tex_list = array_create(0);
tex_pos = 0;

for (var i = 0; i < array_length(group_arr); i++)
{
	var _tex_array = texturegroup_get_textures(group_arr[i]);
	for (var j = 0; j < array_length(_tex_array); j++)
		array_push(tex_list, [_tex_array[j], group_arr[i]]);
}
tex_max = array_length(tex_list); // used in draw
alarm[0] = 30;

text = "";
scr_characters(false);
