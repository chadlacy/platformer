/// @description Insert description here
// You can write your code in this editor

if (sprite_index == sPreJump) {
	sprite_index = sPostJump;
}

if (sprite_index == sPostJump) {
	instance_destroy();
}