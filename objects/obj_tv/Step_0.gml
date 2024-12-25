live_auto_call;

timer_xstart = (SCREEN_WIDTH / 2) + timer_xplus;
timer_x = timer_xstart;
timer_ystart = SCREEN_HEIGHT + timer_yplus;

if (global.combotime > 0 && global.combo > 0)
	visualcombo = global.combo;

if hud_is_hidden()
{
	visible = false;
	targetspr = spr_tv_off;
}
else
	visible = true;

if !global.option_hud
	visible = false;
if instance_exists(obj_endlevelfade) && REMIX
	visible = false;

if global.hud != HUD_STYLES.old
	image_speed = 0.35;
if (targetgolf != noone && !instance_exists(targetgolf))
	targetgolf = -4;
if (targetgolf != noone && !view_visible[1])
{
	view_visible[1] = true;
	view_enabled = true;
}

if (bubblespr != noone && bubblespr != spr_tv_bubbleclosed)
{
	if (prompt != noone)
		prompt_buffer = 2;
	bubbleindex += image_speed;
	if (floor(bubbleindex) == sprite_get_number(bubblespr))
	{
		bubbleindex = 0;
		switch (bubblespr)
		{
			case spr_tv_bubbleopen:
                bubblespr = spr_tv_bubble
                break
            case spr_tv_bubbleclose:
                bubblespr = spr_tv_bubbleclosed
                if (prompt == noone or prompt == "")
                    bubblespr = noone
                break
		}
	}
}

if global.hud == HUD_STYLES.old
	sprite_index = -1;
