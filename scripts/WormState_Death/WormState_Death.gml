// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function WormState_Death(){
	sprite_index = sWormD;
	if (animation_end()) {
		instance_destroy();
	}
}