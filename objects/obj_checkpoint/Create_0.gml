active = false;
image_speed = 0.35;

activatingspr = spr_checkpoint_activating;
activatedspr = spr_checkpoint_activated;

if MIDWAY
{
	sprite_index = spr_checkpoint_bo;
	activatingspr = spr_checkpoint_activating_bo;
	activatedspr = spr_checkpoint_activated_bo;
}
if SUGARY
{
	sprite_index = spr_checkpoint_ss;
	activatingspr = spr_checkpoint_activating_ss;
	activatedspr = spr_checkpoint_activated_ss;
}
