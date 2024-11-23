live_auto_call;

if buffer_tell(buffer) >= buffer_get_size(buffer) - 1
{
	show_message("Replay finished");
	instance_destroy();
	exit;
}

time -= 1;
if time <= 0
{
	time = 3;
	read_player();
}

// 0000 0000 HELD PRESSED
var move = buffer_read(buffer, buffer_u8);

key_up = check_bit(move, 0);
key_down = check_bit(move, 1);
key_left = -check_bit(move, 2);
key_right = check_bit(move, 3);

key_up2 = check_bit(move, 4);
key_down2 = check_bit(move, 5);
key_left2 = -check_bit(move, 6);
key_right2 = check_bit(move, 7);

trace(move);

// JUMP SLAP TAUNT ATTACK
var but1 = buffer_read(buffer, buffer_u8);

key_jump2 = check_bit(but1, 0);
key_slap = check_bit(but1, 1);
key_taunt = check_bit(but1, 2);
key_attack = check_bit(but1, 3);

key_jump = check_bit(but1, 4);
key_slap2 = check_bit(but1, 5);
key_taunt2 = check_bit(but1, 6);
key_attack2 = check_bit(but1, 7);

trace(but1);

// CHAINSAW SHOOT SUPERJUMP GROUNDPOUND
var but2 = buffer_read(buffer, buffer_u8);

key_chainsaw = check_bit(but2, 0);
key_shoot = check_bit(but2, 1);
key_superjump = check_bit(but2, 2);
key_groundpound2 = check_bit(but2, 3);

key_chainsaw2 = check_bit(but2, 4);
key_shoot2 = check_bit(but2, 5);
//0 = check_bit(but2, 6);
key_groundpound = check_bit(but2, 7);

trace(but2);

// axes for ghost
var hor_axes = buffer_read(buffer, buffer_s8) / 127;
var ver_axes = buffer_read(buffer, buffer_s8) / 127;

if hor_axes < 0 key_left_axis = abs(hor_axes);
if hor_axes >= 0 key_right_axis = abs(hor_axes);
if ver_axes < 0 key_up_axis = abs(ver_axes);
if ver_axes >= 0 key_down_axis = abs(ver_axes);
