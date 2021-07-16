// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function WormState_Death(){
	var _detector = instance_place(x,y,oDetector); // Get ID of detector attached to worm
	instance_destroy(_detector); // Destroy detector
	sprite_index = sWormD
	if (animation_end()) {
		instance_destroy(); // Destroy worm
	}
}