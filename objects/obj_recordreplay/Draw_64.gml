live_auto_call;

//draw_sprite_stretched(spr_replay_overlay, 0, 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);

draw_set_colour(c_red);
draw_set_font(font0);
draw_text(4, SCREEN_HEIGHT - 32, $"SIZE {buffer_get_size(buffer) / 1000000}MB");
