ensure_order;

if MOD.Golf
{
	if scr_golfball_update()
		exit;
}

// clone vars that lag behind by a frame
prevhsp = hsp;
prevvsp = vsp;
prevmove = move;
prevmovespeed = movespeed;
previcemovespeed = icemovespeed;
prevxscale = xscale;

// input buffers and coyote time
if (global.shootbutton ? key_shoot2 : key_slap2)
	input_buffer_shoot = 10;
if ((global.shootbutton == 1 && character != "V") ? key_shoot2 : key_slap2)
	input_buffer_pistol = 10;
if (SUGARY_SPIRE && character == "SN") or (!CHAR_BASENOISE && isgustavo)
{
	if (key_chainsaw2 or key_slap2)
		input_buffer_slap = 12;
}
else if global.swapgrab && global.attackstyle != MOD_MOVES.grab
{
	if (key_chainsaw2)
		input_buffer_slap = 12;
	if (key_slap2)
		input_buffer_grab = 12;
}
else
{
	if (key_slap2)
		input_buffer_slap = 12;
	if (global.attackstyle != MOD_MOVES.grab ? key_chainsaw2 : key_slap2)
		input_buffer_grab = 12;
}
if (key_jump)
	input_buffer_jump = 15;
if (key_down2)
	input_buffer_down = 15;
if (key_attack2)
	input_buffer_mach = 15;
if (key_taunt_p2)
	input_taunt_p2 = 5;

if (grounded && vsp > 0)
	coyote_time = 8;
if (vsp < 0)
	coyote_time = 0;
can_jump = (grounded && vsp > 0) or (coyote_time && vsp > 0);

if (state != states.grab)
	swingdingthrow = false;

// reset noise walljumps
if (CHAR_BASENOISE && !isgustavo)
{
	if (can_jump && vsp > 0)
	{
		noisewalljump = 0;
		noisedoublejump = true;
	}
}

// collision flags
enum colflag
{
	secret = 1,
	sloped = 2,
	grounded = 4
	// 8, 16, 32, 64, 128, 256...
}

collision_flags = 0;
if (place_meeting(x, y, obj_secretportal) || place_meeting(x, y, obj_secretportalstart))
	collision_flags |= colflag.secret;
if (scr_solid_player(x, y + 1))
	collision_flags |= colflag.grounded;
if (check_slope(x, y + 1))
	collision_flags |= colflag.sloped;

// ceiling running
if MOD.GravityJump
{
	if state != states.balloon && state != states.ladder && !(state == states.tumble && key_down) && state != states.climbwall && state != states.Sjump
	&& state != states.trashroll && state != states.antigrav && state != states.cheesepepstick && state != states.freefallland && state != states.debugstate
	&& state != states.rideweenie && !(!grounded && global.noisejetpack) && state != states.rocket && !scr_solid(x, y - 1) && state != states.dynamite
	&& state != states.grind
	{
		if gravityangle % 180 != 0 // animation
			vsp = Approach(vsp, 0, 2);
		else if key_jump && (!cutscene or (collision_flags & colflag.secret) > 0) && (grounded or abs(vsp) > 8)
		{
			with instance_create(x, y, obj_gravityflipbg)
				side = -other.flip;
		
			gravityjump = !gravityjump;
			grounded = false;
			vsp = 12;
			yscale = 1;
		}
		input_buffer_jump = 0;
		key_jump = false;
		can_jump = false;
	}
}

gravityangle = Approach(gravityangle, gravityjump ? 180 : 0, 15);
if (state == states.bump or state == states.Sjump or state == states.Sjumpprep or state == states.tumble) && gravityangle != 180
	gravityangle = 0;

flip = ((ceilingrun xor gravityjump) ? -1 : 1);

// noise's standing superjump is just here I guess
if ((CHAR_BASENOISE or character == "MS") && !skateboarding && ((scr_check_superjump() && key_jump2) || key_superjump) && state != states.mach3 && can_jump && vsp > 0 && (state == states.normal || state == states.mach2))
{
	sprite_index = spr_superjumpprep;
	state = states.Sjumpprep;
	hsp = 0;
	image_index = 0;
	
	if character == "MS"
		state = states.stick_superjump;
}

// state machine
if (character == "S" && !isgustavo) or (character == "V" && isgustavo)
	mask_index = spr_crouchmask;

