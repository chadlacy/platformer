/// @description Insert description here
// You can write your code in this editor
if (global.game_state == GAMESTATE.RUN) {
	with(all) {
		if (image_speed == 0) {
			image_speed = game_paused_image_speed;
		}
	}
}

if (global.game_state == GAMESTATE.READ) {
	with(all) {
		if (image_speed != 0) {
			game_paused_image_speed = image_speed;
			image_speed = 0;
		}
	}
}