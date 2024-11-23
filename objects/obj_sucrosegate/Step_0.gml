SS_CODE_START;

// Process input
var _check = false;
with par_logicobjects
{
	if outputID == other.gateID && logicOutput
		_check = true;
}

if _check
{
	// Powered
	if !reversed
	{
		queuedEvent = GateEvent.RAISE;
		x = -1000;
		y = -1000;
	}
	else
	{
		queuedEvent = GateEvent.LOWER;
		x = xstart;
		y = ystart;
	}
}
else
{
	// Unpowered
	if !reversed
	{
		queuedEvent = GateEvent.LOWER;
		x = xstart;
		y = ystart;
	}
	else
	{
		queuedEvent = GateEvent.RAISE;
		x = -1000;
		y = -1000;
	}
}

// If an event is queued and we are ready for that event, begin the event
// If the event is irrelevant (i.e. raising a gate that is already open), discard the event
if ((currentState == GateState.LOWERED || currentState == GateState.RAISED) && queuedEvent != GateEvent.NONE)
{
	if (queuedEvent == GateEvent.RAISE && currentState != GateState.RAISED)
	{
		currentState = GateState.RAISING;
		nextState = GateState.RAISED;
		sprite_index = spr_sucrosegateRaising;
	}
	else if (queuedEvent == GateEvent.LOWER && currentState != GateState.LOWERED)
	{
		currentState = GateState.LOWERING;
		nextState = GateState.LOWERED;
		sprite_index = spr_sucrosegateLowering;
	}
	queuedEvent = GateEvent.NONE;
}

// Failsafe to ensure player doesn't get stuck on a gate that lowered on top of them
// If this happens - push a player out to the left/right side of the gate
// May behave oddly if space to the left/right of gate isn't clear
if (currentState == GateState.LOWERED)
{
	with obj_player
	{
		if state != states.debugstate
		{
			if place_meeting(x, y, other)
			{
				// Sideways Gates
				if other.image_angle mod 180 != 0
				{
					#region Snap to Up/Down
					
					var will_godown = distance_to_point(x, other.bbox_bottom) <= distance_to_point(x, other.bbox_top); // Check which edge is closer to the player
					var try_count = 0;
					while try_count < 2
					{
						// Calculate snap to left/right edge
						var _targetY1 = (other.bbox_bottom + (self.bbox_top - self.y) + 1);
						var _targetY2 = (other.bbox_top - (self.y - self.bbox_bottom) - 1);
			
						var _targetY = will_godown ? _targetY1 : _targetY2;
						if !scr_solid(x, _targetY)
						{
							// If there is no solid in that spot go ahead
							y = _targetY;
							break;
						}
						else 
						{
							// Otherwise try other side
							will_godown = !will_godown;
							try_count++;
						}
					}			
					
					#endregion
				}
				else
				{
					// Normal Gates
					#region Snap to Left/Right
					
					var will_goleft = distance_to_point(other.bbox_left, y) <= distance_to_point(other.bbox_right, y); // Check which edge is closer to the player
					var try_count = 0;
					while try_count < 2
					{
						// Calculate snap to left/right edge
						var _targetX1 = (other.bbox_left - (self.bbox_right - self.x) - 1);
						var _targetX2 = (other.bbox_right + (self.x - self.bbox_left) + 1);
			
						var _targetX = will_goleft ? _targetX1 : _targetX2;
						if !scr_solid(_targetX, y) 
						{
							// If there is no solid in that spot go ahead
							x = _targetX;
							break;
						}
						else
						{
							// Otherwise try other side
							will_goleft = !will_goleft;
							try_count++;
						}
					}
					
					#endregion
				}
			}
		}
	}
	with obj_baddie
	{
		if state != states.grabbed
		{
			if place_meeting(x, y, other)
			{
				if other.image_angle mod 180 != 0
				{
					// Sideways Gates
					#region Snap to Up/Down
					
					var will_godown = distance_to_point(x, other.bbox_bottom) <= distance_to_point(x, other.bbox_top); // Check which edge is closer to the enemy
					var try_count = 0;
					while try_count < 2
					{
						// Calculate snap to left/right edge
						var _targetY1 = (other.bbox_bottom - (self.bbox_top - self.y) - 1);
						var _targetY2 = (other.bbox_top + (self.y - self.bbox_bottom) + 1);
			
						var _targetY = will_godown ? _targetY1 : _targetY2;
						if !scr_solid(x, _targetY)
						{
							// If there is no solid in that spot go ahead
							y = _targetY;
							break;
						}
						else
						{
							// Otherwise try other side
							will_godown = !will_godown;
							try_count++;
						}
					}		
					
					#endregion
				}
				else
				{
					// Normal Gates
					#region Snap to Left/Right
					
					var will_goleft = distance_to_point(other.bbox_left, y) <= distance_to_point(other.bbox_right, y); // Check which edge is closer to the enemy
					var try_count = 0;
					while try_count < 2
					{
						// Calculate snap to left/right edge
						var _targetX1 = (other.bbox_left - (self.bbox_right - self.x) - 1);
						var _targetX2 = (other.bbox_right + (self.x - self.bbox_left) + 1);
			
						var _targetX = will_goleft ? _targetX1 : _targetX2;
						if !scr_solid(_targetX, y)
						{
							// If there is no solid in that spot go ahead
							x = _targetX;
							break;
						}
						else
						{
							// Otherwise try other side
							will_goleft = !will_goleft;
							try_count++;
						}
					}
					
					#endregion
				}
			}
		}
	}
}

SS_CODE_END;
