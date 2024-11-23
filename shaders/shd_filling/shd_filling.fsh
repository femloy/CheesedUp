//
// Im the shader god now -Loy
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float fill;
uniform float uvs[4];

void main()
{
	vec4 color = texture2D(gm_BaseTexture, v_vTexcoord);
	float midpoint = mix(uvs[3], uvs[1], fill);
	if (v_vTexcoord.y < midpoint)
	{
		if (distance(color, vec4(0, 0, 0, 1)) <= 0.025)
			color.rgb = vec3(1, 1, 1);
		else
			discard;
	}
	gl_FragColor = v_vColour * color;
}
