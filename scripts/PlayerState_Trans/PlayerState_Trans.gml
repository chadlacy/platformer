// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Trans(){
	if (oTransition.mode == TRANS_MODE.INTRO) {
		sprite_index = sPlayer;
		image_speed = 0.35;
		if (transition_counter <= 0){
			hsp = 0; // I have no idea why this is necessary but without resetting these hsp and vsp somehow get carried over to when the player is actionable resulting in "phantom jumps"
			vsp = 0;
			state = PLAYERSTATE.FREE;
			transition_counter = transition_length;
		}
		else {
			transition_counter -= 1;
		}
	}
	
	if (oTransition.mode == TRANS_MODE.OFF) { // Collision with spikes, initiate respawn
		sprite_index = sPlayerH;
		oTransition.mode = TRANS_MODE.RESPAWN;
	}
}