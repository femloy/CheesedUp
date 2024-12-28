#macro IT_FINAL (global.iteration == ITERATIONS.FINAL)
#macro IT_APRIL (global.iteration == ITERATIONS.APRIL)
#macro IT_BNF (global.iteration == ITERATIONS.BNF)

enum ITERATIONS
{
	FINAL,
	APRIL,
	BNF
}

function IT_crouchslide_jumpdive()
{
	// Allows mario sunshine diving in old crouchslide state
	return !IT_APRIL;
}
function IT_old_grab_bump()
{
	// Old bump when hitting a wall while grabbing
	return !IT_FINAL && !IT_APRIL;
}
function IT_grab_animation_skip()
{
	// Grab animation was shorter in certain builds
	//	returns [threshold, skip]
	//	if image_index >= threshold
	//		image_index += skip;
	if IT_APRIL
		return [6, 4];
	if IT_BNF
		return [8, 2];
	return undefined;
}
function IT_ledge_bump()
{
	// Clip up 1 tile tall solids instead of bumping
	return !IT_BNF;
}
function IT_mach3_climbwall_speed()
{
	// Mach 3 wallspeed is 10 always pre-april
	if IT_BNF
		return 10;
	return max(movespeed, 1);
}
function IT_grab_mach3effect()
{
	// Grab had red and green afterimages
	return IT_BNF;
}
function IT_blur_afterimage()
{
	// Whether non-colored fading afterimages appear
	return IT_FINAL;
}
function IT_machpunchanim()
{
	// Punching blocks on mach 2
	return IT_BNF;
}
function IT_punch_big_breakables()
{
	// Grabbing on a big destroyable punches it
	return !IT_FINAL;
}
function IT_mach4accel()
{
	// Mach 4 accelerates really quickly in final game
	return IT_FINAL ? 0.4 : 0.1;
}
function IT_slope_momentum()
{
	// Slopes accelerate you faster on mach states
	return IT_FINAL;
}
function IT_old_machroll()
{
	// Rolling and grab sliding used to have its own state, rather than using states.tumble
	return !IT_FINAL;
}
function IT_mach_grab()
{
	// Couldn't grab during a mach state until eggplant
	return IT_FINAL;
}
function IT_grab_cancel()
{
	// Whether to play the grab cancel animation
	return !IT_BNF;
}
function IT_static_finishingblow()
{
	// Whether to freeze the player in the finishing blow state
	return !IT_FINAL;
}
function IT_longer_finishingblow()
{
	// Finishing blow animation was 2 frames longer
	return IT_BNF;
}
function IT_mach2_imagespeed()
{
	// Animation speed for mach 2 state used to be constant
	if IT_BNF
		return 0.65;
	return abs(movespeed) / 15;
}
function IT_final_sounds()
{
	// Play final game sounds like Peppino's voice
	return IT_FINAL;
}
function IT_longjump()
{
	// Long jump on grab jump
	return IT_FINAL;
}
function IT_grabjump_mach2()
{
	// Grab jumping puts you in mach 2 state
	return !IT_BNF;
}
function IT_grab_climbwall()
{
	// Climb wall from grab
	return IT_FINAL;
}
function IT_walkspeed()
{
	// They sped him up
	return IT_FINAL ? 8 : 6;
}
function IT_suplexspeed()
{
	// They slowed him down
	if state != states.jump
		return IT_FINAL ? 8 : 10;
	else
		return IT_FINAL ? 5 : 6;
}
function IT_taunt_breakdance()
{
	// Allow player to breakdance using the taunt key
	return IT_FINAL;
}
function IT_allow_uppercut()
{
	// Uppercutting was implemented in the april build
	return IT_FINAL or (IT_APRIL && grounded);
}
function IT_mach1_state()
{
	// Old mach 1 state
	return !IT_FINAL;
}
function IT_Sjumpprep_speed()
{
	// April build was a little retarded
	return IT_APRIL ? 1 : 2;
}
function IT_old_ball_transfo()
{
	// Faster and uncontrollable
	return !IT_FINAL;
}
function IT_Sjump_mach3_cancel()
{
	// Cancel into the mach 3 state
	return !IT_FINAL;
}
function IT_heat_nerf()
{
	// Final game is way faster so, gain less heat and lose it faster
	return IT_FINAL;
}
function IT_pummel_speed()
{
	// Movespeed
	return IT_FINAL ? 4 : 3;
}
function IT_old_tackle()
{
	// Stops on animation end, instead of on land
	return !IT_FINAL;
}
function IT_final_freefall()
{
	// Affects superslam. Way faster ground pound
	return IT_FINAL;
}
function IT_updated_noise()
{
	// Update The Noise to The Noise Update Noise
	return IT_FINAL;
}
function IT_blue_afterimage()
{
	// The mach afterimages replacing old blue afterimages on uppercut and such
	return IT_FINAL or global.afterimage == AFTERIMAGES.blue;
}
function IT_wallsplat()
{
	// Splat on a wall on mach 2 and machslide states
	return IT_FINAL;
}
function IT_machslidefall()
{
	// Hang on mach slide state when falling
	return IT_FINAL;
}
function IT_mach3_mach4speed()
{
	// Max speed for mach 3 state
	return IT_FINAL ? 20 : 24;
}
function IT_mach3_mach3speed()
{
	// Minimum speed where mach 3 becomes mach 4
	return IT_FINAL ? 16 : 20;
}
function IT_mach3_accel()
{
	// Acceleration speed for mach 3 state
	return IT_FINAL ? 0.025 : 0.1;
}
function IT_april_particles()
{
	// Crazy run effect and flames and such
	return IT_APRIL;
}
function IT_mach3_old_acceleration()
{
	// Accelerate mid-air and deccelerate when not holding forward
	return !IT_FINAL;
}
function IT_ladder_up_speed()
{
	// Ladder speed used to be horrible
	return IT_FINAL ? -6 : -2;
}
function IT_ladder_down_speed()
{
	return IT_FINAL ? 10 : 6;
}
function IT_ladder_drop()
{
	// Drop down a ladder by holding down when jumping off
	return IT_FINAL;
}
function IT_final_key()
{
	// Key floating around player effect, no HUD
	return IT_FINAL;
}
function IT_heavywalkspeed()
{
	// Walking speed when holding a heavy object
	return IT_FINAL ? 2 : 4;
}
function IT_final_swing()
{
	// Swingding when grabbing enemy quickly
	return IT_FINAL;
}
function IT_april_swing()
{
	// Pressing shift while holding enemy puts you in swinging state
	return IT_APRIL;
}
function IT_early_swing()
{
	// TODO, Mash left and right repeatedly for swingding
	return IT_BNF;
}
function IT_swingding_throw()
{
	// Throw enemy by pressing grab on swingding state
	return IT_FINAL;
}
function IT_forced_poundjump()
{
	// Does it without holding jump
	return IT_APRIL;
}
function IT_slope_pound()
{
	// Ground pound on slope for mach slide state
	return IT_FINAL;
}
function IT_old_fireass_transfo()
{
	// Slower
	return !IT_FINAL;
}
function IT_old_speedlines()
{
	// Only played on mach 2
	return !IT_FINAL;
}
function IT_slope_ball_transfo()
{
	// Press down on a slope for ball transformation
	return !IT_FINAL;
}
function IT_climbwall_accel()
{
	// Acceleration speed for climbwall state
	return IT_FINAL ? 0.15 : 0.1;
}
function IT_climbwall_sprite()
{
	// Understand?
	return (character == "P" && !IT_FINAL) ? spr_player_climbwall_old
		: (vsp < -5 ? spr_machclimbwall : spr_player_clingwall);
}
function IT_action_knockback()
{
	// Instances of using railmovespeed to force move the player back
	// e.g. letting go when wallrunning
	return IT_FINAL;
}
function IT_freezing_idle()
{
	// Play freezing idle sprite in freezerator
	return IT_FINAL;
}
function IT_baddie_thrown_dead_sprite()
{
	// Morbidly uses dead sprite when enemy is about to die
	return IT_FINAL;
}
function IT_baddie_mach2kill()
{
	// Old way of killing enemies
	return !IT_FINAL;
}
function IT_baddie_mach3destroy()
{
	// Instantly kill enemy on mach 3 instead of launching it
	return IT_FINAL;
}
function IT_finishingblow_hit_frame()
{
	// Hits a little late in earlier builds
	return IT_FINAL ? 4 : 5;
}
function IT_hungrypillarflash()
{
	// Flash screen and play sound when killing John
	return IT_FINAL;
}
function IT_skip_titlecard()
{
	// Old builds didn't have them
	return !IT_FINAL;
}
function IT_camera_yoffset()
{
	// Much better now honestly
	return IT_FINAL ? -50 : 0;
}
function IT_toppin_taunt_effect()
{
	// Taunt effect behind toppins when collecting them
	return IT_FINAL;
}
function IT_ghost_collectibles()
{
	// Transparent collectibles in secrets
	return IT_FINAL;
}
function IT_grabbable_gerome()
{
	// Only with gerome lapping on
	return IT_FINAL;
}
function IT_john_escape_spawner()
{
	// Bleh
	return IT_FINAL;
}
function IT_collectible_magnet()
{
	// Collectibles magnet towards you
	return IT_FINAL;
}
function IT_smooth_rank_screen()
{
	// Peppino smoothly moves towards the center of the screen
	return IT_FINAL;
}
function IT_dead_john_hp()
{
	// Saw it in McPig's streams, they had health at some point
	return IT_FINAL ? 1 : 3;
}
function IT_old_chargecamera()
{
	// Just worked differently in early builds
	return !IT_FINAL;
}
function IT_baddie_squash()
{
	// That disgusting squash and stretch
	return IT_FINAL;
}
function IT_quick_piledriver()
{
	// Hold up when grabbing an enemy
	return IT_FINAL;
}
function IT_vsp_on_grab()
{
	// Player hops slightly on grabbing an enemy mid air
	if !grounded && IT_FINAL
		return -6;
	return undefined;
}
function IT_baddie_final_bump()
{
	// Knockback on mach 2 instead of stun on touch
	return IT_FINAL;
}
function IT_mach3effect_alpha()
{
	// Transparent if going slow
	return IT_FINAL;
}
function IT_crouchslide_super()
{
	// breakdancesuper sprite on crouchslide, for whatever reason
	return IT_APRIL;
}
function IT_music_pitch()
{
	// Music pitches up or down depending on the transformation
	return IT_APRIL;
}
function IT_autoparry()
{
	// Parry everything on mach 3 automatically
	return IT_APRIL;
}
function IT_april_enemy_throw()
{
	// Hold up or down to switch throw direction, clearly a shoulderbash leftover
	return IT_APRIL;
}
function IT_climbwall_transfer_speed()
{
	// Transfer wallspeed into movespeed
	return !IT_BNF;
}
function IT_grab_vsp()
{
	// Makes grabbing absolutely horrible
	if IT_BNF && !grounded
		return -4;
	return undefined;
}
function IT_grab_suplexmove_check()
{
	// Can't grab twice in a row
	return IT_BNF or (SUGARY_SPIRE && character == "SP");
}
function IT_Sjump_midair()
{
	// Ability to superjump in mid air
	return IT_BNF or (SUGARY_SPIRE && character == "SP");
}
function IT_Sjumpprep_deccel()
{
	// There used to be little to no decceleration
	return IT_BNF ? 0.25 : 1;
}
