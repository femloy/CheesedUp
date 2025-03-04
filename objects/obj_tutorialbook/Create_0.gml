image_speed = 0.05;
mask_index = spr_tutorialgranny_sleep;

show = false;
compiled = false;
lang_name = "";
donepanic = false;
bubble_spr = spr_tutorialbubble;
rope_spr = spr_tutorialbubble_rope;
rope_img = 0.0;
wave_timer = 0;
text = "";
text_borderpad = 32;
text_contentpad = 16;
text_ystart = text_borderpad;
text_y = -200;
tex_x = 0;
text_state = states.titlescreen;
text_xscale = (SCREEN_WIDTH - 64) / sprite_get_width(bubble_spr);
text_oldxscale = text_xscale;
text_yscale = 1;
text_sprite_width = sprite_get_width(bubble_spr);
text_sprite_height = sprite_get_height(bubble_spr);
text_wave_x = 0;
text_wave_y = 0;
text_arr = noone;
text_dir = 1;
background_spr = spr_pizzagrannytexture;
text_color = 0;
surfclip = noone;
surffinal = noone;
font = noone;
showgranny = true;
change_y = true;
alarm[0] = 1;
depth = 10;
voicecooldown = 0;

spr_sleep = spr_tutorialgranny_sleep;
spr_talk = spr_tutorialgranny_talk;
snd_voice = "event:/sfx/voice/pizzagranny";

if SUGARY_SPIRE && SUGARY
{
	bubble_spr = spr_icepop_bubble;
	rope_spr = spr_icepop_rope;
	background_spr = spr_icepopbg;
	spr_sleep = spr_grandpop;
	spr_talk = spr_grandpop_speak;
}

refresh_func = noone;
font = lang_get_font("tutorialfont");
in_level = false;
