if other.state == states.gotoplayer
	exit;

sound_play_3d("event:/sfx/misc/balloonpop", x, y);
create_particle(x, y, part.balloonpop, 0);
other.vsp = -14;
other.jumpstop = true;
visible = false;
x = -100;
y = -100;
respawn = 100;
if other.state == states.jump
	other.sprite_index = other.spr_machfreefall;
if other.state == states.climbwall
{
	other.sprite_index = other.spr_machfreefall;
	other.state = states.jump;
}
