live_auto_call;

if state == 2 or state == 3
{
	draw_set_alpha(0.7);
	draw_set_colour(c_black);
	draw_rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, false);
	draw_set_alpha(1);
	draw_set_colour(c_white);
	
	draw_set_font(lfnt("bigfont"));
	draw_set_align(fa_center);
	draw_text(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2 - 40, lstr("transfer_sure"));
	
	var c1 = sel3 == 0 ? c_white : c_gray;
	var c2 = sel3 == 1 ? c_white : c_gray;
	draw_text_color(SCREEN_WIDTH / 2 - 50, SCREEN_HEIGHT / 2, lstr("transfer_yes"), c1, c1, c1, c1, 1);
	draw_text_color(SCREEN_WIDTH / 2 + 50, SCREEN_HEIGHT / 2, lstr("transfer_no"), c2, c2, c2, c2, 1);
	exit;
}

draw_set_alpha(image_alpha);

draw_set_font(lfnt("creditsfont"));
draw_set_colour(c_white);
draw_set_align();
if tip != noone
	scr_draw_text_arr(16, SCREEN_HEIGHT - tip[3] - 32 - 16, tip[0], c_white, image_alpha);

draw_set_align(fa_center);

var focus = state == 1 ? 1 : 0;
var c1 = focus == 0 ? c_white : c_gray;
var c2 = focus == 0 ? c_gray : c_white;

draw_text_color(x1, 50 + Wave(0, 1, 0.5, 0), "Pizza Tower", c1, c1, c1, c1, image_alpha);
draw_text_color(x2, 50 + Wave(0, 1, 0.5, 0), CHEESED_UP ? "Cheesed Up" : "Together", c2, c2, c2, c2, image_alpha);

// pizza tower saves
var yy = 0;
var hand_wave = Wave(-2, 2, 1, 0);

draw_set_colour(c_white);
if !array_length(saves)
{
	draw_set_font(lfnt("font_small"));
	draw_text(x1, SCREEN_HEIGHT / 2, lstr("transfer_nosaves"));
}
else
{
	var yy = grab_text ? hand_y + 20 : 200;
	var this = saves[sel];
	yy = draw_pt_save(this, state == 1 ? x2 : x1, grab_text ? yy + hand_wave : yy) - hand_wave;
	
	//if sel != array_length(saves) - 1
	//	draw_sprite_ext(spr_palettearrow, 0, x1, yy + 64 + Wave(-1, 1, 1, 0), -1, -1, 0, c_white, 1);
}

// cheesed up
var this = saves_current[sel2];

if state == 1
{
	yy = max(yy + 80, 200);
	draw_sprite_ext(spr_palettearrow, 0, x2, yy - 40, -1, -1, 0, c_white, 1);
}
else
	yy = 200;

switch this.type
{
	case 0:
		draw_set_font(lfnt("bigfont"));
		draw_text_color(x2, yy, lstr("transfer_settings"), c2, c2, c2, c2, image_alpha);
		break;
	case 1:
		draw_set_font(lfnt("bigfont"));
		if this.started && state == 1
			c2 = merge_color(c_white, c_red, Wave(0, 0.7, 1, 0));
		
		draw_text_color(x2, yy, concat(this.sandbox ? lstr("transfer_sandbox") : lstr("transfer_story"), " ", this.slot + 1), c2, c2, c2, c2, image_alpha);
		
		yy += 32 + 16;
		if this.started && state == 1
		{
			draw_set_font(lfnt("font_small"));
			draw_text(x2 + random_range(-1, 1), yy + random_range(-1, 1), lstr("transfer_overwrite"));
		}
		break;
}

draw_sprite(hand_spr, -1, hand_x, hand_y + hand_wave);
draw_set_alpha(1);