else switch state
{
	case states.normal:
		idlespr = obj_player1.isgustavo ? spr_tv_idleG : spr_tv_idle;
		if global.hud == HUD_STYLES.final
		{
			if PANIC
				idlespr = obj_player1.isgustavo ? spr_tv_escapeG : spr_tv_exprpanic;
			else if ((global.combo >= 50 or global.stylethreshold >= 3) && !obj_player.isgustavo)
				idlespr = spr_tv_exprheat;
			else if (global.combo >= 3 && global.stylethreshold < 3 && !obj_player.isgustavo)
				idlespr = spr_tv_exprcombo;
			
			if instance_exists(obj_ghostcollectibles) && (REMIX or (SUGARY_SPIRE && obj_player1.character == "SP"))
			&& !obj_player.isgustavo && global.leveltosave != "secretworld"
			{
				targetspr = spr_tv_exprsecret;
				idlespr = spr_tv_exprsecret;
				idleanim = 240;
			}
		}
		
		var _state = obj_player1.state;
		if _state == states.backbreaker or _state == states.chainsaw
			_state = obj_player1.tauntstoredstate;
		
		var _transfo = true;
		var _transfospr = scr_tv_get_transfo_sprite();
		if !sprite_exists(_transfospr)
			_transfo = false;
		else
			idlespr = _transfospr;
		
		if !_transfo
		{
			with (obj_player1)
			{
				if (!isgustavo || obj_player1.character == "N")
				{
					if (mach4mode == 1)
						tv_do_expression(spr_tv_exprmach4, true);
					else if (state == states.mach3 or sprite_index == spr_mach3boost)
						tv_do_expression(spr_tv_exprmach3, true);
					else if (SUGARY_SPIRE && state == states.tumble && character == "SP")
						tv_do_expression(spr_tv_machrollSP, true);
				}
			}
		}
		switch (targetspr)
		{
			case spr_tv_off:
				if (visible)
				{
					targetspr = spr_tv_open;
					image_index = 0;
				}
				break;
			
			case spr_tv_open:
				if (floor(image_index) == (image_number - 1))
					targetspr = idlespr;
				break;
			
			case spr_tv_idle:
			case spr_tv_idleN:
				if (idleanim > 0)
					idleanim--;
				if (targetspr != idlespr)
					targetspr = idlespr;
				if (idleanim <= 0 && floor(image_index) == (image_number - 1))
				{
					targetspr = choose(spr_tv_idleanim1, spr_tv_idleanim2);
					image_index = 0;
				}
				break;
			
			case spr_tv_idleanim1:
			case spr_tv_idleanim2:
			case spr_tv_idleanim1N:
			case spr_tv_idleanim2N:
				if (floor(image_index) == (image_number - 1))
				{
					targetspr = idlespr;
					idleanim = 240 + (60 * irandom_range(-1, 2));
				}
				if (idlespr != spr_tv_idle && idlespr != spr_tv_idleN)
					targetspr = idlespr;
				break;
			
			default:
				targetspr = idlespr;
		}
		
		// bubble prompt
		if (targetspr != spr_tv_open)
		{
			if (!ds_list_empty(tvprompts_list))
			{
				var b = ds_list_find_value(tvprompts_list, 0);
				prompt_buffer = prompt_max;
				if (b[0] != "" && b[0] != noone)
				{
					bubblespr = spr_tv_bubbleopen;
					bubbleindex = 0;
					prompt = b[0];
					promptspd = b[3];
					promptx = promptxstart;
				}
				else
				{
					if (bubblespr != noone && bubblespr != spr_tv_bubbleclosed)
						bubblespr = spr_tv_bubbleclose;
					if (bubblespr == spr_tv_bubbleclosed)
						bubblespr = noone;
					bubbleindex = 0;
					promptx = promptxstart;
					prompt = -4;
				}
				if (b[1] == tvprompt.normal)
				{
					targetspr = spr_tv_open;
					image_index = 0;
					tvsprite = b[2];
				}
				else
				{
					tvsprite = b[2];
					targetspr = tvsprite;
					image_index = 0;
				}
				state = states.transition;
			}
			else
				bubblespr = noone;
		}
		break;
	
	case states.transition:
		if (targetspr == spr_tv_open && floor(image_index) == (image_number - 1))
			targetspr = tvsprite;
		if (targetspr == tvsprite)
		{
			if (prompt_buffer > 0)
				prompt_buffer--;
			else
			{
				promptx = promptxstart;
				ds_list_delete(tvprompts_list, 0);
				state = states.normal;
			}
		}
		break;
	
	case states.tv_whitenoise:
		if (tv_trans >= sprite_get_number(spr_tv_whitenoise))
		{
			if (expressionsprite != noone)
			{
				state = states.tv_expression;
				targetspr = expressionsprite;
			}
			else
				state = states.normal;
			image_index = 0;
		}
		break;
	
	case states.tv_expression:
		var _transfospr = scr_tv_get_transfo_sprite();
		
		switch (expressionsprite)
		{
			case spr_tv_exprhurtN:
			case spr_tv_exprhurt:
            case spr_tv_exprhurt1:
            case spr_tv_exprhurt2:
            case spr_tv_exprhurt3:
            case spr_tv_exprhurt4:
            case spr_tv_exprhurt5:
            case spr_tv_exprhurt6:
            case spr_tv_exprhurt7:
            case spr_tv_exprhurt8:
            case spr_tv_exprhurt9:
            case spr_tv_exprhurt10:
			case spr_tv_exprhurtN1:
            case spr_tv_exprhurtN2:
            case spr_tv_exprhurtN3:
            case spr_tv_exprhurtN4:
            case spr_tv_exprhurtN5:
            case spr_tv_exprhurtN6:
            case spr_tv_exprhurtN7:
            case spr_tv_exprhurtN8:
            case spr_tv_exprhurtN9:
            case spr_tv_exprhurtN10:
				if (obj_player1.state != states.hurt)
				{
					if (expressionbuffer > 0)
						expressionbuffer--;
					else
					{
						state = states.tv_whitenoise;
						expressionsprite = noone;
					}
				}
				break;
			
			case spr_tv_hurtG:
				if (obj_player1.state != states.ratmounthurt)
				{
					if (expressionbuffer > 0)
						expressionbuffer--;
					else
					{
						state = states.tv_whitenoise;
						expressionsprite = noone;
					}
				}
				break;
			
			case spr_tv_exprcombo:
			case spr_tv_exprcomboN:
				if (global.combo < 3 or _transfospr != noone or obj_player1.isgustavo or obj_player1.mach4mode or obj_player1.state == states.hurt or obj_player1.state == states.mach3 or obj_player1.sprite_index == obj_player1.spr_mach3boost or global.stylethreshold >= 3)
				{
					state = states.tv_whitenoise;
					expressionsprite = noone;
					if (obj_player1.state == states.hurt)
						tv_do_expression(spr_tv_exprhurt);
				}
				break;
			
			case spr_tv_exprcollect:
			case spr_tv_exprcollectN:
            case spr_tv_happyG:
			case spr_tv_exprconfecti1:
			case spr_tv_exprconfecti2:
			case spr_tv_exprconfecti3:
			case spr_tv_exprconfecti4:
			case spr_tv_exprconfecti5:
			case spr_tv_exprrudejanitor:
				if (expressionbuffer > 0)
					expressionbuffer--;
				else
				{
					state = states.tv_whitenoise;
					expressionsprite = noone;
				}
				break;
			
			case spr_tv_exprmach3:
			case spr_tv_exprmach3N:
				with (obj_player1)
				{
					if (state != states.mach3 && state != states.climbwall && (state != states.chainsaw or (tauntstoredstate != states.mach3 && tauntstoredstate != states.climbwall)) && sprite_index != spr_mach3boost && mach4mode == 0)
					{
						other.state = states.tv_whitenoise;
						other.expressionsprite = noone;
					}
					if (mach4mode)
						tv_do_expression(spr_tv_exprmach4);
					if SUGARY_SPIRE && state == states.tumble && character == "SP"
						tv_do_expression(spr_tv_machrollSP);
				}
				break;
			
			case spr_tv_exprmach4:
			case spr_tv_exprmach4N:
				with (obj_player1)
				{
					if (mach4mode == 0 && (state != states.chainsaw or (tauntstoredstate != states.mach3 && tauntstoredstate != states.climbwall)))
					{
						other.state = states.tv_whitenoise;
						other.expressionsprite = noone;
					}
					if SUGARY_SPIRE && state == states.tumble && character == "SP"
						tv_do_expression(spr_tv_machrollSP);
				}
				break;
			
			case spr_tv_exprheat:
			case spr_tv_exprheatN:
				_transfo = false;
				with (obj_player1)
				{
					if (_transfospr != noone)
						_transfo = true;
					if (isgustavo)
						_transfo = true;
				}
				if (global.stylethreshold < 3 or _transfo or obj_player1.mach4mode or obj_player1.state == states.hurt or obj_player1.state == states.mach3 or obj_player1.sprite_index == obj_player1.spr_mach3boost)
				{
					state = states.tv_whitenoise;
					expressionsprite = noone;
				}
				break;
			
			case spr_tv_exprpanic:
				_transfo = false;
				with (obj_player1)
				{
					if (_transfospr)
						_transfo = true;
					if (isgustavo)
						_transfo = true;
				}
				if ((!global.panic && !global.snickchallenge) or _transfo or obj_player1.mach4mode or obj_player1.state == states.hurt or obj_player1.state == states.mach3 or obj_player1.sprite_index == obj_player1.spr_mach3boost)
				{
					state = states.tv_whitenoise;
					expressionsprite = noone;
				}
				break;
			
			case spr_tv_machrollSP:
				with (obj_player1)
				{
					if (state != states.tumble)
					{
						if state == states.mach3
							tv_do_expression(mach4mode ? spr_tv_exprmach4 : spr_tv_exprmach3);
						else
						{
							other.state = states.tv_whitenoise;
							other.expressionsprite = noone;
						}
					}
				}
				break;
		}
		if (!ds_list_empty(tvprompts_list))
		{
			state = states.tv_whitenoise;
			tv_trans = 0;
			expressionsprite = noone;
		}
		break;
}

