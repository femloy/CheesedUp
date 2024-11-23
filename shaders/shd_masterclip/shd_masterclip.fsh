varying vec2 v_vPosition;
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

/// Mask Clip////////////////////
uniform float u_domaskclip;
uniform sampler2D u_clip_sprite_texture;
uniform vec4 u_clip_sprite_uvs;
uniform vec2 u_clip_sprite_size;
uniform vec2 u_clip_sprite_texelsize;
uniform vec2 u_clip_sprite_worldposition;
uniform vec4 u_clip_sprite_trimmed;
uniform float u_mask_alphafix;
uniform float u_mask_inverse;
//////////////////////////////////

/// Circle Clip //////////////////
uniform float u_docircleclip;
uniform vec2 u_origin;
uniform float u_radius;
uniform float u_circle_alphafix;
uniform float u_circle_inverse;
//////////////////////////////////

/// Rect Clip ////////////////////
uniform float u_dorectclip;
uniform vec4 u_clip_bounds;
uniform float u_rect_alphafix;
uniform float u_rect_inverse;
//////////////////////////////////

/// Triangle Clip ////////////////////
uniform float u_dotriangleclip;
uniform vec2 u_trianglepoints[3];

//////////////////////////////////////

#region Mask Clip

bool mask_clip_bound_check()
{
	vec2 trimmed_world_size = vec2(u_clip_sprite_size - u_clip_sprite_trimmed.xy);
	
	vec2 trimmed_pos = u_clip_sprite_worldposition + u_clip_sprite_trimmed.xy;
	vec2 trimmed_size = u_clip_sprite_size * u_clip_sprite_trimmed.zw;
	bool inside_bounds = ((v_vPosition.x >= (trimmed_pos.x) && v_vPosition.x <= (trimmed_pos.x + trimmed_size.x)) && (v_vPosition.y >= (trimmed_pos.y) && v_vPosition.y <= (trimmed_pos.y + trimmed_size.y)));
	
	if (u_mask_inverse > 0.5)
		return !inside_bounds;
	else
		return inside_bounds;
}

vec4 mask_clip(vec4 color)
{
	vec4 game_out_color = color;
	
	// are we inside the clip region?
	//if	(
	//	(v_vPosition.x >= (trimmed_pos.x) && v_vPosition.x <= (trimmed_pos.x + trimmed_size.x)) && 
	//	(v_vPosition.y >= (trimmed_pos.y) && v_vPosition.y <= (trimmed_pos.y + trimmed_size.y))
	//	)
	if (mask_clip_bound_check())
	{
		vec2 position_in_clip = ((v_vPosition - u_clip_sprite_worldposition - u_clip_sprite_trimmed.xy) * u_clip_sprite_texelsize) + u_clip_sprite_uvs.xy;
		
		vec4 clip_color = texture2D(u_clip_sprite_texture, position_in_clip);
		
		game_out_color *= clip_color;
	}
	else
		game_out_color = vec4(0.0, 0.0, 0.0, 0.0); // Outside so it will be invisible
		
	if (u_mask_alphafix > 0.5)
		game_out_color = vec4(game_out_color.rgb * game_out_color.a, game_out_color.a);
		
	return game_out_color;
}

#endregion
#region Circle Clip

vec4 circle_clip(vec4 color)
{
	vec4 game_out_color = color;
	
	float origin_distance = distance(v_vPosition, u_origin);
	
	if (u_circle_inverse < 0.5)
		game_out_color.a = origin_distance < u_radius ? game_out_color.a : 0.0;
	else
		game_out_color.a = origin_distance > u_radius ? game_out_color.a : 0.0;
		
	if (u_circle_alphafix > 0.5)
		game_out_color = vec4(game_out_color.rgb * game_out_color.a, game_out_color.a);
	return game_out_color;
}

#endregion
#region Rectangle Clip

bool rx_Vec4ContainsVec2(vec4 rect, vec2 pos)
{
	return ((rect.x - 1.0) <= pos.x && (rect.y - 1.0) <= pos.y && (rect.z + 1.0) >= pos.x && (rect.w + 1.0) >= pos.y);
}

vec4 rect_clip(vec4 color)
{
	vec4 game_out_color = color;
	
	vec4 clip_bounds = u_clip_bounds;
	
	if (clip_bounds.z < 0.0)
	{
		clip_bounds.x = clip_bounds.x + clip_bounds.z;
		clip_bounds.z = -clip_bounds.z;
	}
	
	if (clip_bounds.w < 0.0)
	{
		clip_bounds.y = clip_bounds.y + clip_bounds.w;
		clip_bounds.w = -clip_bounds.w;
	}
	
	if (u_rect_inverse > 0.5)
		game_out_color.a = (!rx_Vec4ContainsVec2(clip_bounds, v_vPosition)) ? game_out_color.a : 0.0;
	else
		game_out_color.a = rx_Vec4ContainsVec2(clip_bounds, v_vPosition) ? game_out_color.a : 0.0;
		
	if (u_rect_alphafix > 0.5)
		game_out_color = vec4(game_out_color.rgb * game_out_color.a, game_out_color.a);
		
	return game_out_color;
}

#endregion
#region Triangle Clip

// https://www.geeksforgeeks.org/check-whether-a-given-point-lies-inside-a-triangle-or-not/
float triangle_get_area(vec2 p1, vec2 p2, vec2 p3)
{
	return abs((
		p1.x * (p2.y - p3.y) + 
		p2.x * (p3.y - p1.y) + 
		p3.x * (p1.y - p2.y)
	) / 2.0);
}

bool check_triangle_bounds()
{
	// This is probably slow but idc
	float A = triangle_get_area(u_trianglepoints[0], u_trianglepoints[1], u_trianglepoints[2]);
	
	float A1 = triangle_get_area(v_vPosition, u_trianglepoints[1], u_trianglepoints[2]);
	
	float A2 = triangle_get_area(u_trianglepoints[0], v_vPosition, u_trianglepoints[2]);
	
	float A3 = triangle_get_area(u_trianglepoints[0], u_trianglepoints[1], v_vPosition);
	
	return (A == A1 + A2 + A3);
	
}

#endregion

void main()
{
	vec4 game_out_color = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	if (u_docircleclip > 0.5)
		game_out_color = circle_clip(game_out_color);
		
	if (u_domaskclip > 0.5)
		game_out_color = mask_clip(game_out_color);
	
	if (u_dorectclip > 0.5)
		game_out_color = rect_clip(game_out_color);
	
	if (gm_PS_FogEnabled) // this doesn't fucking work
		game_out_color = mix(game_out_color, gm_FogColour, 1.0);
	
    gl_FragColor = game_out_color;
}
