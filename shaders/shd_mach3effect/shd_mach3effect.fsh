varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 color1;
uniform vec3 color2;
uniform int no_outline;

void main()
{
    vec4 color = vec4(texture2D(gm_BaseTexture, v_vTexcoord));
	if (distance(color.rgb, vec3(0, 0, 0)) <= 0.025)
	{
		if (no_outline == 1)
			discard;
		color.rgb = color2;
	}
	else
		color.rgb = color1;
	gl_FragColor = v_vColour * color;
}
