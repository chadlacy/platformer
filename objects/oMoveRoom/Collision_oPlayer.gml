/// @description Insert description here
// You can write your code in this editor

// Set the global variables that determien player position in new room
global.targetx = targetx;
global.targety = targety;

with(oPlayer) {
	state = PLAYERSTATE.TRANS;
	SlideTransition(TRANS_MODE.GOTO, other.target);
	//state = PLAYERSTATE.FREE;
}