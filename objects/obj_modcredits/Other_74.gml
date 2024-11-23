live_auto_call;

if async_load[? "event_type"] == FMOD_TIMELINE_MARKER_CALLBACK
{
	var name = async_load[? "name"];
	switch name
	{
		case "Marker A":
			con = 3;
			break;
		case "Marker B":
			image_index = 1;
			flash = 1;
			break;
		case "Marker C":
			image_index = 2;
			flash = 1;
			break;
		case "Marker D":
			image_index = 3;
			flash = 1;
			break;
	}
}