// PTO - set tv sprite
if sprite_exists(targetspr) && targetspr_old != targetspr && global.hud != HUD_STYLES.old && visible
{
	var char = obj_player1.character;
	if targetspr == spr_tv_machrollSP
		sprite_index = targetspr;
	else if targetspr == spr_tv_open or targetspr == spr_tv_off
	{
		if (BO_NOISE && char == "BN") or (SUGARY_SPIRE && check_sugarychar())
			sprite_index = SPRITES[? sprite_get_name(targetspr) + char] ?? targetspr;
		else
			sprite_index = targetspr;
	}
	else
	{
		// apply character
		var charspr = targetspr;
		if char != "P"
		{
			charspr = SPRITES[? sprite_get_name(targetspr) + char];
			if charspr == undefined
			{
				// placeholder tv
				switch char
				{
					case "SP": case "SN": if SUGARY_SPIRE charspr = spr_tv_failsafeSP; break;
					case "V": charspr = spr_tv_exprhurt5V; break;
					default: charspr = targetspr; break;
				}
			}
		}
		 
		// shaded tv
		if /*REMIX or */global.hud == HUD_STYLES.april
		{
			if char == "P"
				char = "";
			sprite_index = SPRITES[? sprite_get_name(targetspr) + char + "_NEW"] ?? charspr;
		}
		else
			sprite_index = charspr;
	}
	targetspr_old = targetspr;
}