if scr_modding_hook_falser("player/prestate") switch state
{
	case states.normal:	scr_player_normal(); break;
	case states.revolver: scr_player_revolver(); break;
	case states.dynamite: scr_player_dynamite(); break;
	case states.boots: scr_player_boots(); break;
	case states.grabbed: scr_player_grabbed(); break;
	case states.finishingblow: scr_player_finishingblow(); break;
	case states.tumble: scr_player_tumble(); break;
	case states.titlescreen: scr_player_titlescreen(); break;
	case states.ejected: scr_player_ejected(); break;
	case states.firemouth: scr_player_firemouth(); break;
	case states.fireass: scr_player_fireass(); break;
	case states.transition: scr_player_transitioncutscene(); break;
	case states.hookshot: scr_playerN_hookshot(); break;
	case states.slap: scr_player_slap(); break;
	case states.tacklecharge: scr_player_tacklecharge(); break;
	case states.cheesepep: scr_player_cheesepep(); break;
	case states.cheesepepjump: scr_player_cheesepepjump(); break;
	case states.cheesepepfling: scr_player_cheesepepfling(); break;
	case states.cheeseball: scr_player_cheeseball(); break;
	case states.cheeseballclimbwall: scr_player_cheeseballclimbwall(); break;
	case states.cheesepepstickside: scr_player_cheesepepstickside(); break;
	case states.cheesepepstickup: scr_player_cheesepepstickup(); break;
	case states.cheesepepstick: scr_player_cheesepepstick(); break;
	case states.cheesepeplaunch: scr_player_cheesepeplaunch(); break;
	case states.boxxedpep: scr_player_boxxedpep(); break;
	case states.boxxedpepjump: scr_player_boxxedpepjump(); break;
	case states.boxxedpepspin: scr_player_boxxedpepspin(); break;
	case states.bombkick: scr_playerN_throwkick(); break;
	case states.pistolaim: scr_player_pistolaim(); break;
	case states.climbwall: scr_player_climbwall(); break;
	case states.knightpepslopes: scr_player_knightpepslopes(); break;
	case states.portal: scr_player_portal(); break;
	case states.secondjump: scr_player_secondjump(); break;
	case states.chainsawbump: scr_player_chainsawbump(); break;
	case states.handstandjump: scr_player_handstandjump(); break;
	case states.lungeattack: scr_player_lungeattack(); break;
	case states.lungegrab: scr_player_lungegrab(); break;
	case states.dashtumble: scr_player_dashtumble(); break;
	case states.shoulderbash: scr_player_shoulderbash(); break;
	case states.gottreasure: scr_player_gottreasure(); break;
	case states.knightpep: scr_player_knightpep(); break;
	case states.knightpepattack: scr_player_knightpepattack(); break;
	case states.knightpepbump: scr_player_knightpepbump(); break;
	case states.meteorpep: scr_player_meteorpep(); break;
	case states.bombpep: scr_player_bombpep(); break;
	case states.bombpepup: scr_player_bombpepup(); break;
	case states.bombpepside: scr_player_bombpepside(); break;
	case states.bombgrab: scr_player_bombgrab(); break;
	case states.grabbing: scr_player_grabbing(); break;
	case states.chainsawpogo: scr_player_chainsawpogo(); break;
	case states.shotgunjump: scr_player_shotgunjump(); break;
	case states.stunned: scr_player_stunned(); break;
	case states.highjump: scr_player_highjump(); break;
	case states.chainsaw: scr_player_chainsaw(); break;
	case states.hit: scr_player_hit(); break;
	case states.thrown: scr_player_thrown(); break;
	case states.facestomp: scr_player_facestomp(); break;
	case states.timesup: scr_player_timesup(); break;
	case states.machroll: scr_player_machroll(); break;
	case states.pistol: scr_player_pistol(); break;
	case states.shotgun: scr_player_shotgun(); break;
	case states.shotguncrouch: scr_player_shotguncrouch(); break;
	case states.shotguncrouchjump: scr_player_shotguncrouchjump(); break;
	case states.shotgunshoot: scr_player_shotgunshoot(); break;
	case states.shotgunfreefall: scr_player_shotgunfreefall(); break;
	case states.shotgundash: scr_player_shotgundash(); break;
	case states.machfreefall: scr_player_machfreefall(); break;
	case states.throwing: scr_player_throwing(); break;
	case states.superslam: scr_player_superslam(); break;
	case states.slam: scr_player_slam(); break;
	case states.skateboard: scr_player_skateboard(); break;
	case states.grind: scr_player_grind(); break;
	case states.grab: scr_player_grab(); break;
	case states.punch: scr_player_punch(); break;
	case states.backkick: scr_player_backkick(); break;
	case states.uppunch: scr_player_uppunch(); break;
	case states.shoulder: scr_player_shoulder(); break;
	case states.backbreaker: scr_player_backbreaker(); break;
	case states.graffiti: scr_player_graffiti(); break;
	case states.bossdefeat: scr_player_bossdefeat(); break;
	case states.bossintro: scr_player_bossintro(); break;
	case states.smirk: scr_player_smirk(); break;
	case states.pizzathrow: scr_player_pizzathrow(); break;
	case states.dead: scr_player_gameover(); break;
	case states.Sjumpland: scr_player_Sjumpland(); break;
	case states.freefallprep: scr_player_freefallprep(); break;
	case states.runonball: scr_player_runonball(); break;
	case states.boulder: scr_player_boulder(); break;
	case states.keyget: scr_player_keyget(); break;
	case states.tackle: scr_player_tackle(); break;
	case states.slipnslide: scr_player_slipnslide(); break;
	case states.ladder: scr_player_ladder(); break;
	case states.jump: scr_player_jump(); break;
	case states.victory: scr_player_victory(); break;
	case states.comingoutdoor: scr_player_comingoutdoor(); break;
	case states.Sjump: scr_player_Sjump(); break;
	case states.Sjumpprep: scr_player_Sjumpprep(); break;
	case states.crouch: scr_player_crouch(); break;
	case states.crouchjump: scr_player_crouchjump(); break;
	case states.crouchslide: scr_player_crouchslide(); break;
	case states.mach1: scr_player_mach1(); break;
	case states.mach2: scr_player_mach2(); break;
	case states.mach3: scr_player_mach3(); break;
	case states.machslide: scr_player_machslide(); break;
	case states.bump: scr_player_bump(); break;
	case states.hurt: scr_player_hurt(); break;
	case states.freefall: scr_player_freefall(); break;
	case states.freefallland: scr_player_freefallland(); break;
	case states.hang: scr_player_hang(); break;
	case states.door: scr_player_door(); break;
	case states.barrel: scr_player_barrel(); break;
	case states.barreljump: scr_player_barreljump(); break;
	case states.barrelslide: scr_player_barrelslide(); break;
	case states.barrelclimbwall: scr_player_barrelclimbwall(); break;
	case states.current: scr_player_current(); break;
	case states.taxi: scr_player_taxi(); break;
	case states.policetaxi: scr_player_taxi(); break;
	case states.pogo: scr_player_pogo(); break;
	case states.rideweenie: scr_player_rideweenie(); break;
	case states.motorcycle: scr_player_motorcycle(); break;
	case states.faceplant: scr_player_faceplant(); break;
	case states.ghost: scr_player_ghost(); break;
	case states.ghostpossess: scr_player_ghostpossess(); break;
	case states.mort: scr_player_mort(); break;
	case states.mortjump: scr_player_mortjump(); break;
	case states.mortattack: scr_player_mortattack(); break;
	case states.morthook: scr_player_morthook(); break;
	case states.hook: scr_player_hook(); break;
	case states.arenaintro: scr_player_arenaintro(); break;
	case states.actor: scr_player_actor(); break;
	case states.parry: scr_player_parry(); break;
	case states.golf: scr_player_golf(); break;
	case states.tube: scr_player_tube(); break;
	case states.pummel: scr_player_pummel(); break;
	case states.slipbanan: scr_player_slipbanan(); break;
	case states.bombdelete: scr_player_bombdelete(); break;
	case states.rocket: scr_player_rocket(); break;
	case states.rocketslide: scr_player_rocketslide(); break;
	case states.gotoplayer: scr_player_gotoplayer(); break;
	case states.trickjump: scr_player_trickjump(); break;
	case states.ridecow: scr_player_ridecow(); break;
	case states.ratmount: scr_player_ratmount(); break;
	case states.ratmounthurt: scr_player_ratmounthurt(); break;
	case states.ratmountjump: scr_player_ratmountjump(); break;
	case states.ratmountattack: scr_player_ratmountattack(); break;
	case states.ratmountspit: scr_player_ratmountspit(); break;
	case states.ratmountclimbwall: scr_player_ratmountclimbwall(); break;
	case states.ratmountgroundpound: scr_player_ratmountgroundpound(); break;
	case states.ratmountbounce: scr_player_ratmountbounce(); break;
	case states.noisecrusher: scr_player_noisecrusher(); break;
	case states.ratmountballoon: scr_player_ratmountballoon(); break;
	case states.ratmountgrind: scr_player_ratmountgrind(); break;
	case states.ratmounttumble: scr_player_ratmounttumble(); break;
	case states.ratmountpunch: scr_player_ratmountpunch(); break;
	case states.ratmounttrickjump: scr_player_ratmounttrickjump(); break;
	case states.ratmountskid: scr_player_ratmountskid(); break;
	case states.blockstance: scr_player_blockstance(); break;
	case states.balloon: scr_player_balloon(); break;
	case states.debugstate: scr_player_debugstate(); break;
	case states.trashjump: scr_player_trashjump(); break;
	case states.trashroll: scr_player_trashroll(); break;
	case states.stringfling: scr_player_stringfling(); break;
	case states.stringjump: scr_player_stringjump(); break;
	case states.stringfall: scr_player_stringfall(); break;
	case states.noisejetpack: scr_player_noisejetpack(); break;
	case states.spiderweb: scr_player_spiderweb(); break;
	case states.animatronic: scr_player_animatronic(); break;
	case states.playersuperattack: scr_player_playersuperattack(); break;
	case states.jetpackjump: scr_player_jetpackjump(); break;
	case states.bee: scr_player_bee(); break;
	case states.ratmountcrouch: scr_player_ratmountcrouch(); break;
	case states.ratmountladder: scr_player_ratmountladder(); break;
	case states.antigrav: scr_player_antigrav(); break;
	case states.estampede: scr_player_estampede(); break;
	case states.backtohub: scr_player_backtohub(); break;
	case states.animation: scr_player_animation(); break;
	case states.supergrab: scr_player_supergrab(); break;
	case states.machcancelstart: scr_playerN_machcancelstart(); break;
	case states.machcancel: scr_playerN_machcancel(); break;
	case states.fightball: scr_player_fightball(); break;
	
	case states.stick_flying: scr_stick_flying(); break;
	case states.stick_flyattack: scr_stick_flyattack(); break;
	case states.stick_flycancel: scr_stick_flycancel(); break;
	case states.stick_superjump: scr_stick_superjump(); break;
	
	// pto
	case states.debugfly: scr_player_debugstate(); break;
	case states.frozen: scr_player_frozen(); break;
	case states.swimming: scr_player_swimming(); break;
}

