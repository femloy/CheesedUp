SS_CODE_START;

depth = 4;
image_speed = 0.35;

enum GateState
{
	RAISED,
	LOWERED,
	RAISING,
	LOWERING
}
enum GateEvent
{
	NONE,
	LOWER,
	RAISE
}

logicMap = ds_map_create();

// Set the collision criteria so that this object is solid if the gate has been completely lowered
canCollide = function(callingObject = obj_player) {
	return (currentState == GateState.LOWERED);
}

if !reversed
{
	// State of the gate right now
	currentState = GateState.LOWERED;

	// State of the gate to be switched to after an alarm 0 call
	nextState = GateState.LOWERED;
	
	// An event to queue. Modified externally to influence gate behavior
	queuedEvent = GateEvent.NONE;
}
else 
{
	// State of the gate right now
	currentState = GateState.RAISED;
	
	// State of the gate to be switched to after an alarm 0 call
	nextState = GateState.RAISED;
	
	// An event to queue. Modified externally to influence gate behavior
	queuedEvent = GateEvent.NONE;
	
	sprite_index = spr_sucrosegateRaised;
}

// Rounds Image Angle to snap to only four directions.
image_angle = (round(image_angle / 90) * 90);

SS_CODE_END;
