live_auto_call;

if keyboard_check_pressed(ord("R"))
{
	instance_destroy();
	instance_create(0, 0, obj_recordreplay);
	exit;
}
if keyboard_check_pressed(ord("Q"))
{
	instance_destroy();
	exit;
}

// player data, every 3 frames.
time -= 1;
if time <= 0
{
	time = 3;
	
	buffer_write(buffer, buffer_string, prev.r == room ? "" : room_get_name(room));
	prev.r = room;
	
	buffer_write(buffer, buffer_u16, obj_player1.state);
	buffer_write(buffer, buffer_bool, obj_player1.xscale < 0 ? 0 : 1);
	buffer_write(buffer, buffer_s32, obj_player1.x);
	buffer_write(buffer, buffer_s32, obj_player1.y);
}

// and then record input
scr_getinput();

// 0000 0000 HELD PRESSED
var move = 0x00000000;

move |= key_up;
move |= key_down << 1;
move |= -key_left << 2;
move |= key_right << 3;

move |= key_up2 << 4;
move |= key_down2 << 5;
move |= -key_left2 << 6;
move |= key_right2 << 7;

buffer_write(buffer, buffer_u8, move);

// JUMP SLAP TAUNT ATTACK
var but1 = 0x00000000;

but1 |= key_jump2;
but1 |= key_slap << 1;
but1 |= key_taunt << 2;
but1 |= key_attack << 3;

but1 |= key_jump << 4;
but1 |= key_slap2 << 5;
but1 |= key_taunt2 << 6;
but1 |= key_attack2 << 7;

buffer_write(buffer, buffer_u8, but1);

// CHAINSAW SHOOT SUPERJUMP GROUNDPOUND
var but2 = 0x00000000;

but2 |= key_chainsaw;
but2 |= key_shoot << 1;
but2 |= key_superjump << 2;
but2 |= key_groundpound2 << 3;

but2 |= key_chainsaw2 << 4;
but2 |= key_shoot2 << 5;
but2 |= 0 << 6;
but2 |= key_groundpound << 7;

buffer_write(buffer, buffer_u8, but2);

// axes for ghost
buffer_write(buffer, buffer_s8, round(-key_left_axis * 127 + key_right_axis * 127));
buffer_write(buffer, buffer_s8, round(-key_up_axis * 127 + key_down_axis * 127));
