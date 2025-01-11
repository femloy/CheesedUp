draw_self();

draw_set_bounds(bbox_left, bbox_top, bbox_right + 1, bbox_bottom + 1, true);
draw_set_alpha(0.5 * image_alpha);
draw_set_color(c_black);
draw_rectangle(CAMX, CAMY, CAMX + CAMW, CAMY + CAMH, false);
draw_set_alpha(1);
draw_reset_clip();