// transition timer
if (state != states.tv_whitenoise)
	tv_trans = 0;
else
	tv_trans += 0.35;

// hide tv
var change_pos = (((!MOD.Mirror && obj_player1.x > room_width - 224) or (MOD.Mirror && obj_player1.x < 224)) && obj_player1.y < 187) or manualhide;
if (bubblespr != noone && obj_player1.x > 316 && obj_player1.y < 101)
	change_pos = true;
with obj_tutorialbook
{
	if in_level && (text_state == states.fall or text_state == states.normal)
		change_pos = true;
}

if SUGARY_SPIRE && check_sugarychar()
	hud_posY = lerp(hud_posY, change_pos * -300, 0.15);
else
	hud_posY = Approach(hud_posY, change_pos * -300, 15);

// fill timer
pizzaface_index += 0.35;
hand_index += 0.35;
johnface_index += sugary_level ? 0.015 : 0.35;

var sprite_struct = scr_timer_sprites();
var minimal_war = global.hud == HUD_STYLES.minimal && instance_exists(obj_wartimer);
var hide_timer = (global.fill <= 0 or instance_exists(obj_pizzaface)) && !minimal_war;
var showtime = global.fill <= (global.snickchallenge ? calculate_panic_timer(2, 0) : 0);

if global.panic or global.snickchallenge
{
	if !showtime && !hide_timer
	{
		if global.snickchallenge or sugary_level
			pizzaface_sprite = sprite_struct.pizzaface1;
		else
		{
			if pizzaface_sprite == sprite_struct.pizzafaceparry
			{
				if floor(pizzaface_index) == sprite_get_number(pizzaface_sprite) - 1
				{
					pizzaface_sprite = sprite_struct.pizzafacewait;
					pizzaface_index = 0;
				}
			}
			else if pizzaface_sprite == sprite_struct.pizzaface2 or pizzaface_sprite == sprite_struct.pizzaface3 or pizzaface_sprite == sprite_struct.pizzafaceback
			{
				pizzaface_sprite = sprite_struct.pizzafaceparry;
				pizzaface_index = 0;
			}
			else if pizzaface_sprite != sprite_struct.pizzafacewait
				pizzaface_sprite = sprite_struct.pizzaface1;
		}
	}
	else
	{
		if pizzaface_sprite == sprite_struct.pizzaface1
		{
			pizzaface_sprite = sprite_struct.pizzaface2;
			pizzaface_index = 0;
		}
		else if pizzaface_sprite == sprite_struct.pizzafacewait
		{
			pizzaface_sprite = sprite_struct.pizzafaceback;
			pizzaface_index = 0;
		}
		else if (pizzaface_sprite == sprite_struct.pizzaface2 or pizzaface_sprite == sprite_struct.pizzafaceback)
		{
			if (floor(pizzaface_index) == sprite_get_number(pizzaface_sprite) - 1 && (!sugary_level or global.leveltosave == "sucrose"))
			or floor(pizzaface_index) >= 70
			{
				pizzaface_sprite = sprite_struct.pizzaface3;
				pizzaface_index = 0;
			}
		}
	}
	
	if !hide_timer
	{
		showtime_buffer = 100;
		if (!instance_exists(obj_ghostcollectibles) && !instance_exists(obj_wartimer))
		or global.leveltosave == "sucrose" or global.leveltosave == "secretworld" or minimal_war
			timer_y = Approach(timer_y, timer_ystart, 1);
		else
			timer_y = Approach(timer_y, timer_ystart + 212, 4);
	}
	else if pizzaface_sprite == sprite_struct.pizzaface3
	{
		if showtime_buffer > 0
			showtime_buffer--;
		else
			timer_y = Approach(timer_y, timer_ystart + 212, 1);
	}
	
	if global.fill < chunkmax / 5
		hand_sprite = spr_timer_hand2;
}
else
{
	pizzaface_sprite = sprite_struct.pizzaface1;
	hand_sprite = spr_timer_hand1;
	timer_y = timer_ystart + 212;
	lap_x = timer_x;
	lap_y = SCREEN_HEIGHT + 212;
}

