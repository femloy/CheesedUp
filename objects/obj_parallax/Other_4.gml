live_auto_call;

// boss backgrounds ignore new system
if instance_exists(obj_cyop_loader)
	exit;
behind_tile_depth = 1;

// handle every kind of layer
var layers = layer_get_all();
for (var i = 0; i < array_length(layers); i++)
{
	var lay = layers[i];
	if !layer_exists(lay)
		continue;
	
	var layname = layer_get_name(lay);
	
	#region LAYER DEPTHS
	
	// Tiles
	if string_starts_with(layname, "Tiles_BG")
	{
		var no = string_digits(layname);
		if no != ""
			no = real(no) - 1;
		else
			no = 0;
		
		layer_depth(lay, 200 - no);
	}
	else if string_starts_with(layname, "Tiles_Foreground")
	{
		var no = string_digits(layname);
		if no != ""
		{
			no = real(no);
			layer_depth(lay, 100 - no);
		}
	}
	else switch layname
	{
		case "Tiles_1": layer_depth(lay, 100); break;
		case "Tiles_2": layer_depth(lay, 98); break;
		case "Tiles_3": layer_depth(lay, 97); break;
		case "Tiles_4": layer_depth(lay, 96); break;
	}
	if layer_exists(layname + "_Egg")
		layer_depth(layname + "_Egg", layer_get_depth(lay));
	
	// Assets
	if string_starts_with(layname, "Assets_BG")
	{
		var no = string_digits(layname);
		if no != ""
			no = real(no) - 1;
		else
			no = 0;
		
		layer_depth(lay, 201 + no);
	}
	if string_starts_with(layname, "Assets_FG")
	{
		var no = string_digits(layname);
		if no != ""
			no = real(no) - 1;
		else
			no = 0;
		
		layer_depth(lay, -350 - no);
	}
	
	#endregion
	#region ASSET PARALLAX
	
	var assetlay = array_get_index(asset_layers, layname, 0, infinity);
	if assetlay != -1
	{
		var p = asset_parallax[assetlay];
		var q = layer_get_all_elements(lay);
		
		for (var j = 0; j < array_length(q); j++)
		{
			var _asset = q[j];
			
			var _x = layer_sprite_get_x(_asset);
			var _y = layer_sprite_get_y(_asset);
			var spr = layer_sprite_get_sprite(_asset);
			
			if p[0] != 0
				layer_sprite_x(_asset, _x - _x * p[0] + (SCREEN_WIDTH / 4) * p[0]);
			if p[1] != 0 && spr != spr_industrialpipe && spr != bg_farmdirtwall
				layer_sprite_y(_asset, _y - _y * p[1] + (SCREEN_HEIGHT / 4) * p[1]);
		}
	}
	
	#endregion
	#region HIDE TILES
	
	var tilemap = layer_tilemap_get_id(lay);
	if tilemap != -1
	{
		if global.hidetiles
			layer_set_visible(lay, false);
		else if REMIX
		{
			// transparent ice in freezer
			var newtileset = asset_get_index(tileset_get_name(tilemap_get_tileset(tilemap)) + "_NEW");
			if newtileset != -1
				tilemap_tileset(tilemap, newtileset);
		}
		
		var dep = layer_get_depth(lay) + 1;
		if behind_tile_depth < dep
			behind_tile_depth = dep;
	}
	
	#endregion
	#region AUTO-FOREGROUND
	
	if layname == "Foreground_A"
	{
		var roombgs = room_get_bg_layers();
		for(var j = 0; j < array_length(roombgs); j++)
		{
			var spr = roombgs[j].bg_sprite;
			if roombgs[j].layer_id == lay && sprite_exists(spr)
			{
				var ht = sprite_get_height(spr);
			
				var yy = ceil((room_height - ht) + (room_height - ht) * 0.15);
				if spr == fg_entrance1
					yy += 24;
				yy = floor(yy / 10) * 10;
				
				roombgs[j].y = yy;
			}
		}
	}
	
	#endregion
	#region SUGARY
	
	if string_starts_with(layname, "Backgrounds_Ground") && SUGARY
	{
		var roombgs = room_get_bg_layers();
		for(var j = 0; j < array_length(roombgs); j++)
		{
			var spr = roombgs[j].bg_sprite;
			if roombgs[j].layer_id == lay && sprite_exists(spr)
			{
				var ht = sprite_get_height(spr);
				var yy = ceil(room_height - ht);
				roombgs[j].y = yy;
			}
		}
	}

	#endregion
}

