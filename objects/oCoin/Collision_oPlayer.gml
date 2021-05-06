/// @description Insert description here
// You can write your code in this editor

if (grabbable_timer <= 0) {
	if (sprite_index != sCoinGrab) {
		with (other) {
			gold += 1;
		}
	}

	sprite_index = sCoinGrab;
	image_speed = 0.5;
}