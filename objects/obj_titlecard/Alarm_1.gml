/// @description noise heads
live_auto_call;

// skip titlecard on old gameplay
if IT_skip_titlecard()
{
	event_perform(ev_alarm, 0);
	with obj_fadeout
		fadealpha = 1;
	exit;
}

// noise heads
var char = obj_player1.character;
if is_holiday(holiday.loy_birthday)
	noisehead_sprite = spr_balloon;
else
{
	if char != "N" && char != "V"
		exit;
	if char == "V"
	{
		noisehead_sprite = spr_titlecard_vigi;
		noisehead_sound = "event:/modded/playerV/titlecard";
	}
}

var _add_spot = function(x, y, scale)
{
	if is_holiday(holiday.loy_birthday)
	{
		scale *= 4;
		y += 32;
	}
	var q = 
	{
		x: x,
		y: y,
		scale: scale,
		visual_scale: 1,
		visible: false,
		image_index: irandom(sprite_get_number(noisehead_sprite) - 1)
	}
	
	trace("Adding noise head at: ", q);
	array_push(noisehead, q);
	return q;
}

if is_array(afom_noisehead)
{
	for(var i = 0; i < array_length(afom_noisehead); i++)
	{
		var this = afom_noisehead[i];
		_add_spot(this.x, this.y, this.scale);
	}
}
else if object_index == obj_titlecard 
{
	if titlecard_sprite == spr_titlecardsecret
	{
		// secrets of the world
		_add_spot(480, 340, 0.93);
		_add_spot(234, 262, 0.93);
		_add_spot(146, 414, 0.8);
		_add_spot(900, 154, 0.7);
		_add_spot(786, 360, 0.4);
		_add_spot(28, 432, 0.28);
		_add_spot(397, 155, 0.28);
		_add_spot(656, 167, 1.25);
	}
	else if titlecard_sprite == spr_titlecards_new
	{
		switch titlecard_index
		{
			case 0: // dragonlair
				_add_spot(340, 311, 1.28);
				_add_spot(858, 163, 1.23);
				break;
			case 1: // strongcold
				_add_spot(695, 316, 1.5);
				break;
			case 2: // pinball
				_add_spot(576, 216, 1.6);
				_add_spot(325, 35, 1);
				break;
			case 3: // mansion
				_add_spot(471, 83, .86);
				_add_spot(135, 162, 1.2);
				_add_spot(156, 503, 1);
				_add_spot(597, 548, .8);
				break;
			case 4: // midway
				_add_spot(312, 390, 1.23);
				_add_spot(928, 365, .6);
				break;
			case 5: // grinch
				_add_spot(486, 398, 2);
				_add_spot(861, 349, 1.6);
				_add_spot(137, 175, 1.25);
				_add_spot(477, 97, 1.13);
				break;
			case 6: // sky
				_add_spot(575, 303, 1);
				break;
			case 7: // anton
				_add_spot(303, 274, .42);
				break;
			case 8: // snickchallenge
				_add_spot(664, 319, 1);
				_add_spot(812, 106, .61);
				_add_spot(751, 71, .25);
				break;
			case 9: // top
				_add_spot(476, 307, 1);
				break;
			case 10: // etb
				_add_spot(653, 261, .74);
				_add_spot(454, 438, .49);
				break;
		}
	}
	else if titlecard_sprite == spr_titlecards
	{
		switch titlecard_index
		{
			case 0: // john gutter
				_add_spot(677, 408, 0.55);
				_add_spot(735, 325, 0.68);
				_add_spot(602, 293, 0.65);
				break;
			case 1: // pizzascape
				_add_spot(643, 331, 1);
				break;
			case 2: // ancient cheese
				_add_spot(435, 383, 0.48);
				_add_spot(588, 175, 0.75);
				break;
			case 3: // bloodsauce dungeon
				_add_spot(446, 341, 0.75);
				_add_spot(671, 257, 0.4);
				_add_spot(295, 327, 0.35);
				break;
		
			case 4: // oregano desert
				_add_spot(627, 246, 1.38);
				_add_spot(370, 77, 0.74);
				_add_spot(438, 434, 0.48);
				_add_spot(386, 330, 0.42);
				break;
			case 5: // wasteyard
				_add_spot(638, 31, 0.42);
				_add_spot(641, 275, 0.93);
				_add_spot(465, 158, 0.5);
				_add_spot(664, 142, 0.5);
				_add_spot(600, 134, 0.4);
				break;
			case 6: // fun farm
				_add_spot(427, 272, 1.25);
				_add_spot(460, 93, 0.96);
				_add_spot(634, 390, 0.4);
				_add_spot(662, 379, 0.4);
				_add_spot(601, 442, 0.4);
				_add_spot(641, 260, 0.4);
				_add_spot(736, 58, 0.4);
				_add_spot(305, 13, 0.4);
				break;
			case 7: // saloon
				_add_spot(392, 249, 0.55);
				_add_spot(484, 253, 0.55);
				_add_spot(589, 264, 0.55);
				_add_spot(504, 275, 0.96);
				break;
		
			case 8: // plage
				_add_spot(444, 274, 1.1);
				_add_spot(222, 201, 0.41);
				break;
			case 9: // gnome forest
				_add_spot(360, 266, 0.77);
				_add_spot(599, 299, 0.77);
				_add_spot(490, 271, 0.8);
				_add_spot(696, 402, 0.48);
				break;
			case 10: // deep dish 9
				_add_spot(546, 151, 0.77);
				_add_spot(138, 85, 0.77);
				_add_spot(728, 58, 0.77);
				break;
			case 11: // golf
				_add_spot(232, 106, 0.91);
				break;
		
			case 12: // pig city
				_add_spot(191, 375, 1.5);
				_add_spot(531, 159, 0.91);
				_add_spot(758, 313, 0.91);
				_add_spot(700, 150, 0.3);
				break;
			case 13: // oh shit
				_add_spot(522, 246, 1);
				_add_spot(179, 78, 1);
				_add_spot(245, 193, 0.65);
				_add_spot(712, 81, 0.65);
				break;
			case 16: // peppibot factory
				_add_spot(360, 314, 1.3);
				_add_spot(734, 172, 0.4);
				_add_spot(958, 76, 0.7);
				break;
			case 17: // freezerator
				_add_spot(300, 321, 0.75);
				_add_spot(421, 404, 0.75);
				_add_spot(712, 176, 1.1);
				break;
		
			case 18: // pizzascare
				_add_spot(303, 257, 1.17);
				_add_spot(685, 223, 1.3);
				_add_spot(588, 81, 0.35);
				_add_spot(469, 45, 0.35);
				_add_spot(43, 434, 0.35);
				_add_spot(681, 41, 0.5);
				break;
			case 19: // dont make a sound
				_add_spot(753, 371, 1.25);
				_add_spot(421, 236, 1.25);
				_add_spot(623, 100, 0.8);
				_add_spot(229, 85, 0.4);
				_add_spot(145, 134, 0.4);
				_add_spot(601, 381, 0.4);
				_add_spot(367, 70, 0.4);
				_add_spot(848, 98, 0.4);
				_add_spot(79, 35, 0.2);
				_add_spot(162, 23, 0.2);
				_add_spot(139, 292, 0.2);
				break;
			case 14: // war
				_add_spot(428, 289, 4);
				_add_spot(846, 304, 0.8);
				break;
		
			case 15: // ctop
				noisespot_buffermax = 2;
				for (var i = 0; i < 64; i++)
					_add_spot(irandom(960), irandom(540), random_range(0.25, 1.25));
				break
		}
	}
	else
	{
		noisespot_buffermax = 3;
		for (var i = 0; i < 32; i++)
			_add_spot(irandom(960), irandom(540), random_range(0.5, 1.5));
	}
}
else if object_index == obj_titlecard_ss 
{
	switch info.titleinfo[0]
	{
		default: 
			noisespot_buffermax = 3;
			for (var i = 0; i < 32; i++)
				_add_spot(irandom(960), irandom(540), random_range(0.5, 1.5));
			break;
			
		case spr_entrycard_title:
			_add_spot(660, 350, 1.05);
			_add_spot(260, 350, 1.25);
			break;
		
		case spr_steamycard_title:
			_add_spot(284, 319, 1);
			_add_spot(458, 438, 0.7);
			break;
		
		case spr_molassescard_title:
			_add_spot(478, 357, 1.2);
			_add_spot(480, 96, 1.4);
			break;
		
		case spr_sucrosecard_title:
			_add_spot(288, 352, 1.4);
			_add_spot(426, 97, 1.2);
			break;
	}
}
alarm[2] = 40;
