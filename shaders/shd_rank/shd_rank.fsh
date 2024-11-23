//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

/*
vec3 black = vec3(80/255, 0, 0);
vec3 brown = vec3(216/255, 144/255, 96/255);
*/
uniform vec3 black;
uniform vec3 brown;

void main()
{
	vec4 source = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
	vec3 color = source.rgb;
	
	if (distance(source, vec4(0, 0, 0, 1)) <= 0.004)
		color = black;
	else
		color = brown;
	
	gl_FragColor.rgb = color;
	gl_FragColor.a = source.a;
	
	if (distance(vec4(0, 0, 0, source.a), vec4(0, 0, 0, 0)) <= 0.004)
		gl_FragColor = source;
}
