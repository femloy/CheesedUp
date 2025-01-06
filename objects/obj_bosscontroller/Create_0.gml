if (instance_number(object_index) > 1)
{
	instance_destroy();
	exit;
}
global.bossplayerhurt = false;
global.playerhit = 0;
global.extrahats = 0;
global.hats = 0;
bossID = noone;
bossdead = false;
particlelist = ds_list_create();
glitchbuffer = 40;
glitchalpha = 1;
arenastate = 0;
arenabuffer = 0;
whitefade = 0;
introshake = 0;
introshake_acc = 0;
victory_buffer = 0;
boss_prevhp = 8;
boss_prevhpbuffer = 0;
boss_hp = 8;
boss_func = noone;
boss_columnmax = 4;
boss_rowmax = 2;
boss_hp_x = 762;
boss_hp_y = 50;
boss_xpad = 44;
boss_ypad = 42;
boss_hpsprite = spr_bossfight_pepperhp;
boss_palette = spr_bossfight_pepperpalette
boss_index = 0;
player_hp = 6;
player_maxhp = player_hp;
player_hp_x = 64;
player_hp_y = 50;
player_columnmax = 3;
player_rowmax = 2;
player_xpad = 44;
player_ypad = 42;
player_index = 0;
bosstimer_x = 257;
bosstimer_y = 466;
bell_sprite = spr_bosstimer_bell;
bell_index = 0;
bell_buffer = 0;
bar_surface = noone;
barfill_x = 0;
round_timermax = 36000;
round_timer = round_timermax;
round_timer_init = false;
state = states.arenaintro;
intro_buffer = 300;
playerx = -415;
bossx = SCREEN_WIDTH;
vsy = -400;
flamey = 0;
flash = false;
flashed = false;
bossintrostate = states.normal;
vstitle = spr_vstitle_noise;
bossspr = spr_vsnoise;

refresh_sprites = function()
{
	playersprshadow = noone;
	
	var custom = scr_modding_character(obj_player1.character);
	if custom != noone
	{
		playerspr = custom.sprites.misc[$ "spr_vsplayer"] ?? spr_vspeppino;
		vstitleplayer = custom.sprites.misc[$ "spr_vstitle"] ?? spr_vstitle_player;
		playersprshadow = custom.sprites.misc[$ "spr_vsplayershadow"] ?? noone;
		player_hpsprite = custom.sprites.misc[$ "spr_bossfight_playerhp"] ?? spr_bossfight_playerhp;
		exit;
	}
	
	switch obj_player1.character
	{
		case "N":
			playerspr = spr_vsnoiseplayer;
			playersprshadow = spr_vsnoiseplayershadow;
			vstitleplayer = spr_vstitle_playerN;
			player_hpsprite = spr_bossfight_noiseHP;
			break;
	
		case "V":
			vstitleplayer = spr_playerV_versustitle;
			playerspr = spr_playerV_versus;
			player_hpsprite = spr_bossfight_vigiHP;
			break;
	
		case "SP":
			if SUGARY_SPIRE
			{
				vstitleplayer = spr_playerSP_versustitle;
				playerspr = spr_playerSP_versus;
				player_hpsprite = spr_bossfight_pizzyhp;
				break;
			}
		
		default:
			vstitleplayer = spr_vstitle_player;
			playerspr = spr_vspeppino;
			playersprshadow = spr_vspeppinoshadow;
			player_hpsprite = spr_bossfight_playerhp;
			break;
	}
}
refresh_sprites();