scr_modding_hook("player/poststate");

// ceiling run continued
if ceilingrun && ((state != states.mach2 && state != states.mach3) or !grounded) && state != states.climbwall && state != states.chainsaw && state != states.backbreaker && state != states.debugstate
{
	ceilingrun = false;
	flip = gravityjump ? -1 : 1;
	vsp *= -1;
	yscale *= -1;
	
	if !MOD.GravityJump
		gravityangle += 170;
}

#region noise shit

if (instance_exists(obj_swapmodeeffect))
	exit;
if state != states.backbreaker
	swap_taunt = false;
if (sprite_index == spr_playerN_phase3intro2 || sprite_index == spr_playerN_phase3intro3 || instance_exists(obj_pizzaface_thunderdark))
{
	if (character == "N" || global.swapmode)
	{
		supernoisetimer += 20;
		supernoisefade = Wave(0, 0.8, supernoisefademax, 0.1, supernoisetimer);
		if character != "N" && !obj_swapmodefollow.visible
		{
			with obj_explosioneffect
			{
				if sprite_index == spr_supernoise_effect
					instance_destroy();
			}
		}
		if supernoisefx > 0
			supernoisefx--;
		else
		{
			supernoisefx = 10;
			var xx = x;
			var yy = y;
			if character != "N"
			{
				xx = obj_swapmodefollow.x;
				yy = obj_swapmodefollow.y;
			}
			if (character == "N" || (obj_swapmodefollow.visible && obj_swapmodefollow.image_alpha > 0))
			{
				with (instance_create(xx + irandom_range(-30, 30), yy + irandom_range(0, 15), obj_explosioneffect))
				{
					sprite_index = spr_supernoise_effect;
					xoffset = x - xx;
					yoffset = y - yy;
					playerid = other.id;
					if other.character != "N"
						playerid = obj_swapmodefollow.id;
					image_speed = 0.35;
					depth = choose(-6, -12);
				}
			}
		}
	}
}
if (CHAR_BASENOISE && state != states.chainsaw && prevstate == states.machcancel && sprite_index != spr_playerN_divebomb && sprite_index != spr_playerN_divebombfall && sprite_index != spr_playerN_divebombland && (prevsprite == spr_playerN_divebomb || prevsprite == spr_playerN_divebombfall || prevsprite == spr_playerN_divebombland))
	notification_push(notifs.cancel_noisedrill, []);
if (character == "N" && ignore_grind && !place_meeting(x, y + vsp, obj_grindrail) && !place_meeting(x, y, obj_grindrail))
	ignore_grind = false;
if ghostdashcooldown > 0
	ghostdashcooldown--;
if state != states.machcancel && state != states.mach3
	noisemachcancelbuffer = 0;
if noisemachcancelbuffer > 0
	noisemachcancelbuffer--;

#endregion