if (room == sucrose_1 || room == sucrose_2)
{
	var _bg = layer_background_get_id("Backgrounds_still1");
	if global.panic
	{
		layer_background_sprite(_bg, bg_sucrose_skyActive);
		layer_background_index(_bg, 0);
		layer_background_speed(_bg, 0.35);
	}
	else
	{
		switch sucrose_state
		{
			case 0:
				break;
			case 1:
				layer_background_sprite(_bg, bg_sucrose_skyWakingUp);
				layer_background_index(_bg, 0);
				layer_background_speed(_bg, 0.25);
				break;
			default:
				instance_create_unique(0, 0, obj_hungrypillarflash);
				activate_panic(true);
				layer_background_sprite(_bg, bg_sucrose_skyActive);
				layer_background_index(_bg, 0);
				layer_background_speed(_bg, 0.35);
				break;
		}
	}
}
	
// some more depths
if layer_exists("Foreground_1")
	layer_depth("Foreground_1", -400);
if layer_exists("Foreground_Ground1")
	layer_depth("Foreground_Ground1", -401);

// waving backgrounds
bg_zigzag1_offset = layer_get_vspeed("Backgrounds_zigzag1");
bg_zigzag2_offset = layer_get_vspeed("Backgrounds_zigzag2");
bg_ZH1_offset = layer_get_vspeed("Backgrounds_stillZH1");
bg_ZH2_offset = layer_get_vspeed("Backgrounds_stillZH2");

layer_vspeed("Backgrounds_zigzag1", 0);
layer_vspeed("Backgrounds_zigzag2", 0);
layer_vspeed("Backgrounds_stillZH1", 0);
layer_vspeed("Backgrounds_stillZH2", 0);

portal_offset = {x: 0, y: 0};

// turn on some layers on panic
if global.panic
{
	var lays_chips = [];
	var lays_false = [];
	
	if room == sewer_8 or room == sewer_2 or room == sewer_1 or room == sewer_11 or room == sewer_10 or room == sewer_9
	{
		if room != sewer_1
			lays_chips = ["Backgrounds_scroll"];
		lays_false = ["Backgrounds_scroll2", "Backgrounds_zigzag1"];
	}
	//if room == street_1 or room == street_3 or room == street_2
	//	lays_chips = ["Foreground_2"];

	for(var i = 0, n = array_length(lays_chips); i < n; i++)
		layer_set_visible(layer_get_id(lays_chips[i]), true);
	for(var i = 0, n = array_length(lays_false); i < n; i++)
		layer_set_visible(layer_get_id(lays_false[i]), false);
}

// generic background handler
if (!room_is_secret(room) or instance_exists(obj_wartimer) or global.leveltosave == "sucrose")
&& !instance_exists(obj_cyop_loader) && room != boss_noise
	scr_panicbg_init();

