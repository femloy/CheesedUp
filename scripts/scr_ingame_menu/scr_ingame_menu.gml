function open_menu()
{
	if global.in_menu exit;
	
	global.in_menu = true;
	global.input_buffer = 2;
}
function close_menu()
{
	if !global.in_menu exit;
	
	global.in_menu = false;
	global.input_buffer = 2;
}