if (state != states.chainsaw)
{
	if (!bodyslam_notif)
	{
		if (state == states.freefall)
		{
			bodyslam_notif = true;
			notification_push(notifs.bodyslam_start, [room]);
		}
	}
	else if (state != states.freefall)
	{
		bodyslam_notif = false;
		notification_push(notifs.bodyslam_end, [room]);
	}
}
if (state != states.crouchjump && state != states.crouch)
    uncrouch = 0;
else if (state == states.crouch && uncrouch > 0)
    uncrouch--;
if (state == states.Sjump || (state == states.chainsaw && tauntstoredstate == states.Sjump))
	sjumptimer++;
else if (sjumptimer > 0)
{
	notification_push(notifs.superjump_timer, [sjumptimer, room]);
	sjumptimer = 0;
}
if (invtime > 0)
	invtime--;
if (sprite_index == spr_noise_phasetrans1P && image_index > 24)
{
	if (!noisebossscream)
	{
		sound_play_3d(global.snd_screamboss, x, y);
		sound_play_3d("event:/sfx/voice/noisescream", obj_noiseboss.x, obj_noiseboss.y);
		noisebossscream = true;
	}
}
else if (sprite_index != spr_noise_phasetrans1P)
	noisebossscream = false;

if (character == "N")
{
	if (room == boss_pepperman || room == boss_vigilante || room == boss_noise || room == boss_fakepep || room == boss_pizzaface)
		global.pistol = true;
	else
		global.pistol = false;
}
if (global.pistol && character != "N" && state != states.animation && state != states.grab && state != states.superslam && state != states.actor && state != states.hurt && state != states.bump && state != states.machslide && state != states.Sjumpprep && state != states.Sjump && state != states.tumble && !instance_exists(obj_vigilante_duelintro))
{
	if ((global.shootbutton == 1 ? key_shoot : key_slap) or pistolchargeshooting)
		pistolcharge += 0.5;
	else
	{
		pistolcharge = 0;
		pistolchargeshot = 1;
	}
	if (pistolcharge > 0)
	{
		var ixa = [6, 14, 22, 30, 38];
		var _sound = false;
		for (var i = 0; i < array_length(ixa); i++)
		{
			if (floor(pistolcharge) == ixa[i])
				_sound = true;
		}
		if (_sound && !pistolchargesound)
		{
			pistolchargesound = true;
			sound_play_3d("event:/sfx/pep/revolvercharge", x, y);
		}
		else if (!_sound)
			pistolchargesound = false;
	}
	if (floor(pistolcharge) >= (sprite_get_number(spr_revolvercharge) - 1))
		pistolcharge = sprite_get_number(spr_revolvercharge) - 1;
	if (floor(pistolcharge) >= (sprite_get_number(spr_revolvercharge) - 16) && !pistolchargeshooting)
	{
		pistolchargeshooting = true;
		pistolchargeshot = 1;
	}
	if (pistolchargeshot > 0 && pistolchargeshooting)
	{
		if (state != states.backbreaker && state != states.chainsaw)
		{
			scr_pistolshoot(states.normal, true);
			pistolchargedelay = 5;
			pistolchargeshot--;
		}
	}
	else if (pistolchargeshot <= 0 && pistolchargeshooting)
	{
		pistolcharge = 0;
		pistolchargedelay = 5;
		pistolchargeshooting = false;
		pistolchargeshot = 1;
		if (global.shootbutton == 1 ? key_shoot : key_slap)
			pistolcharge = 4;
	}
}
else if (state == states.hurt || state == states.bump || state == states.Sjumpprep || state = states.Sjump || instance_exists(obj_vigilante_duelintro))
{
	pistolcharge = 0;
	pistolcharged = false;
	pistolchargeshooting = false;
	pistolchargeshot = 1;
}
if state != states.pistol && state != states.normal && sprite_index != spr_player_pistoljump2
	pistol = false;
if (pistolanim != noone)
{
	pistolindex += 0.35;
	if (floor(pistolindex) == (sprite_get_number(pistolanim) - 1))
	{
		pistolanim = noone;
		pistolindex = 0;
	}
}
if (pistolcooldown > 0)
	pistolcooldown--;
if (prevstate != state && state != states.chainsaw)
{
	if (prevstate == states.trashroll && prevsprite != spr_playercorpsestart && prevsprite != spr_playercorpsesurf)
		create_debris(x, y, spr_player_trashlid);
	if (prevstate == states.slipnslide && character == "N" && instance_exists(obj_surfback))
	{
		with (instance_create(x, y, obj_playernoisedebris))
			sprite_index = spr_surfback;
	}
	if (prevstate == states.ghost)
		instance_create(x, y, obj_ghostdrapes);
	if (room == tower_3 && state == states.backbreaker && place_meeting(x, y, obj_bossdoor))
	{
		resetdoisecount++;
		if (resetdoisecount >= 3)
		{
			if !global.resetdoise && REMIX && character == "N"
			{
				var _dead = false;
				ini_open_from_string(obj_savesystem.ini_str);
				_dead = ini_read_real("w3stick", "bosskey", false) || ini_read_real("Hats", "b_noise", 0) > 0;
				ini_close();
				
				if _dead
				{
					shake_camera(2, 0.05);
					call_later(0.3, time_source_units_seconds, function()
					{
						if instance_exists(obj_player)
						{
							with instance_create(0, 0, obj_flash)
								fadealpha = 2;
							shake_camera(8, 5 / room_speed);
							create_transformation_tip(lstr("revive_doise"), noone, true);
						}
					});
					sound_play("event:/modded/sfx/doise");
					
					instance_destroy(obj_costumednoise);
					with obj_bossdoor
						msg = "";
				}
			}
			global.resetdoise = true;
		}
	}
}
if (!place_meeting(x, y + 1, obj_railparent))
{
	if (state == states.mach3 || state == states.mach2 || state == states.tumble)
		railmovespeed = Approach(railmovespeed, 0, 0.1);
	else
		railmovespeed = Approach(railmovespeed, 0, 0.5);
}
if (state != states.handstandjump && state != states.tumble)
	crouchslipbuffer = 0;
if (state != states.mach3 && (state != states.chainsaw || tauntstoredstate != states.mach3))
	mach4mode = false;
if (ratshootbuffer > 0)
	ratshootbuffer--;
