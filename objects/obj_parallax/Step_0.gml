/// @description parallax
live_auto_call;
ensure_order;

array_foreach(room_get_bg_layers(), function(l, i)
{
	var panic = PANIC && global.panicbg && global.leveltosave != "secretworld" && (!SUGARY_SPIRE or global.leveltosave != "sucrose");
	
	// Backgrounds_stillH1-4 mistakingly use the layer X as the yoffset
	var still_bgs = ["Backgrounds_stillH1", "Backgrounds_stillH2", "Backgrounds_stillH3", "Backgrounds_stillH4"];
	var base_game_bug = !(SUGARY_SPIRE && SUGARY) && array_contains(still_bgs, layer_get_name(l.layer_id), 0, infinity);
	
	// do it
	l.x += layer_get_hspeed(l.layer_id);
	l.y += layer_get_vspeed(l.layer_id);
	
	if variable_struct_exists(l, "par_x")
		var parallax = [CAMX * l.par_x, CAMY * l.par_y];
	else
	{
		var parallax = layer_get_parallax(l.layer_id);
		if parallax == undefined
			parallax = [0, 0];
	}
	
	if panic && layer_get_depth(l.layer_id) > 0 && l.bg_sprite != bg_etbbrick
	{
		parallax[0] -= CAMX;
		parallax[1] -= CAMY;
	}
	
	layer_x(l.layer_id, floor(l.x + parallax[0]));
	layer_y(l.layer_id, floor((base_game_bug ? l.x : l.y) + parallax[1]));
}, 0, infinity);

// asset layers
for(var i = 0; i < array_length(asset_layers); i++)
{
	if !layer_exists(asset_layers[i])
		continue;
	
	layer_x(asset_layers[i], CAMX * asset_parallax[i][0]);
	layer_y(asset_layers[i], CAMY * asset_parallax[i][1]);
}
