function net_send_player_data()
{
	// variables that aren't updated very often
	static one_time = [
		{name: "yscale", value: 1},
		{struct: global, name: "palettetexture", value: noone},
		{name: "paletteselect", value: 1},
		{name: "spr_palette", value: spr_peppalette},
	];
	
	if instance_exists(obj_player1) && obj_player1.state != states.titlescreen
	{
		var s = 
		{
			paused: false,
			
			x: obj_player1.x,
			y: obj_player1.y,
			
			sprite: player_sprite(obj_player1),
			frame: obj_player1.image_index,
			xscale: obj_player1.xscale,
		
			state: obj_player1.state
		};
		for(var i = 0; i < array_length(one_time); ++i)
		{
			var this = one_time[i], struct = this[$ "struct"] ?? obj_player1, current = struct[$ this.name];
			if current != this.value
			{
				s[$ this.name] = current;
				one_time[i].value = current;
			}
		}
		net_send_udp("player_data", s);
	}
	else
	{
		net_send_udp("player_data",
		{
			paused: true
		});
	}
}
