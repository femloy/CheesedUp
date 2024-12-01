with obj_parallax
{
	if id != other.id
	{
		trace("Extra obj_parallax in " + room_get_name(room));
		instance_destroy(other);
	}
}
depth = -1000;

asset_layers = ["Assets_BG", "Assets_BG1", "Assets_BG2", "Assets_stillBG1", "Assets_FG", "Assets_FG1", "Assets_FG2", "Assets_stillBG"];
asset_parallax = [[0.1, 0.1], [0.05, 0.05], [0.1, 0.1], [0.05, 0], [-0.1, -0.1], [-0.05, -0.05], [-0.1, -0.1], [0.1, 0]];
//room_started = false;

portal_offset = {x: 0, y: 0};
if SUGARY_SPIRE
	sucrose_state = 0;
behind_tile_depth = 1;

function layer_get_parallax(lay)
{
	var _cam_x = camera_get_view_x(view_camera[0]), _cam_y = camera_get_view_y(view_camera[0]);
	var _cam_w = SCREEN_WIDTH, _cam_h = SCREEN_HEIGHT;
	var per = 0;
	
	if _cam_h > 540
		_cam_y += (_cam_h - 540) / 2;
	
	_cam_x += portal_offset.x;
	_cam_y += portal_offset.y;
	
	// --------
	
	var n = layer_get_name(lay);
	switch n
	{
		case "Backgrounds_1": return [_cam_x * 0.25, _cam_y * 0.25]; break;
		case "Backgrounds_2": return [_cam_x * 0.2, _cam_y * 0.2]; break;
		case "Backgrounds_3": return [_cam_x * 0.15, _cam_y * 0.15]; break;
		
		case "Backgrounds_Ground1": return [_cam_x * 0.2, 0]; break;
		case "Backgrounds_Ground2": return [_cam_x * 0.18, 0]; break;
		case "Backgrounds_Ground3": return [_cam_x * 0.16, 0]; break;
		
		case "Backgrounds_H1": return [_cam_x * 0.11, _cam_y]; break;
		
		case "Backgrounds_sky": return [_cam_x * 0.25, _cam_y * 0.25]; break;
		case "Backgrounds_sky2": return [_cam_x, _cam_y]; break;
		
		case "Backgrounds_stillscroll": return [_cam_x - calculate_parallax_still_x(lay, 0.25), _cam_y - calculate_parallax_still_y(lay, 0.25)]; break;
		case "Backgrounds_stillH1": return [_cam_x * 0.3, _cam_y - calculate_parallax_still_y(lay, 0.3)]; break;
		case "Backgrounds_stillH2": return [_cam_x * 0.25, _cam_y - calculate_parallax_still_y(lay, 0.25)]; break;
		case "Backgrounds_stillH3": return [_cam_x * 0.2, _cam_y - calculate_parallax_still_y(lay, 0.2)]; break;
		case "Backgrounds_stillH4": return [_cam_x * 0.15, _cam_y - calculate_parallax_still_y(lay, 0.15)]; break;
		case "Backgrounds_scroll": return [_cam_x * 0.3, _cam_y * 0.3]; break;
		case "Backgrounds_scroll2": return [_cam_x * 0.25, _cam_y * 0.25]; break;
		case "Backgrounds_scroll3": return [_cam_x * 0.2, _cam_y * 0.2]; break;
		case "Backgrounds_scroll4": return [_cam_x * 0.15, _cam_y * 0.15]; break;
		case "Backgrounds_zigzag1": return [_cam_x * 0.35, _cam_y * 0.35 + Wave(-bg_zigzag1_offset, bg_zigzag1_offset, 4, 10)]; break;
		case "Backgrounds_zigzag2": return [_cam_x * 0.35, _cam_y * 0.35 + Wave(-bg_zigzag2_offset, bg_zigzag2_offset, 4, 10)]; break;
		case "Backgrounds_stillZH1": return [_cam_x * 0.35, _cam_y - calculate_parallax_still_y(lay, 0.35) + Wave(-bg_ZH1_offset, bg_ZH1_offset, 4, 10)]; break;
		case "Backgrounds_stillZH2": return [_cam_x * 0.35, _cam_y - calculate_parallax_still_y(lay, 0.35) + Wave(-bg_ZH2_offset, bg_ZH2_offset, 4, 10)]; break;
		
		case "Foreground_1": case "Foreground_A": return [_cam_x * -0.15, _cam_y * -0.15]; break;
		case "Foreground_2": return [_cam_x * -0.25, _cam_y * -0.25]; break;
		case "Foreground_Ground1": return [_cam_x * -0.15, room_height - sprite_get_height(layer_background_get_sprite(layer_background_get_id(lay)))]; break;
		
		case "Backgrounds_still1": case "Backgrounds_far": per = 0.3; break;
		case "Backgrounds_still2": case "Backgrounds_far1": per = 0.25; break;
		case "Backgrounds_room": per = 1; break;
		
		// sugary
		case "Backgrounds_cloud1" : per = 0.5; break;
		case "Backgrounds_cloud2" : per = 0.25; break;
		case "Backgrounds_far2": per = 0.15; break;
		case "Backgrounds_far3": per = 0.05; break;
		case "Backgrounds_sky3": per = 0.95; break;
		case "Backgrounds_sky4": per = 0.85; break;
		case "Backgrounds_sky5": per = 0.7; break;
		case "Backgrounds_sky6": per = 0.65; break;
	}
	if per != 0
	{
		var bg_x = calculate_parallax_still_x(lay, per);
		var bg_y = calculate_parallax_still_y(lay, per);
		return [_cam_x - bg_x, _cam_y - bg_y];
	}	
}
