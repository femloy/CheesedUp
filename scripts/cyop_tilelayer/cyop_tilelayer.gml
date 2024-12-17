if !YYC
	message = "don't steal my code shithead";

#macro CYOP_CHUNK_WIDTH 960
#macro CYOP_CHUNK_HEIGHT 540

function cyop_tilelayer(_x, _y, _tilelayer, _depth, _secret) constructor
{
	if live_call(_x, _y, _tilelayer, _depth, _secret) return live_result;
	
	/// @desc	Prepare texture sorting and tile data
	Prepare = function(tilelayer)
	{
		var f = function(entry_name, i)
		{
			var this = tilelayer[$ entry_name]; // {tileset: str, coord: [x, y]}
			if entry_name == "ID" or !is_struct(this)
				exit;
			if this.tileset == noone
				exit;
			
			// parse position
			var pos = string_split(entry_name, "_", true, 1);
			this.x = real(pos[0]) + x;
			this.y = real(pos[1]) + y;
				
			// SAGE 2023 offgrid tiles issue
			if frac(this.x / 32) != 0 or frac(this.y / 32) != 0
			{
				this.tileset = noone;
				exit;
			}
				
			// figure out sprite
			if this[$ "size"] == undefined
				this.size = 32;
			if is_string(this.tileset)
			{
				var sprite = global.cyop_base_sprites[? this.tileset];
				if sprite == undefined
				{
					var custom = global.cyop_tiles[? this.tileset];
					if custom != undefined
					{
						sprite = custom[0];
						this.size = custom[1];
					}
					else // SECRETS OF THE COMMUNITY... I FUCKING HATE YOU...
						sprite = global.cyop_sprites[? this.tileset];
				}
				if sprite == undefined
					exit;
				this.tileset = sprite;
			}
			if !sprite_exists(this.tileset)
			{
				this.tileset = noone;
				exit;
			}
				
			// tile coords outside of actual tileset
			if this.coord[0] * this.size >= sprite_get_width(this.tileset)
			or this.coord[1] * this.size >= sprite_get_height(this.tileset)
			{
				this.tileset = noone;
				exit;
			}
			
			if secrettile
				array_push(tiles, this);
			with tiles_bounds
			{
				if x1 > this.x x1 = this.x;
				if y1 > this.y y1 = this.y;
				if x2 < this.x + 32 x2 = this.x + 32;
				if y2 < this.y + 32 y2 = this.y + 32;
			}
			
			var texture = sprite_get_texture(this.tileset, 0);
			var chunk_x = floor(this.x / CYOP_CHUNK_WIDTH), chunk_y = floor(this.y / CYOP_CHUNK_HEIGHT);
			var chunk_name = concat(chunk_x, "_", chunk_y);
			
			// Get chunk the texture is in
			var chunk = chunks[? chunk_name];
			if chunk == undefined
			{
				chunk = new Chunk(chunk_x * CYOP_CHUNK_WIDTH, chunk_y * CYOP_CHUNK_HEIGHT);
				ds_map_set(chunks, chunk_name, chunk);
				array_push(chunk_array, chunk_name);
			}
			
			// Sort by texture
			var tilemap = chunk.tilemaps[? texture];
			if tilemap == undefined
			{
				tilemap = new Tilemap(texture);
				ds_map_set(chunk.tilemaps, texture, tilemap);
				array_push(chunk.tilemap_array, texture);
			}
			
			// Add to tilemap
			array_push(tilemap.tiles, this);
		};
		
		var tiles = variable_struct_get_names(tilelayer);
		array_foreach(tiles, f, 0, infinity);
		
		trace(tiles_bounds);
	}
	
	Build_Chunk = function(chunk)
	{
		// Each tilemap (usually just one)
		for(var i = 0, n = array_length(chunk.tilemap_array); i < n; ++i)
		{
			var tilemap = chunk.tilemaps[? chunk.tilemap_array[i]];
			
			// Which buffer
			if tilemap.vertex_buffer != noone
				vertex_delete_buffer(tilemap.vertex_buffer);
			tilemap.vertex_buffer = vertex_create_buffer();
			
			// Setup
			var texture = tilemap.texture;
			var buffer = tilemap.vertex_buffer;
			
			// Each tile in the tilemap
			vertex_begin(buffer, vertex_format);
			
			var f = method({tex_w: texture_get_texel_width(texture), tex_h: texture_get_texel_height(texture), buffer: buffer, depth: depth, secrettile: secrettile}, function(tile, i)
			{
				if !secrettile && ds_list_find_index(global.cyop_broken_tiles, $"{tile.x}_{tile.y}") > -1
					exit;
				
	            var uvs = sprite_get_uvs(tile.tileset, 0);
	            var uv_left = uvs[0];
	            var uv_top = uvs[1];
	            var uv_right = uvs[2];
	            var uv_bottom = uvs[3];
                
	            var tile_trim_x = uvs[4];
	            var tile_trim_y = uvs[5];
				
	            var tile_tex_size_x = tile.size * tex_w;
	            var tile_tex_size_y = tile.size * tex_h;
                
	            var tile_tex_pos_x = ((tile.coord[0] - (tile_trim_x / tile.size)) * tile_tex_size_x) + uv_left;
	            var tile_tex_pos_y = ((tile.coord[1] - (tile_trim_y / tile.size)) * tile_tex_size_y) + uv_top;
				
				var tile_x = tile.x, tile_y = tile.y;
				var tile_width = 32, tile_height = 32;
				
				// tile outside of uv, fixes couch black bars
				if tile_tex_pos_x < uv_left
				{
					// UNTESTED.
					var difference = uv_left - tile_tex_pos_x;
					tile_tex_pos_x += difference;
					tile_x += difference / tex_w;
				}
				if tile_tex_pos_y < uv_top
				{
					// UNTESTED.
					var difference = uv_top - tile_tex_pos_y;
					tile_tex_pos_y += difference;
					tile_y += difference / tex_h;
				}
				if tile_tex_pos_x + tile_tex_size_x > uv_right
				{
					var difference = (tile_tex_pos_x + tile_tex_size_x) - uv_right;
					tile_tex_size_x -= difference;
					tile_width -= difference / tex_w;
				}
				if tile_tex_pos_y + tile_tex_size_y > uv_bottom
				{
					// UNTESTED
					var difference = (tile_tex_pos_y + tile_tex_size_y) - uv_bottom;
					tile_tex_size_y -= difference;
					tile_height -= difference / tex_h;
				}
				
				// flip tile
				tile_width *= tile[$ "flipX"] ?? 1;
				if tile_width < 0
					tile_x -= tile_width;
				tile_height *= tile[$ "flipY"] ?? 1;
				if tile_height < 0
					tile_y -= tile_height;
				
				// add
	            vertex_build_quad3D(buffer, 
	                tile_x, tile_y, 0, tile_width, tile_height, // Pos and Size
	                c_white, 1, // Color and Opacity
	                tile_tex_pos_x, tile_tex_pos_y, tile_tex_size_x, tile_tex_size_y
				);
			});
			array_foreach(tilemap.tiles, f, 0, infinity);
			
			vertex_end(buffer);
			//vertex_freeze(buffer); // optimization
		}
	}
	
	Draw = function()
	{
		var f = function(key, i)
		{
			var chunk = chunks[? key];
			if !rectangle_in_rectangle(chunk.x - 32, chunk.y - 32, chunk.x + CYOP_CHUNK_WIDTH + 32, chunk.y + CYOP_CHUNK_HEIGHT + 32, CAMX, CAMY, CAMX + CAMW, CAMY + CAMH)
				exit;
			
			if chunk.dirty
			{
				if global.showcollisions
					trace("Building chunk at x", chunk.x, " y", chunk.y);
				Build_Chunk(chunk);
				chunk.dirty = false;
			}
			chunk.Draw();
		}
		array_foreach(chunk_array, f, 0, infinity);
	}
	
	Dispose = function()
	{
		var f = function(key, i) {
			chunks[? key].Dispose();
		}
		array_foreach(chunk_array, f, 0, infinity);
		
		ds_map_destroy(chunks);
		vertex_format_delete(vertex_format);
	}
	
	// Types
	Tilemap = function(_texture) constructor
	{
		texture			=	_texture;
		vertex_buffer	=	noone;
		tiles			=	[];
		
		Dispose = function()
		{
			if vertex_buffer != noone
				vertex_delete_buffer(vertex_buffer);
		}
	}
	Chunk = function(_x, _y) constructor
	{
		tilemaps		=	ds_map_create();
		tilemap_array	=	[];
		dirty			=	true;
		x				=	_x;
		y				=	_y;
		
		Draw = function()
		{
			var f = function(tilemap, i) {
				vertex_submit(tilemaps[? tilemap].vertex_buffer, pr_trianglelist, tilemaps[? tilemap].texture);
			}
			array_foreach(tilemap_array, f, 0, infinity);
			
			if global.showcollisions
			{
				draw_set_colour(c_red);
				draw_rectangle(x, y, x + CYOP_CHUNK_WIDTH, y + CYOP_CHUNK_HEIGHT, true);
			}
		}
		Dispose = function()
		{
			var f = function(key, i) {
				tilemaps[? key].Dispose();
			}
			array_foreach(tilemap_array, f, 0, infinity);
			
			ds_map_destroy(tilemaps);
		}
	}
	
	// Setup
	chunks			=	ds_map_create();
	chunk_array		=	[];
	vertex_format	=	cyop_tilemap_create_vertex_format();
	
	// Secret tile info
	tiles			=	[];
	tiles_bounds	=	{
		x1: infinity,
		y1: infinity,
		x2: -infinity,
		y2: -infinity
	};
	
	// Properties
	x				=	_x;					// X room offset
	y				=	_y;					// Y room offset
	tilelayer		=	_tilelayer;
	depth			=	_depth;
	secrettile		=	_secret;
	
	// adds to sorted_map, vertx_buffers
	Prepare(tilelayer);
}
