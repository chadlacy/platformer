/// @description Intializes variables for worm object, creates detector object for collision detection at corners/walls, creates state machine

worm_health = 15;
worm_hitstun = 0;
worm_hitstun_duration = 15;

// Create detector at origin of instance, used for detecting wall corner/edges
instance_create_layer(x,y+1,"Instances",oDetector);

if (worm_direction == 0) { // 0 is clockwise, 1 is counterclockwise
	hsp = 0.25;
}
else {
	hsp = -0.25;
}

vsp = 0;
last_hsp = 0; // Used to conserve hsp through state transitions
last_vsp = 0; // Used to conserve vsp through state transitions

sprite_index = sWormW;
image_speed = 0.5;
worm_state = WORMSTATE.MOVE;

enum WORMSTATE
{
	IDLE,
	MOVE,
	HITSTUN,
	DEATH
}