if (state != states.animatronic)
{
	animatronic_buffer = 180;
	animatronic_collect_buffer = 0;
}
if (state == states.boxxedpep && grounded && vsp > 0)
	boxxedpepjump = boxxedpepjumpmax;
if (verticalbuffer > 0)
	verticalbuffer--;
if (superchargecombo_buffer > 0)
	superchargecombo_buffer--;
else if (superchargecombo_buffer == 0)
{
	superchargecombo_buffer = -1;
	global.combotime = 4;
}
if (state != states.normal)
	breakdance_speed = 0.25;
if (holycross > 0)
	holycross--;
if (global.noisejetpack && (character != "N" || noisepizzapepper))
{
	if (jetpackeffect > 0)
		jetpackeffect--;
	else
	{
		jetpackeffect = 100;
		repeat (10)
			instance_create(x, y, obj_firemouthflame);
	}
}
if ((state == states.jump || state == states.normal || state == states.machcancel || state == states.mach2 || state == states.mach3 || state == states.trickjump) && global.noisejetpack == true)
{
	if ((!can_jump && key_jump) || (grounded && key_jump && key_up))
	{
		fmod_event_instance_play(pizzapeppersnd);
		scr_fmod_soundeffect(jumpsnd, x, y);
		fmod_event_instance_set_parameter(pizzapeppersnd, "state", 0, true);
		if (key_down)
			vsp = 0;
		else
			vsp = -11;
		if (move != 0)
		{
			if (state != states.machcancel)
			{
				if (movespeed < 10)
					movespeed = 10;
			}
			else
			{
				if (movespeed != 0)
					xscale = sign(movespeed);
				movespeed = abs(movespeed);
				if (abs(movespeed) < 10)
					movespeed = 10;
			}
		}
		with (instance_create(x, y, obj_highjumpcloud2))
			sprite_index = spr_player_firemouthjumpdust;
		scr_do_pepperpizzajump();
	}
}
if (walljumpbuffer > 0)
	walljumpbuffer--;
if (grounded && vsp > 0 && state != states.noisejetpack)
	jetpackfuel = jetpackmax;
if (tauntstoredisgustavo)
{
	isgustavo = true;
	if (state != states.backbreaker && state != states.parry && state != states.graffiti)
		tauntstoredisgustavo = false;
}
if (state != states.mach3 && (state != states.machslide || sprite_index != spr_mach3boost))
{
	launch = false;
	launched = false;
	launch_buffer = 0;
}
if (launch_buffer > 0)
	launch_buffer--;
else
	launched = false;
if (state != states.finishingblow)
	finishingblow = false;
if (dash_doubletap > 0)
	dash_doubletap--;
if (cow_buffer > 0)
	cow_buffer--;
if (state == states.lungeattack)
	lunge_buffer = 14;

scr_player_blurafterimage();

if (state != states.chainsaw && state != states.bump && state != states.boxxedpep && state != states.boxxedpepspin && state != states.boxxedpepjump)
{
	boxxed = false;
	boxxeddash = false;
}
if (state != states.grab)
	grabbingenemy = false;
if (state != states.mach2 && state != states.mach3 && state != states.trickjump && state != states.ratmounttumble && state != states.ratmounttrickjump)
{
	ramp = false;
	ramp_points = false;
}
if (state != states.door && state != states.chainsaw && state != states.hit && place_meeting(x, y, obj_boxofpizza))
{
	state = states.crouch;
	if isgustavo
		state = states.ratmountcrouch;
	if character == "S"
		state = states.normal;
}
if (shoot_buffer > 0)
	shoot_buffer--;
if (cheesepep_buffer > 0)
	cheesepep_buffer--;
if (invhurt_buffer > 0)
	invhurt_buffer--;
if (state == states.hurt)
{
	if (hurt_buffer > 0)
		hurt_buffer--;
	else
	{
		invhurt_buffer = invhurt_max;
		hurt_buffer = -1;
	}
}
else
{
	if (hurt_buffer > 0)
		invhurt_buffer = invhurt_max;
	hurt_buffer = -1;
}
if ((room == Realtitlescreen && instance_exists(obj_mainmenuselect)) || room == Mainmenu || room == Longintro || room == Endingroom || room == Creditsroom || room == Johnresurrectionroom)
	state = states.titlescreen;
if (wallclingcooldown < 10)
	wallclingcooldown++;
if (boxxedspinbuffer > 0)
	boxxedspinbuffer--;
if (supercharged && (collision_flags & colflag.secret) == 0)
{
	if (superchargebuffer > 0)
		superchargebuffer--;
	else if (state == states.normal || state == states.jump || state == states.mach1 || state == states.noisecrusher || state == states.mach2 || state == states.mach3 || state == states.ratmount || state == states.ratmountjump || state == states.ratmountbounce || state == states.ratmountskid)
	{
		superchargebuffer = 4;
		with (instance_create(x + irandom_range(-25, 25), y + irandom_range(-10, 35) * flip, obj_superchargeeffect))
		{
			playerid = other.id;
			image_yscale = other.yscale;
		}
	}
}
if (state != states.Sjump)
	sjumpvsp = -12;
if (state != states.freefall)
	freefallvsp = 15;
if (supercharge > 9 && state != states.backbreaker)
{
	if (!supercharged)
	{
		ini_open_from_string(obj_savesystem.ini_str);
		if (ini_read_real("Game", "supertaunt", false) == 0)
			create_transformation_tip(lang_get_value("supertaunttip"));
		ini_close();
		sound_play("event:/sfx/pep/gotsupertaunt");
	}
	supercharged = true;
}
if (!instance_exists(pizzashieldid) && pizzashield == 1)
{
	with (instance_create(x, y, obj_pizzashield))
	{
		playerid = other.object_index;
		other.pizzashieldid = id;
	}
}
if (visible == 0 && state == states.comingoutdoor)
{
	coopdelay++;
	image_index = 0;
	if (coopdelay == 50)
	{
		visible = true;
		coopdelay = 0;
	}
}
if (global.coop == 1)
{
	if ((state == states.punch || state == states.handstandjump) && !(obj_player2.state == states.punch || obj_player2.state == states.handstandjump))
		fightballadvantage = true;
	else if (!(obj_player2.state == states.punch || obj_player2.state == states.handstandjump))
		fightballadvantage = false;
}
if (state != states.pogo && state != states.backbreaker)
{
	pogospeed = 6;
	pogospeedprev = false;
}
scr_playersounds();
if (grounded)
	doublejump = false;
