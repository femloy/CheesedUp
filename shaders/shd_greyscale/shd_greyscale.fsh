//
// For Sugary Spire levels
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float fade;

void main()
{ 
    float gray = dot(texture2D(gm_BaseTexture,v_vTexcoord).rgb, vec3(0.21, 0.71, 0.07));
    gl_FragColor = vec4(mix(texture2D(gm_BaseTexture,v_vTexcoord).rgb, vec3(gray), fade), texture2D(gm_BaseTexture, v_vTexcoord).a);
}