// pizzelle's secrets
if SUGARY_SPIRE
{
	if global.sugaryoverride && !instance_exists(obj_cyop_loader)
	&& (room_is_secret(room) or room == secret_entrance)
	{
		var target_tiles = -1;
		if check_sugarychar()
		{
			if !SUGARY
				target_tiles = tileset_secret_to_ss;
		}
		else if SUGARY
			target_tiles = tileset_secret_ss_to_pt;
	
		if target_tiles != -1
		{
			var layers = layer_get_all();
			for (var i = 0; i < array_length(layers); i++)
			{
				var lay = layers[i];
				if !layer_exists(lay)
					continue;
			
				// tiles
				var tilemap = layer_tilemap_get_id(lay), tileset = tilemap_get_tileset(tilemap);
				if (tileset == tileset_secret_ss && target_tiles == tileset_secret_to_ss)
					break;
			
				if tilemap > -1 && (tileset == tileset_secret or tileset == tileset_secret_ss)
				{
					tilemap_tileset(tilemap, target_tiles);
					if target_tiles == tileset_secret_to_ss
					{
						for(var xx = 0; xx < tilemap_get_width(tilemap); xx++)
						{
							for(var yy = 0; yy < tilemap_get_height(tilemap); yy++)
							{
								var tile = tilemap_get(tilemap, xx, yy) & tile_index_mask;
								if tile == 0
									continue;
					
								if tile == 36 // RIGHT SLOPE /|
								{
									if (tilemap_get(tilemap, xx + 1, yy) & tile_index_mask == 16
									or tilemap_get(tilemap, xx, yy + 1) & tile_index_mask == 22)
									&& tilemap_get(tilemap, xx + 1, yy - 1) & tile_index_mask != 36
										tilemap_set(tilemap, 94, xx + 1, yy);
									if tilemap_get(tilemap, xx, yy + 1) & tile_index_mask == 16
									or tilemap_get(tilemap, xx, yy + 1) & tile_index_mask == 22
										tilemap_set(tilemap, 37, xx, yy + 1);
								}
								if tile == 46 // LEFT SLOPE |\
								{
									if tilemap_get(tilemap, xx - 1, yy) & tile_index_mask == 16
										tilemap_set(tilemap, 47, xx - 1, yy);
									if tilemap_get(tilemap, xx, yy + 1) & tile_index_mask == 16
										tilemap_set(tilemap, 47, xx, yy + 1);
								}
					
								if tile >= 12 && tile <= 14 // FLOOR
									tilemap_set(tilemap, 12 + (xx % 3), xx, yy);
								if tile >= 52 && tile <= 54 // CEILING
									tilemap_set(tilemap, 52 + (xx % 3), xx, yy);
					
								if tile == 96 // LONG RIGHT SLOPE //|
									tilemap_set(tilemap, 99, xx, yy + 1);
								if tile == 97 // LONG RIGHT SLOPE //|
									tilemap_set(tilemap, 89, xx, yy + 1);
								if tile == 77 // LONG LEFT SLOPE |\\
									tilemap_set(tilemap, 69, xx, yy + 1);
								if tile == 78 // LONG LEFT SLOPE |\\
									tilemap_set(tilemap, 79, xx, yy + 1);
					
								if tile == 88 // beach_secret1
								{
									if tilemap_get(tilemap, xx - 1, yy) & tile_index_mask > 0
										tilemap_set(tilemap, 98, xx, yy + 1);
								}
							}
						}
					}
					continue;
				}
		
				// background
				var background = layer_background_get_id(lay), sprite = layer_background_get_sprite(background);
				if background != -1 && (sprite == bg_secret or sprite == bg_secret_ss)
				{
					if target_tiles == tileset_secret_to_ss
						layer_background_sprite(background, bg_secret_ss);
					if target_tiles == tileset_secret_ss_to_pt
						layer_background_sprite(background, bg_secret);
				}
			}
		}
	}
}

// coded in backgrounds
if !instance_exists(obj_ghostcollectibles)
{
    if global.leveltosave == "entryway"
    {
        var layerfx = layer_get_fx("Effect_1");
        if layerfx != -1
        {
            if global.panic or room == entryway_11 // nighttime color
                fx_set_parameter(layerfx, "g_TintCol", [216 / 255, 183 / 255, 228 / 255, 1]);
            else // normal sunset color
                fx_set_parameter(layerfx, "g_TintCol", [255 / 255, 221 / 255, 204 / 255, 1]);
        }
    }
	
	if global.leveltosave == "steamy" && global.panic
		layer_destroy("Effect_1");
}

// sugary overrides fix
if room != tower_1
{
	with obj_secrettile
		event_user(0);
}
