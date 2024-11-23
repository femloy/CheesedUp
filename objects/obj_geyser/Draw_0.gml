draw_sprite_ext(spr_geyservertical, geyser_image_index, x, y, image_xscale * 3, geyser_size, 0, c_white, geyser_opacity);
draw_self();

// Draw Puff
draw_sprite_ext(spr_geysercloud, cloud_image_index, x, y, image_xscale, 1, 0, c_white, 1);
