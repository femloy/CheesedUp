varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D palette_texture;
uniform vec2 texel_size;
uniform vec4 palette_UVs;
uniform float palette_index;

// patterns
#define PATTERN_COLORS 8

uniform sampler2D pattern_texture;
uniform int pattern_enabled; // there's no gml function to set a bool
uniform int pattern_solid_color;
uniform float color_array[PATTERN_COLORS]; // indices of the colors that the pattern should replace
uniform vec4 pattern_tex_data; // (x, y) = trimmed l/t offset | (z, w) = texture size
uniform vec4 pattern_UVs;
uniform vec4 sprite_UVs;
uniform vec4 sprite_tex_data; // (x, y) = trimmed l/t offset | (z, w) = texture size
uniform vec2 sprite_scale; // (xscale, yscale)
uniform vec2 pattern_offset;
uniform float shade_multiplier;
uniform int noise_type;

// custom palettes
uniform int custom_enable;
uniform float custom_palette[64];

#define TOLERANCE 0.004

void main()
{
	vec4 source = texture2D( gm_BaseTexture, v_vTexcoord );
	DoAlphaTest( source ); // discards pixel if alpha is 0
    
	for(int i = 0; i < int((palette_UVs.w - palette_UVs.y) / texel_size.y); i++) // iterate through each color
	{
		int row_index = i; // current row of replacing colors
		
		// automated super noise
		if (noise_type == 1)
		{
			if (i == 1 || i == 10)
				row_index = 7;
			else if (i == 2 || i == 11)
				row_index = 8;
			
			else if (i == 7)
				row_index = 1;
			else if (i == 8)
				row_index = 2;
		}
		
		// special noise gloves
		if (noise_type == 2 && i == 12)
			row_index = 7;
		
		float color_index = palette_UVs.y + (float(row_index) * texel_size.y);
		float raw_color_index = palette_UVs.y + (float(i) * texel_size.y);
		
		vec4 palette_color = texture2D(palette_texture, vec2(palette_UVs.x, raw_color_index));
		if (distance(source, palette_color) <= TOLERANCE)
		{
			if (noise_type == 1)
			{
				// super noise's clothes
				if (i == 1 || i == 10)
				{
					source.rgb = vec3(1, 1, 1); // full white
					continue;
				}
				if (i == 2 || i == 11)
				{
					source.rgb = vec3(144.0 / 255.0, 160.0 / 255.0, 176.0 / 255.0); // light gray
					continue;
				}
				if (i == 9)
				{
					source.rgb = vec3(81.0 / 255.0, 94.0 / 255.0, 106.0 / 255.0); // dark gray
					continue;
				}
			}
			
			if (custom_enable == 1)
			{
				// custom_palette: [r,g,b,a,    r,g,...]
				int index = i * 4;
				source = vec4(custom_palette[index], custom_palette[index + 1], custom_palette[index + 2], custom_palette[index + 3]);
			}
			else
			{
				float texel_palette_offset = texel_size.x * palette_index;
				float palette_V = palette_UVs.x + texel_palette_offset;
				vec4 prev_source = source;
				source = texture2D(palette_texture, vec2(palette_V, color_index));
			}
			
			if (pattern_enabled == 1) 
			{
				for(int j = 0; j < PATTERN_COLORS; j += 1) // check for normal or shading.
				{
					if (color_array[j] == -1.0)
						break;
					if (color_array[j] == float(row_index)) 
					{
						// convert to (0,0) and convert to integer size in texture page
						vec2 pos = (v_vTexcoord - sprite_UVs.xy) * sprite_tex_data.zw;
						
						// get the edges of the palette sprite and convert to integer size in texture page
						vec2 edge = (pattern_UVs.zw - pattern_UVs.xy) * pattern_tex_data.zw;
						
						pos += pattern_offset;
						
						// wrap around the edges
						pos = mod(pos + sprite_tex_data.xy, edge + pattern_tex_data.xy);
						
						// convert the position back to texel size
						pos = pos / pattern_tex_data.zw;
		
						// set the tex coordinate
						vec2 texcoord = vec2(0, 0);
		
						// check sprite xscale
						if (sprite_scale.x >= 0.0)
							texcoord.x = pattern_UVs.x + pos.x;
						else
							texcoord.x = pattern_UVs.z - pos.x;
			
						// check sprite yscale
						if (sprite_scale.y >= 0.0)
							texcoord.y = pattern_UVs.y + pos.y;
						else
							texcoord.y = pattern_UVs.w - pos.y;
						
						if (pattern_solid_color == 1)
							texcoord = vec2(pattern_UVs.x, pattern_UVs.y);
						
						// mix the pattern and the palette colors
						vec4 pat = texture2D(pattern_texture, texcoord);
						
						// Darken
						vec4 shadeColor = vec4(0.0, 0.0, 0.0, 0.40625);
						if (mod(float(j), 2.0) == 0.0) // Every other index is shaded
							shadeColor.a = 0.0;
						
						vec3 m = mix(pat.rgb, shadeColor.rgb, shadeColor.a * shade_multiplier);
						source = vec4(m.rgb, pat.a);
						break;
					}
				}
			}
			break;
		}
	}

	gl_FragColor = source * v_vColour;
}
