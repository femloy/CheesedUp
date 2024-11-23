varying vec2 v_vTexcoord;
varying vec4 v_vColour;

// 0 - Protanopia
// 1 - Deuteranopia
// 2 - Tritanopia
uniform float v_vMode;
uniform float v_vIntensity;
uniform float v_vGreyscaleFade;
void main()
{
	vec4 gameOutput = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	
	float L = (17.8824 * gameOutput.r) + (43.5161 * gameOutput.g) + (4.11935 * gameOutput.b);
	float M = (3.45565 * gameOutput.r) + (27.1554 * gameOutput.g) + (3.86714 * gameOutput.b);
	float S = (0.0299566 * gameOutput.r) + (0.184309 * gameOutput.g) + (1.46709 * gameOutput.b);
	
	if (v_vMode == 0.0) // Protanopia
	{
		L = 0.0 * L + 2.02344 * M + -2.52581 * S;
		M = 0.0 * L + 1.0 * M + 0.0 * S;
		S = 0.0 * L + 0.0 * M + 1.0 * S;
	}
	else if (v_vMode == 1.0) //Deuteranopia
	{
		L = 1.0 * L + 0.0 * M + 0.0 * S;
    	M = 0.494207 * L + 0.0 * M + 1.24827 * S;
    	S = 0.0 * L + 0.0 * M + 1.0 * S;
	}
	else if (v_vMode >= 2.0) //Tritanopia
	{
		L = 1.0 * L + 0.0 * M + 0.0 * S;
    	M = 0.0 * L + 1.0 * M + 0.0 * S;
    	S = -0.395913 * L + 0.801109 * M + 0.0 * S;
	}
	
	vec4 error;
	error.r = (0.0809444479 * L) + (-0.130504409 * M) + (0.116721066 * S);
	error.g = (-0.0102485335 * L) + (0.0540193266 * M) + (-0.113614708 * S);
	error.b = (-0.000365296938 * L) + (-0.00412161469 * M) + (0.693511405 * S);
	error.a = 1.0;
	
	//vec4 difference = gameOutput - error;
	//vec4 correction;
	//correction.r = 0.0;
	//correction.g =  (difference.r * 0.7) + (difference.g * 1.0);
	//correction.b =  (difference.r * 0.7) + (difference.b * 1.0);
	//correction = gameOutput + correction;
	//correction.a = gameOutput.a * v_vIntensity;
	
	vec4 finalColor = mix(gameOutput, error, v_vIntensity);
	if (v_vGreyscaleFade > 0.0)
	{
		
		float gray = dot(finalColor.rgb, vec3(0.21, 0.71, 0.07));
		finalColor = vec4(mix(finalColor.rgb, vec3(gray), v_vGreyscaleFade), finalColor.a);	
	}
	
	gl_FragColor = vec4(finalColor.rgb, gameOutput.a);
	
}
