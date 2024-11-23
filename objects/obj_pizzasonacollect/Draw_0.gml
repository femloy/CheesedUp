var chigaco = spr_chigaco, thankyou = spr_pizzasona_thankyou;
if SUGARY_SPIRE && check_sugary()
	chigaco = spr_movingplatform_ss;

draw_self();
draw_sprite(chigaco, index, x, y + 46);
if showtext
	draw_sprite(thankyou, index, x, y - 40);
