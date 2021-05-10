/// @description Sends player to new room upon player collision with this object

// Set the global variables that determine player position in new room
global.targetx = targetx;
global.targety = targety;

with(oPlayer) {
	state = PLAYERSTATE.TRANS;
	SlideTransition(TRANS_MODE.GOTO, other.target);
}