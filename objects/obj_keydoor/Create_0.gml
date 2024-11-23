image_speed = 0.35;
target_x = 0;
target_y = 0;
targetDoor = "A";
scr_create_uparrowhitbox();

spr_locked = spr_doorkey;
spr_open = spr_doorkeyopen;
spr_shake = spr_doorkey_shake;

if SUGARY_SPIRE
{
	sugary = SUGARY;
	if sugary
	{
		spr_locked = spr_keydoor_ss;
		spr_open = spr_doorvisited_ss;
		spr_shake = spr_keydoorshake_ss;
	}
}
sprite_index = spr_locked;
