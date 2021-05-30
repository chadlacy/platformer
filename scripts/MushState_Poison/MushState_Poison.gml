// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function MushState_Poison(){
	if (sprite_index != sMushPoison) {
		sprite_index = sMushPoison;
		poison_cooldown = poison_cooldown_max;
	}
	
	if (animation_end()) {
		mush_state = MUSHSTATE.MOVE;
	}
}