if (pogochargeactive == 1)
{
	if (flashflicker == 0)
	{
		if (pogochargeactive == 1 && sprite_index == spr_playerN_pogofall)
			sprite_index = spr_playerN_pogofallmach;
		if (pogochargeactive == 1 && sprite_index == spr_playerN_pogobounce)
			sprite_index = spr_playerN_pogobouncemach;
	}
	flashflicker = true;
	pogocharge--;
}
else
	flashflicker = false;
if (state != states.throwing)
	kickbomb = false;
if (pogocharge == 0)
{
	pogochargeactive = false;
	pogocharge = 100;
}
if (flashflicker == 1)
{
	flashflickertime++;
	if (flashflickertime == 20)
	{
		flash = true;
		flashflickertime = 0;
	}
}
if (state != states.mach3 && state != states.grabbed)
	fightball = false;
if (state != states.grabbed && state != states.hurt)
{
	if (grounded && state != states.grabbing)
	{
		suplexmove = false;
		suplexmove2 = false;
	}
}
if state != states.freefall && state != states.superslam && (state != states.chainsaw || (tauntstoredstate != states.freefall && tauntstoredstate != states.superslam)) && (state != states.backbreaker || (tauntstoredstate != states.freefall && tauntstoredstate != states.superslam))
&& !instance_exists(obj_secretportalstart)
	freefallsmash = IT_final_freefall() ? -14 : 0;
if (global.playerhealth <= 0 && state != states.dead)
{
	image_index = 0;
	sprite_index = spr_playerV_dead;
	state = states.dead;
}
if ((state == states.dead && y > (room_height * 2) && !instance_exists(obj_backtohub_fadeout))
or (instance_exists(obj_timesup) && obj_timesup.alarm[1] == 0))
&& !(instance_exists(obj_timesup) && obj_timesup.do_wait)
{
	targetDoor = "HUB";
	scr_playerreset();
	
	scr_save_attempts();
	
	image_index = 0;
	image_blend = c_white;
	visible = true;
	
	x = -1000;
	y = -1000;
	
	if instance_exists(obj_cyop_loader)
	{
		if (global.cyop_is_hub or global.cyop_hub_level == "")
		{
			instance_destroy(obj_cyop_loader);
			scr_room_goto(editor_entrance);
			exit;
		}
		else
			cyop_load_level_internal(global.cyop_hub_level, true);
	}
	
	instance_create(0, 0, obj_backtohub_fadeout);
	global.leveltorestart = noone;
	global.leveltosave = noone;
	global.startgate = false;
}
if (baddiegrabbedID == obj_null && (state == states.grab || state == states.superslam || state == states.tacklecharge))
	state = states.normal;
if (cutscene == 1 && state != states.gotoplayer)
	global.heattime = 60;
if (anger == 0)
	angry = false;
if (anger > 0)
{
	angry = true;
	anger -= 1;
}
if (sprite_index == spr_winding && state != states.normal)
	windingAnim = 0;
if (state != states.grab)
	swingdingbuffer = 0;

// gravities
if (state == states.antigrav || state == states.rocket || state == states.rocketslide)
	grav = 0;
else if (state == states.barrel)
	grav = 0.6;
else if (state == states.ghost || state == states.ghostpossess)
	grav = 0;
else if (boxxed)
	grav = 0.3;
else if (sprite_index == spr_jetpackstart2)
	grav = 0.4;
else if (state == states.boxxedpepspin)
	grav = 0.6;
else if (state == states.swimming)
	grav = 0;
else if state == states.stick_flyattack or state == states.stick_flying or state == states.stick_superjump
	grav = 0;
else
	grav = 0.5;
if (state == states.barrel && key_jump2 && !jumpstop)
	grav = 0.4;

if (sprite_index == spr_player_idlevomit && image_index > 28 && image_index < 43)
	instance_create(x + random_range(-5, 5), y + 46, obj_vomit);
if (sprite_index == spr_player_idlevomitblood && image_index > 28 && image_index < 43)
{
	with (instance_create(x + random_range(-5, 5), y + 46, obj_vomit))
		sprite_index = spr_vomit2;
}
if (global.combo >= 25 && !instance_exists(angryeffectid) && sprite_index != spr_catched && state == states.normal && character != "V")
{
	with (instance_create(x, y, obj_angrycloud))
	{
		playerid = other.object_index;
		other.angryeffectid = id;
	}
}
if (object_index == obj_player1)
{
	if (global.combotimepause > 0)
		global.combotimepause--;
	if (global.combo != global.previouscombo && !is_bossroom())
	{
		if (global.combo > global.highest_combo)
			global.highest_combo = global.combo;
		global.previouscombo = global.combo;
		if (global.combo % 5 == 0 && global.combo != 0)
		{
			instance_destroy(obj_combotitle);
			with (instance_create(x, y - 80, obj_combotitle))
			{
				title = floor(global.combo / 5);
				event_perform(ev_step, ev_step_normal);
			}
		}
	}
	if !scr_combo_freeze(self)
	{
		if global.heattime > 0
			global.heattime -= scr_heat_drain(self);
		if global.combotime > 0
			global.combotime -= scr_combo_drain(self);
	}
	if (global.combotime <= 0 && global.combo >= 1)
	{
		if (global.combo >= 1)
			sound_play("event:/sfx/misc/kashingcombo");
		global.savedcombo = global.combo;
		global.combotime = 0;
		global.combo = 0;
		with (obj_camera)
		{
			if (comboend)
			{
				comboend = false;
				event_perform(ev_alarm, 4);
			}
		}
		supercharge = 0;
	}
	if (global.heattime <= 0 && global.style > -1 && global.stylelock == 0)
		global.style -= heat_lossdrop;
	
	// bullet and chainsaw
	global.bullet = Approach(global.bullet, MAX_BULLETS, 0.003);
	global.fuel = Approach(global.fuel, MAX_FUEL, 0.004);
	
	if string_copy(room_get_name(room), 1, 5) == "tower" && !global.panic
	{
		global.bullet = MAX_BULLETS;
		global.fuel = MAX_FUEL;
	}
}
if (key_jump && !grounded && (state == states.mach2 || state == states.mach3) && (state != (states.climbwall & walljumpbuffer)) <= 0)
	input_buffer_walljump = 24;