barfill_x -= 0.2;
if barfill_x < -173
	barfill_x = 0;

if pizzaface_index > sprite_get_number(pizzaface_sprite) - 1 && !sugary_level
	pizzaface_index = frac(pizzaface_index);
if hand_index > sprite_get_number(hand_sprite) - 1
	hand_index = frac(hand_index);
if johnface_index > sprite_get_number(johnface_sprite) - 1 && !sugary_level
{
	johnface_index = frac(johnface_index);
	if johnface_sprite == spr_timer_johnfaceback
		johnface_sprite = spr_timer_johnface;
}

if abs(global.fill - fill_lerp) > 100 && johnface_sprite != spr_timer_johnfaceback
{
	johnface_sprite = spr_timer_johnfaceback;
	johnface_index = 0;
}

// combo
combo_posX = Wave(-5, 5, 2, 20);
if (global.combotime > 0 && global.combo != 0)
{
	switch (combo_state)
	{
		case 0:
			combo_posY += combo_vsp;
			combo_vsp += 0.5;
			if (combo_posY > 20)
				combo_state++;
			break;
		case 1:
			combo_posY = lerp(combo_posY, 0, 0.05);
			if (combo_posY < 1)
			{
				combo_posY = 0;
				combo_vsp = 0;
				combo_state++;
			}
			break;
		case 2:
			if (global.combotime < 30)
			{
				combo_posY += combo_vsp;
				if (combo_vsp < 20)
					combo_vsp += 0.5;
				if (combo_posY > 0)
				{
					combo_posY = 0;
					combo_vsp = -1;
					if (global.combotime < 15)
						combo_vsp = -2;
				}
			}
			else
				combo_posY = Approach(combo_posY, 0, 10);
			break;
	}
}
else
{
	combo_posY = Approach(combo_posY, -500, 5);
	combo_vsp = 0;
	combo_state = 0;
}
combofill_index += 0.35;
if (combofill_index > (sprite_get_number(spr_tv_combobubblefill) - 1))
	combofill_index = frac(combofill_index);

// pto
lapflag_index = (lapflag_index + 0.35) % sprite_get_number(spr_lapflag);
