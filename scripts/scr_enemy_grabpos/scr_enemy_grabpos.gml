function scr_enemy_grabpos(_obj_player)
{
	var p = _obj_player;
	
	if scr_modding_hook_falser("enemy/grabbed/position", [p])
	{
		#region Swingding
	
		if (p.state == states.grab && p.sprite_index == p.spr_swingding)
		{
			var img = floor(wrap(p.image_index - 1, 0, 8));
			if (img == 0)
				x = p.x + (p.xscale * 25);
			if (img == 1)
				x = p.x;
			if (img == 2)
				x = p.x + (p.xscale * -25);
			if (img == 3)
				x = p.x + (p.xscale * -50);
			if (img == 4)
				x = p.x + (p.xscale * -25);
			if (img == 5)
				x = p.x;
			if (img == 6)
				x = p.x + (p.xscale * 25);
			if (img == 7)
				x = p.x + (p.xscale * 50);
		
			y = p.y;
			if SUGARY_SPIRE && p.character == "SP"
				y += 12;
		}
	
		#endregion
		#region Superslam
	
		else if (p.state == states.superslam || (p.state == states.chainsaw && p.sprite_index == p.spr_piledriver))
		{
			if p.character != "N"
			{
				if (p.sprite_index != p.spr_piledriverland)
				{
					if (floor(p.image_index) == 0)
					{
						depth = 0;
						x = p.x + (p.xscale * 10);
						y = p.y;
					}
					if (floor(p.image_index) == 1)
					{
						depth = 0;
						x = p.x + (p.xscale * 5);
						y = p.y;
					}
					if (floor(p.image_index) == 2)
					{
						depth = 0;
						x = p.x;
						y = p.y;
					}
					if (floor(p.image_index) == 3)
					{
						depth = 0;
						x = p.x + (p.xscale * -5);
						y = p.y;
					}
					if (floor(p.image_index) == 4)
					{
						depth = 0;
						x = p.x + (p.xscale * -10);
						y = p.y;
					}
					if (floor(p.image_index) == 5)
					{
						depth = -8;
						x = p.x + (p.xscale * -5);
						y = p.y;
					}
					if (floor(p.image_index) == 6)
					{
						depth = -8;
						x = p.x;
						y = p.y;
					}
					if (floor(p.image_index) == 7)
					{
						depth = -8;
						x = p.x + (p.xscale * 5);
						y = p.y;
					}
					check_grabbed_solid(_obj_player);
				}
				else
				{
					x = p.x + (p.xscale * 10);
					y = p.y;
					check_grabbed_solid(_obj_player);
				}
			}
			else if SUGARY_SPIRE && p.character == "SP"
			{
				var bottom = bbox_bottom - y;
				y = p.y - bottom;
				x = p.x;
		
				if p.sprite_index == spr_playerSP_piledriverstart
				{
					if floor(p.image_index) == 0
					{
						x -= image_xscale * 32;
						y += 12;
					}
					if floor(p.image_index) >= 1
						y -= 26;
				}
				else if p.sprite_index == p.spr_piledriverland
				{
					x -= image_xscale * 32;
					if floor(p.image_index) == 0
						y += 20;
					else
						y += 45;
				}
				else
				{
					x += image_xscale * 32;
					y -= 28;
				}
				y += 24;
			}
			else
			{
				// noise
				depth = -7;
				x = p.x;
				y = _obj_player.y - 54;
				if _obj_player.sprite_index == spr_playerN_piledriverland
				{
					x = _obj_player.x;
					y = _obj_player.y + 4;
				}
			}
		}
	
		#endregion
		#region Hauling
	
		else
		{
			var bottom = bbox_bottom - y;
			y = p.y - bottom;
		
			x = p.x;
			if (p.sprite_index != p.spr_haulingstart)
			{
				if SUGARY_SPIRE && p.character == "SP"
				{
					if p.sprite_index == p.spr_haulingwalk
					{
						if floor(p.image_index) == 0
						or floor(p.image_index) == 4
							y -= 3;
						if floor(p.image_index) == 1
						or floor(p.image_index) == 5
							y += 2;
						if floor(p.image_index) == 2
						or floor(p.image_index) == 6
							y += 7;
						if floor(p.image_index) == 3
						or floor(p.image_index) == 7
							y += 3;
					}
					else if p.sprite_index == p.spr_haulingjump
					{
						if floor(p.image_index) == 0
							y += 15;
						if floor(p.image_index) == 1
							y -= 12;
						if floor(p.image_index) == 2
							y -= 16;
						if floor(p.image_index) >= 3
							y -= 6;
					}
					else if p.sprite_index == p.spr_haulingland
					{
						if floor(p.image_index) == 0
							y += 15;
						if floor(p.image_index) == 1
							y += 8;
						if floor(p.image_index) == 2
							y -= 4;
					}
					else if p.sprite_index == p.spr_haulingfall
						y -= 8;
				
					y += 24;
					if sprite_index == spr_slimestun
						x -= image_xscale * 8;
				}
				else
					y = p.y - 40;
			}
			else
			{
				if SUGARY_SPIRE && p.character == "SP" && p.image_index < 6
				{
					if floor(p.image_index) == 0
						y += 48;
					else if floor(p.image_index) == 1
						y += 32;
					else if floor(p.image_index) == 2
						y += 16;
					else if floor(p.image_index) == 3
						y += 18;
					else if floor(p.image_index) == 4
						y += 24;
					else if floor(p.image_index) == 5
						y += 26;
				
					if sprite_index == spr_slimestun
						x -= image_xscale * 8;
				}
				else
					y = p.y - (floor(p.image_index) * 10);
			}
			image_xscale = -p.xscale;
		
			if object_index == obj_pizzagoblinbomb
			{
				x = p.x + -p.xscale * 6;
				y -= 15;
			}
			if object_index == obj_sucroseiceblock
				y -= 32;
		}
	
		#endregion
	}
	
	if p.flip < 0
		y = p.y - (y - p.y);
}
