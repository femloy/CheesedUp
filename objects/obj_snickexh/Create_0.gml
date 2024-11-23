event_inherited();

maxspeed = 10
depth = obj_tv.depth + 1;

appeartimer = room_speed * 5;
gotoplayer = 0;
appear = 0;
popfrom = 0;
xcam = 960;
ycam = 540;
lockcam = false;
appeared = false;

call_later(1, time_source_units_seconds, function()
{
	create_transformation_tip("{s}Snuck is coming.../");
});
