draw_sprite_ext(sprite_index, image_index, x + random_range(-shake, shake), y + random_range(-shake, shake), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
shake = Approach(shake, 0, 0.5);