//
if (boxxeddashbuffer > 0)
	boxxeddashbuffer--;
if (coyote_time > 0)
	coyote_time--;
if (input_buffer_jump > 0)
	input_buffer_jump--;
if (input_taunt_p2 > 0)
	input_taunt_p2--;
if (input_buffer_down > 0)
	input_buffer_down--;
if (input_buffer_mach > 0)
	input_buffer_mach--;
if (input_buffer_jump_negative > 0)
	input_buffer_jump_negative--;
if (input_buffer_secondjump < 8)
	input_buffer_secondjump++;
if (input_buffer_highjump < 8)
	input_buffer_highjump++;
if (input_attack_buffer > 0)
	input_attack_buffer--;
if (input_buffer_shoot > 0)
	input_buffer_shoot--;
if (input_finisher_buffer > 0)
	input_finisher_buffer--;
if (input_up_buffer > 0)
	input_up_buffer--;
if (input_down_buffer > 0)
	input_down_buffer--;
if (input_buffer_walljump > 0)
	input_buffer_walljump--;
if (input_buffer_slap > 0)
	input_buffer_slap--;
if (input_buffer_grab > 0)
	input_buffer_grab--;
if (input_buffer_pistol > 0)
	input_buffer_pistol--;

//
if (key_particles == 1)
	create_particle(x + random_range(-25, 25), y + random_range(-35, 25), part.keyparticles, 0);
if (state != states.ratmount && state != states.ratmountjump && state != states.chainsaw)
{
	gustavodash = 0;
	ratmount_movespeed = 8;
}
if (inv_frames == 0 && hurted == 0 && state != states.ghost)
	image_alpha = 1;
if ((state == states.removed_state && sprite_index == spr_player_skatespin) || state == states.punch || (state == states.jump && sprite_index == spr_playerN_noisebombspinjump) || state == states.tacklecharge || state == states.skateboard || state == states.knightpep || state == states.cheesepep || state == states.knightpepslopes || state == states.knightpepattack || state == states.bombpep || state == states.facestomp || state == states.machfreefall || state == states.facestomp || state == states.mach3 || state == states.freefall || state == states.Sjump)
	attacking = true;
else
	attacking = false;
if (state == states.throwing || state == states.backkick || state == states.shoulder || state == states.uppunch)
	grabbing = true;
else
	grabbing = false;

instakillmove = scr_instakillcheck();

if ((global.noisejetpack || holycross > 0) && (state == states.actor || state == states.chainsaw || state == states.backbreaker || state == states.gotoplayer || state == states.animation || state == states.arenaintro || state == states.teleport || state == states.Sjumpland))
	instakillmove = false;
if (state == states.chainsaw || state == states.backbreaker)
	instakillmove = false;

if ((state == states.ratmountbounce || state == states.noisecrusher) && vsp < 0)
	stunmove = true;
else
	stunmove = false;
if (flash == 1 && alarm[0] <= 0)
	alarm[0] = 0.15 * room_speed;
if (state != states.ladder && state != states.ratmountladder)
	hooked = false;
if (state != states.mach3 && state != states.machslide)
	autodash = false;
if ((state != states.jump && state != states.crouchjump && state != states.slap) || vsp < 0)
	fallinganimation = 0;
if (state != states.freefallland && state != states.normal && state != states.machslide && state != states.jump)
	facehurt = false;
if (state != states.normal && state != states.machslide)
	machslideAnim = false;
if (state != states.normal && state != states.ratmount)
{
	idle = 0;
	dashdust = false;
}
if (state != states.mach1 && state != states.cheesepepjump && state != states.jump && state != states.hookshot && state != states.handstandjump && state != states.normal && state != states.mach2 && state != states.mach3 && state != states.freefallprep && state != states.knightpep && state != states.shotgun && state != states.knightpepslopes)
	momemtum = false;
if (state != states.Sjump && state != states.Sjumpprep)
	a = 0;
if (state != states.facestomp)
	facestompAnim = false;
if (state != states.freefall && state != states.facestomp && state != states.superslam && state != states.freefallland)
	superslam = 0;
if (state != states.mach2)
	machpunchAnim = false;
if (ladderbuffer > 0)
	ladderbuffer--;
if (state != states.jump)
	stompAnim = false;

scr_player_mach3effect();

if (!isgustavo)
	gusdashpadbuffer = 0;
else if (gusdashpadbuffer > 0)
	gusdashpadbuffer--;

if (restartbuffer > 0)
	restartbuffer--;
if ((y > room_height + 300 || y < -800) && (roomstarty < room_height + 200 && roomstarty > -700) && !place_meeting(x, y, obj_verticalhallway) && restartbuffer <= 0 && !verticalhallway && room != custom_lvl_room && state != states.dead && state != states.gotoplayer && !global.levelreset && room != boss_pizzaface && room != tower_outside && room != boss_pizzafacefinale && !instance_exists(obj_backtohub_fadeout) && state != states.backtohub)
	respawn_player();
if (character == "S")
{
	if (state == states.crouchjump || state == states.crouch)
		state = states.normal;
}
if (character != "M")
{
	if !scr_solid_player(x, y)
	{
		if (state != states.ratmountcrouch && state != states.boxxedpepjump && state != states.boxxedpepspin && !(state == states.bump && sprite_index == spr_tumbleend) && (state != states.barrelslide && state != states.barrelclimbwall) && sprite_index != spr_player_breakdancesuper && sprite_index != spr_barrelslipnslide && sprite_index != spr_barrelroll && sprite_index != spr_bombpepintro && sprite_index != spr_knightpepthunder && state != states.stunned && state != states.crouch && state != states.shotguncrouch && state != states.shotguncrouchjump && state != states.boxxedpep && (state != states.pistol && sprite_index != spr_player_crouchshoot) && state != states.Sjumpprep && state != states.crouchslide && state != states.chainsaw && (state != states.machroll or character == "S") && state != states.hurt && state != states.crouchjump && state != states.cheesepepstickup && state != states.cheesepepstickside && state != states.tumble
		&& sprite_index != spr_playerN_jetpackslide && state != states.removed_state && sprite_index != spr_pizzano_crouchslide && sprite_index != spr_breakdancesuper)
			mask_index = spr_player_mask;
		else
			mask_index = spr_crouchmask;
	}
	else
		mask_index = spr_crouchmask;
}
else
	mask_index = spr_pepperman_mask;
