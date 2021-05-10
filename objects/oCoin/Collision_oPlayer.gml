/// @description Logic for what happens when player grabs coin

if (grabbable_timer <= 0) {
	if (sprite_index != sCoinGrab) {
		with (other) {
			gold += 1;
		}
	}

	sprite_index = sCoinGrab;
	image_speed = 0.5;
}