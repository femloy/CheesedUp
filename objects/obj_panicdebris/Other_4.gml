live_auto_call;

if global.performance
	exit;

draw = global.panic && global.laps >= 2;

debris = [];
if global.panic && draw && global.laps > 2
{
	var count = min(floor(global.laps / 4), 4) * (room_width / 960);
	trace(count);
	
	repeat count * 8
	{
		array_push(debris, {
			x : irandom(room_width),
			y : irandom(room_height),
			ang : irandom(360),
			img : irandom(10),
			vsp : 12,
			hsp : random_range(-4, 4),
		});
	}
}
