function sh_tex_debug()
{
	static enabled = false;
	
	enabled = !enabled;
	toggle_texture_debug(enabled);
	
	return $"Texture group debugging {(enabled ? "ON" : "OFF")}";
}
function meta_tex_debug()
{
	return {
		description: "toggles texture group debugging",
	}
}
