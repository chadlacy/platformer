// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SlimeState_Death(){
	sprite_index = sSlimeD;
	image_speed = 0.5;
	if (animation_end()) {
		instance_destroy();
	}
}