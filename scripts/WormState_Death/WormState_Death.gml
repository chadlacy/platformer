// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function WormState_Death(){
	sprite_index = sWormD
	instance_destroy(_detector); // Destroy detector
	if (animation_end()) {
		var _detector = instance_place(x,y,oDetector); // Get ID of detector attached to worm
		instance_destroy(); // Destroy worm
	}
}