// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function MushState_Move(){
	
	if (sprite_index != sMushWalk) {
		sprite_index = sMushWalk;
	}
	
	if (x > oPlayer.x) {
		hsp = -0.65;
		image_xscale = -1; // Make sure they face the right way while moving
	}
	else if (x < oPlayer.x) {
		hsp = 0.65;
		image_xscale = 1;
	}
	
	// When mushroom comes nearby player, emit poison cloud
	if (poison_cooldown <= 0) {
		if (collision_circle(x, y, 48, oPlayer, false, true)) {
			mush_state = MUSHSTATE.POISON;
		}
	}
	
	//Horizontal collision
	if (place_meeting(x+hsp,y,oWall)) {
		while (!place_meeting(x+sign(hsp),y,oWall)) {
			x = x + sign(hsp);
		}
		hsp = 0;
	}

	x = x + hsp;

	vsp = vsp + grv;

	//Vertical collision
	if (place_meeting(x,y+vsp,oWall)) {
		while (!place_meeting(x,y+sign(vsp),oWall)) {
			y = y + sign(vsp);
		}
		vsp = 0;
	}

	y = y + vsp;
	
	if (poison_cooldown > 0) {
		poison_cooldown -= 1;
	}
}