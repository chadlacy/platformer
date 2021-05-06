// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Push(){
	
	if (prev_state != PLAYERSTATE.PUSH) {
		prev_state = PLAYERSTATE.PUSH;
		
		var _stone = instance_nearest(x,y,oStone);
		
		if (x < _stone.x) {
			image_xscale = 1;
		}
		
		if (x > _stone.x) {
			image_xscale = -1;
		}
		
		sprite_index = sPlayerPush;
	}
	
	// Calculate movement
	var _move = key_right - key_left;		

	hsp = _move * pushsp;
	
	//Horizontal collision
	if (place_meeting(x+hsp+16*sign(hsp),y,oWall)) {
		while (!place_meeting(x+sign(hsp)+16*sign(hsp),y,oWall)) {
			x = x + sign(hsp);
		}
		hsp = 0;
		oStone.hsp = 0;
	}		
	
	if (image_xscale == 1) {
		if (_move == 0) {
			state = PLAYERSTATE.FREE;
		}
		else {
			if (hsp < 0) {
				state = PLAYERSTATE.FREE;
			}
			else {
				oStone.x = oStone.x + hsp;
				x = x + hsp;
			}
		}
	}
	
	if (image_xscale == -1) {
		if (_move == 0) {
			state = PLAYERSTATE.FREE;
		}
		else {
			if (hsp > 0) {
				state = PLAYERSTATE.FREE;
			}
			else {
				oStone.x = oStone.x + hsp;
				x = x + hsp;
			}
		}
	}
	
	if (oStone.vsp > 0) {
		state = PLAYERSTATE.FREE;
	}
	
}