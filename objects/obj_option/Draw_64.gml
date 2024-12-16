live_auto_call;

draw_rectangle_color(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, 0, 0, 0, 0, false);

if SUGARY_SPIRE
	var sugary = check_sugary();

if SUGARY_SPIRE && sugary
	draw_sprite_tiled(bg_options_ss, 0, bg_x, bg_y);
else
{
	for (var i = 0; i < array_length(bg_alpha); i++)
		draw_sprite_tiled_ext(spr_optionsBG, i, bg_x, bg_y, 1, 1, c_white, bg_alpha[i]);
}

if room != Mainmenu
{
	with obj_keyconfig
		event_perform(ev_draw, ev_gui);
}
if instance_exists(obj_keyconfig) or instance_exists(obj_screenconfirm) or instance_exists(obj_langselect)
or safe_get(obj_modconfig, "visible") or instance_exists(obj_hudcustomizer)
{
	tooltip_alpha = 0;
	exit;
}

tdp_draw_set_font(lang_get_font("bigfont"));
tdp_draw_set_align(fa_center, fa_middle);
draw_set_color(c_white);

var _os = optionselected;
var m = menus[menu];
var options = m.options;
var len = array_length(options);
var size = (string_height(lang_get_value("default_letter")) * len) + (len * m.ypad);
var xx = SCREEN_WIDTH / 2;
var yy = (SCREEN_HEIGHT / 2) - (size / 4);

var xpad = m.xpad;
if SUGARY_SPIRE && sugary
	xpad -= 32;

switch (m.anchor)
{
	case menu_anchor.center:
		tdp_draw_set_halign(fa_center);
		tdp_draw_set_valign(fa_top);
		
		var c = c_white;
		var a = 1;
		for (i = 0; i < len; i++)
		{
			var o = options[i];
			c = c_gray;
			if (i == _os)
				c = c_white;
			var t = menu_lang_value(o.name);
			menu_draw_text(xx, yy + (m.ypad * i), t, c, a);
			if menu == menu_pages.main && !(SUGARY_SPIRE && sugary)
				scr_pauseicon_draw(i, xx + (string_width(t) / 2) + 50, yy + (m.ypad * i) + (string_height(t) / 2));
		}
		break;
	
	case menu_anchor.left:
		tdp_draw_set_halign(fa_left);
		tdp_draw_set_valign(fa_top);
		
		xx = xpad;
		c = c_white;
		a = 1;
		
		var yy_plus = 0;
		for (i = 0; i < len; i++)
		{
			tdp_draw_set_halign(fa_left);
			var _newline = false;
			
			o = options[i];
			c = c_gray;
			if (i == _os)
				c = c_white;
			
			if o.type == menutype.press && !o.localization
                var txt = o.name;
            else
				var txt = menu_lang_value(o.name);
			
			var target_y = yy + (m.ypad * i) + yy_plus;
			if SUGARY_SPIRE && sugary && o.name == "option_back"
			{
				draw_set_align(fa_center);
				draw_text_color(150, yy - 50, txt, c, c, c, c, a);
			}
			else if menu_draw_text(xx, target_y, txt, c, a)
				_newline = true;
			
			tdp_draw_set_halign(fa_right);
			switch (o.type)
			{
				case menutype.toggle:
					menu_draw_text(SCREEN_WIDTH - m.xpad, target_y, o.value ? lang_get_value("option_on") : lang_get_value("option_off"), c, a);
					break;
				
				case menutype.slide:
					var w = 200;
					var h = 5;
					var aw = w * (o.value / 100);
					var x1 = SCREEN_WIDTH - xpad - w;
					var y1 = target_y;
					var x2 = x1 + aw;
					var y2 = y1 + h;
					
					var spr = spr_slidericon;
					if menu != menu_pages.audio
						spr = spr_slidericon2;
					
					draw_set_alpha(a);
					draw_sprite_ext(spr_slider, 0, x1, y1, 1, 1, 0, c_dkgray, a);
					draw_sprite_ext(spr_slider, 0, x1, y1, 1, 1, 0, c, a);
					draw_set_alpha(1);
					
					draw_sprite(spr, o.moving ? 1 : 0, x2, y2 - h);
					break;
				
				case menutype.multiple:
					var select = o.values[o.value];
					var n = select.name;
					if (select.localization)
						n = menu_lang_value(select.name);
					if menu_draw_text(SCREEN_WIDTH - m.xpad, target_y, n, c, a)
						_newline = true;
					break;
			}
			if _newline
				yy_plus += 16;
		}
		break;
}

var curr = options[_os];
if tooltip != curr.tooltip
{
	tooltip_alpha = Approach(tooltip_alpha, 0, curr.tooltip == "" ? 0.25 : 1);
	if tooltip_alpha == 0
		tooltip = curr.tooltip;
}
else if tooltip != ""
	tooltip_alpha = Approach(tooltip_alpha, 1, 0.25);

if tooltip_alpha > 0
{
	draw_set_font(lang_get_font("font_small"));
	
	var str = tooltip;
	var xx = SCREEN_WIDTH / 2, yy = SCREEN_HEIGHT * 0.86, wd = string_width(str) + 32, ht = string_height(str) + 16;
	
	draw_set_alpha(tooltip_alpha / 2);
	draw_set_colour(c_black);
	draw_roundrect(xx - wd / 2 - 1, yy - ht / 2 - 1, xx + wd / 2, yy + ht / 2 - 2, false);
	
	tdp_draw_set_font(lang_get_font("font_small"));
	tdp_draw_set_halign(fa_center);
	tdp_draw_set_valign(fa_middle);
	
	tdp_draw_text_color(xx + 2, yy + 2, tooltip, 0, 0, 0, 0, tooltip_alpha * 0.35);
	tdp_draw_text_color(xx, yy, str, c_white, c_white, c_white, c_white, tooltip_alpha);
}
tdp_text_commit();

draw_set_align();
draw_set_colour(c_white);

if room != Mainmenu
{
	with obj_transfotip
		event_perform(ev_draw, ev_gui);
}
