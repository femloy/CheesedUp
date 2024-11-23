#define EPSILON 0.05
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec2 v_vTile_Position;

uniform vec4 u_secret_tile_bounds;
uniform float u_secret_tile_alpha;
uniform float u_alphafix;

// REMIX STUFF
uniform float u_remix_flag;
uniform float u_secret_tile_clip_distance;
uniform vec2 u_secret_tile_clip_position;
uniform float u_secret_tile_fade_size;
uniform float u_secret_tile_fade_intensity;

bool Vec4ContainsVec2(vec4 rect, vec2 pos)
{
	return ((rect.x - 1.0) <= pos.x && (rect.y - 1.0) <= pos.y && (rect.z + 1.0) >= pos.x && (rect.w + 1.0) >= pos.y);
}

void main()
{
	vec4 game_out_color = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	if (Vec4ContainsVec2(u_secret_tile_bounds, v_vTile_Position)) // Is the secret tile in our draw bounds
	{
		if (u_remix_flag > EPSILON)
		{
			float dist = abs(distance(v_vTile_Position, u_secret_tile_clip_position));
			float fade_begin = u_secret_tile_fade_size * u_secret_tile_clip_distance;
			
			// Are WE in the bounds of the secret tiles?
			//if (Vec4ContainsVec2(u_secret_tile_bounds, u_secret_tile_clip_position))
			float fade = 0.0;
			if (dist > fade_begin)
				fade = (dist - fade_begin) / (u_secret_tile_clip_distance - fade_begin);
			
			game_out_color = vec4(game_out_color.rgb, game_out_color.a * fade * u_secret_tile_fade_intensity);
		}
		else
			game_out_color = vec4(game_out_color.rgb, game_out_color.a * u_secret_tile_alpha);
		
		if (u_alphafix > 0.5)
			game_out_color = vec4(game_out_color.rgb * clamp(game_out_color.a, 0.0, 1.0), game_out_color.a);
	}
	
	gl_FragColor = game_out_color; // We are outside of the range, so draw it normally
}
