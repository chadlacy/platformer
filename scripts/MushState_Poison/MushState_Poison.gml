// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function MushState_Poison(){
	if (sprite_index != sMushPoison) {
		sprite_index = sMushPoison;
		image_index = 0;
		poison_cooldown = poison_cooldown_max;
	}
	
	instance_create_layer(x,y,"Instances",oPoison);
	
	if (animation_end()) {
		mush_state = MUSHSTATE.MOVE;
	}
}