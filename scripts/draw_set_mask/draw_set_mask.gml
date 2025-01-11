function draw_set_bounds(x1, y1, x2, y2, inverse = false)
{
	/// @desc Sets a boundary rectangle for drawing. Anything outside of this rectangle will be clipped out.
	
	// OLD: x1, y1, x2, y2, alphafix, simple, inverse
	
	draw_clear_mask();
	draw_mask_start(inverse);
	var a = draw_get_alpha();
	draw_set_alpha(1);
	draw_rectangle(x1, y1, x2 - 1, y2 - 1, false);
	draw_set_alpha(a);
	draw_mask_end();
}
function draw_set_mask(x, y, sprite, subimg = 0, inverse = false, alpha_threshold = 0.5)
{
	/// @desc Use a sprite as a stencil mask for future drawing. Use draw_clear_mask() to reset.
	
	draw_clear_mask();
	
	draw_mask_start();
	draw_sprite(sprite, subimg, x, y);
	draw_mask_end();
}
function draw_set_mask_surface(x, y, surf, inverse = false, alpha_threshold = 0.5)
{
	/// @desc Use a sprite as a stencil mask for future drawing. Use draw_clear_mask() to reset.
	
	draw_clear_mask();
	
	draw_mask_start();
	draw_surface(surf, x, y);
	draw_mask_end();
}
function draw_mask_start(inverse = false, alpha_threshold = 0.5)
{
	/// @desc Sets the drawing target to the stencil buffer. Make sure to use draw_mask_end() right after.
	if !gpu_get_stencil_enable()
	{
		gpu_set_stencil_enable(true);
		draw_clear_stencil(inverse ? 1 : 0); // Zeroes out the stencil buffer
	}
	
	// Prepare stencil buffer
	gpu_set_stencil_func(cmpfunc_always); // Always pass as long as there's a pixel
	gpu_set_stencil_pass(stencilop_replace); // Start writing to the buffer
	gpu_set_stencil_ref(inverse ? 0 : 1); // Value to write
	
	gpu_push_state();
	gpu_set_alphatestenable(true);
	gpu_set_alphatestref(min(0xFF * alpha_threshold, 0xFF - 1)); // Pixels under this threshold will be discarded (won't exist)
	gpu_set_colorwriteenable(false, false, false, false); // Don't draw the mask sprite to the screen
}
function draw_mask_end()
{
	/// @desc Call this after drawing your stencil mask with draw_mask_start(). Future drawing operations will use the mask, until you call draw_clear_mask().
	gpu_pop_state();
	gpu_set_stencil_pass(stencilop_keep); // Stop writing to the stencil
	
	// Since each pixel wrote 1 to the buffer, now we can use the stencil as a mask
	gpu_set_stencil_ref(1); // Value to check against
	gpu_set_stencil_func(cmpfunc_equal); // From now on, only draw if the value at each position in the buffer is 1
}
function draw_clear_mask()
{
	/// @desc Disables the stencil mask.
	gpu_set_stencil_enable(false);
	draw_clear_stencil(0);
}
