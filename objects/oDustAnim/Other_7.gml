/// @description Sets proper sprite index or destroys animation object at the end of each animation

if (sprite_index == sPreJump) {
	sprite_index = sPostJump;
}

if (sprite_index == sPostJump) {
	instance_destroy();
}