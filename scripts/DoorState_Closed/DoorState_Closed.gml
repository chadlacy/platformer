// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DoorState_Closed(){
	if (prev_state != DOORSTATE.CLOSED) {
		if (sprite_index == sDoorO) {
			image_speed = -1;
			prev_state = DOORSTATE.CLOSED;
			audio_play_sound(DoorOpenClose, 10, false);
			//ScreenShake(56, 1, 0.2);
		}
		else {
			image_speed = -1;
			image_index = 13;
			sprite_index = sDoorO;
			prev_state = DOORSTATE.CLOSED;
			audio_play_sound(DoorOpenClose, 10, false);
			//ScreenShake(56, 1, 0.2);
		}
	}
	else {
		if (image_index <= 0) {
			image_speed = 1;
			sprite_index = sDoorC;
			//ScreenShake(0, 0, 0); // Stop any screenshake in progress
		}
	}
}