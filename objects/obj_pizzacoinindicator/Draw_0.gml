draw_set_font(global.smallnumber_fnt);
draw_set_align(fa_center);
draw_set_color(c_white);
draw_sprite(spr_pizzacoin, image_index, obj_player1.x - 35, obj_player1.y - 60);
draw_text(obj_player1.x + 15, obj_player1.y - 60, string(global.pizzacoin));