if (state == states.gottreasure || sprite_index == spr_knightpepstart || sprite_index == spr_knightpepthunder || state == states.keyget || state == states.chainsaw || state == states.door || state == states.ejected || state == states.victory || state == states.comingoutdoor || state == states.dead || state == states.gotoplayer || state == states.policetaxi || state == states.actor || (collision_flags & colflag.secret) > 0)
or (sprite_index == spr_firemouthintro && REMIX)
	cutscene = true;
else
	cutscene = false;
if ((state == states.normal || state == states.ratmount) && spotlight && !instance_exists(obj_uparrow) && (collision_flags & colflag.grounded) > 0)
{
	if (place_meeting(x, y, obj_uparrowhitbox))
	{
		with (instance_create(x, y, obj_uparrow))
			playerid = other.object_index;
	}
}

scr_player_speedlines();

var mask = mask_index;
if (character == "S" && !isgustavo) or (character == "V" && isgustavo)
	mask_index = spr_crouchmask;

scr_collide_destructibles();

if state != -1 && state != states.backtohub && state != states.ghostpossess && state != states.gotoplayer && state != states.debugstate && state != states.titlescreen && state != states.tube && state != states.grabbed && state != states.door && state != states.ejected && state != states.comingoutdoor && state != states.boulder && state != states.keyget && state != states.victory && state != states.portal && state != states.timesup && state != states.gottreasure && state != states.dead
	scr_collide_player();
mask_index = mask;

if state == states.tube || state == states.gotoplayer || state == states.debugstate
{
	x += hsp;
	y += vsp;
}
if state == states.boulder
	scr_collide_player();	

scr_collide_destructibles();

with obj_ratblock
	scr_ratblock_destroy();

if state != states.comingoutdoor && state != states.frozen
	image_blend = c_white;

prevstate = state;
prevsprite = sprite_index;
if (distance_to_object(obj_spike) < 500)
{
	var dirs = [[0, 1], [0, -1], [1, 0], [-1, 0]];
	for(var i = 0; i < array_length(dirs); i++)
	{
		var b = dirs[i];
		with (instance_place(x + b[0], y + b[1], obj_spike))
		{
			if (other.state != states.barrel)
			{
				var h = other.hurted;
				scr_hurtplayer(other);
				if (fake)
					instance_destroy();
				if (h != other.hurted && other.hurted)
					sound_play_3d("event:/sfx/enemies/pizzardelectricity", x, y);
			}
			else
			{
				with (other)
				{
					state = states.bump;
					sprite_index = spr_bump;
					image_index = 0;
					hsp = -6 * xscale;
					vsp = -4;
					sound_play_3d("event:/sfx/knight/lose", x, y);
					repeat (3)
						create_debris(x, y, spr_wooddebris);
				}
			}
		}
	}
}

if REMIX
{
	if hurted && scr_transformationcheck() && state != states.chainsaw && state != states.slipbanan && state != states.rocketslide
	{
		if alarm[5] == -1 && alarm[6] == -1
			alarm[5] = 2;
	}
	else if !hurted
		alarm[5] = -1;
}

// pto extra
if smoothx != 0
	xscale = -sign(smoothx);
smoothx = Approach(smoothx, 0, 4);

if finisher_hits == 5 && !finisher
{
	with instance_create(x, y, obj_finishereffect)
		playerid = other.id;
	finisher = true;
	instance_create(x, y, obj_tauntaftereffectspawner);
}
if state != states.lungeattack && state != states.chainsaw
{
	finisher_hits = 0;
	finisher = false;
	lunge_hits = 0;
	hit_connected = false;
}

if state != states.mach3 && state != states.Sjump && state != states.Sjumpprep && state != states.chainsaw && state != states.backbreaker
	jetpackcancel = false;
if CHAR_POGONOISE
	jetpackcancel = true;

if room != rank_room && room != timesuproom
{
	if hat != -1 && !instance_exists(obj_cowboyhat)
	{
		with instance_create(x, y, obj_cowboyhat, {hat: hat})
			playerid = other.id;
	}
	if pet != pet_prev or (pet != -1 && !instance_exists(petID))
	{
		instance_destroy(petID);
		if pet != -1
			petID = instance_create_depth(x, y, depth + 1, obj_petfollow, {pet: pet});
		pet_prev = pet;
	}
}
if grounded && state != states.Sjump && state != states.Sjumpprep
	superjumped = false;

if grounded && state != states.swimming
{
	burning = 0;
	vigi_uppercut_nerf = 0;
}
else if burning && !instance_exists(burneffectID)
	burneffectID = instance_create(x, y, obj_burneffect, {player: id});

if state != states.tumble
{
	do_vigislide = true;
	vigi_slide_buffer = 0;
}
else if vigi_slide_buffer > 0
	vigi_slide_buffer--;

if !attackstyletip && state == states.normal && !cutscene && global.attackstyle != MOD_MOVES.grab
{
	attackstyletip = true;
	var tiptext = lstr("attackstyletip");
	tiptext = embed_value_string(tiptext, [global.swapgrab ? "C" : "G", lstr(concat("attackstyle", real(global.attackstyle))), global.swapgrab ? "G" : "C"]);
	create_transformation_tip(tiptext, "attackstyle", false, true);
}

if character == "V" && state == states.rocket && (x < -300 or x > room_width + 300)
	respawn_player();

// good mode activation
/*
if room != Longintro && room != Realtitlescreen && room != Mainmenu && room != hub_loadingscreen && room != characterselect && room != Finalintro && !global.goodmode
{
	show_message("Get fucked loser\nEnabling GOOD MODE");
	global.goodmode = true;
	global.experimental = false;
	obj_persistent.multiplier = 0;
}
*/
