function resize_surface_if_resized(surf, width, height)
{
	if !surface_exists(surf)
		exit;
	if surface_get_width(surf) != width || surface_get_height(surf) != height
		surface_resize(surf, width, height);
}
