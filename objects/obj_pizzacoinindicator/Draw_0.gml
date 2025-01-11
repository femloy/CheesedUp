draw_set_font(global.smallnumber_fnt);
draw_set_halign(fa_center);
draw_set_color(c_white);

var xx = obj_player1.x + obj_player1.smoothx, yy = obj_player1.y - 60 + yo;
draw_sprite_ext(spr_pizzacoin, -1, xx - 35, yy, 1, 1, 0, c_white, image_alpha);
draw_text_color(xx + 15, yy, string(global.pizzacoinOLD), c_white, c_white, c_white, c_white, image_alpha);
