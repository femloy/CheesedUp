varying vec2 v_vPosition;
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D u_texture_page;

uniform vec4 u_sprite_uvs;
uniform vec2 u_sprite_trimmed;
uniform vec2 u_sprite_saved;

uniform float u_layer_info[64];
uniform float u_layer_offsets[8];

#region Layer Functions
void layer_get_uvs(int layer, out float array[4])
{
	if (layer == 0 || layer >= 4)
	{
		for (int i = 0; i < 4; i++)
			array[i] = 0.0;
		return;
	}
	
	int layer_offset = (layer * 8);
	
	for (int i = 0; i < 4; i++)
		array[i] = u_layer_info[layer_offset + i];
}

void layer_get_trimmed(int layer, out vec2 trimmed)
{
	if (layer == 0 || layer >= 4)
	{
		trimmed = vec2(0.0);
		return;
	}
	
	int layer_offset = (layer * 8);
	
	trimmed = vec2(layer_offset + 4, layer_offset + 5);
}

void layer_get_saved_percentage(int layer, out vec2 savedperc)
{
	if (layer == 0 || layer >= 4)
	{
		savedperc = vec2(0.0);
		return;
	}
	
	int layer_offset = (layer * 8);
	
	savedperc = vec2(layer_offset + 6, layer_offset + 7);
}
#endregion

void main()
{
	vec4 game_out_color = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	
	
	float layer_uvs[4];
	vec2 layer_trimmed;
	vec2 layer_saved_perc;
	
	layer_get_uvs(0, layer_uvs);
	layer_get_trimmed(0, layer_trimmed);
	layer_get_saved_percentage(0, layer_saved_perc);
	
	
	
	
    gl_FragColor = game_out_color;
}
