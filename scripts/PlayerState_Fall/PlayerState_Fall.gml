 // This script contains the code of the "Fall" state of the player
// Fall state can possibly transition to these states:
// FREE
// JUMP
// ATTACK_SLASH
// HITSTUN
// DASH
// GROUNDPOUND
// DEATH
// TRANS
function PlayerState_Fall(){
	
	if (prev_state != PLAYERSTATE.FALL) {
		if (prev_state == PLAYERSTATE.FREE) {
			jump_current -= 1;	
		}
		prev_state = PLAYERSTATE.FALL;
		sprite_index = sPlayerFall;
	}
	
	var _move = key_right - key_left;
	hsp = (_move * walksp) * airspeed;
	vsp = vsp + grv;
	
	if (key_jump && jump_current > 0) {
		// I dislike that I'm modifying the number of jumps outside of the jump
		// state, but this is the only way I've gotten it to work
		jump_current -= 1; 
		state = PLAYERSTATE.JUMP;
	}
	
	if (key_attack) {
		state = PLAYERSTATE.ATTACK_SLASH;
	}
	
	if (key_dash && dash_cooldown <= 0 && has_dash == true) {
		state = PLAYERSTATE.DASH;
	}
	
	if ((key_down) && has_gp == true) {
		state = PLAYERSTATE.GROUNDPOUND;
	}
	
	if (dash_cooldown > 0) {
		dash_cooldown -= 1;
	}
	
	// Check for collision with enemies
	if (place_meeting(x,y,oEnemy)) {		
		enemy = instance_place(x,y,oEnemy);
		state = PLAYERSTATE.HITSTUN;	
	}
	
	// Check for collision with spikes
	if (place_meeting(x,y,oSpikes)) {
		player_health -= 35;
		if (player_health <= 0) {
			state = PLAYERSTATE.DEATH;
		}
		else {
			state = PLAYERSTATE.TRANS;
		}
	}
	
	//Horizontal collision
	if (place_meeting(x+hsp,y,oWall)) {
		while (!place_meeting(x+sign(hsp),y,oWall)) {
			x = x + sign(hsp);
		}
		hsp = 0;
	}
	
	//Horizontal collision with stones
	if (place_meeting(x+hsp,y,oStone)) {
		while (!place_meeting(x+sign(hsp),y,oStone)) {
			x = x + sign(hsp);
		}
		hsp = 0;
	}

	x = x + hsp;


	//Vertical collision
	if (place_meeting(x,y+vsp,oWall)) {
		while (!place_meeting(x,y+sign(vsp),oWall)) {
			y = y + sign(vsp);
		}
	    //jump_current = jump_number;
		vsp = 0;
		state = PLAYERSTATE.FREE;
	}
	
	//Vertical collision with stones
	if (place_meeting(x,y+vsp,oStone)) {
		while (!place_meeting(x,y+sign(vsp),oStone)) {
			y = y + sign(vsp);
		}
	    //jump_current = jump_number;
		vsp = 0;
		state = PLAYERSTATE.FREE;
	}
	
	if (instance_exists(oPlatform)) {
		var _player_feet = y + sprite_height / 2;
		var _i = 0;
		var _nearest_platform = instance_nearest(x,y,oPlatform);
	
		//Vertical collision with platforms (can only collide from above platform)
		if (floor(_player_feet) < floor(_nearest_platform.y) && !key_down_held) {
			if (place_meeting(x,y+vsp+1,_nearest_platform)) {
				while (!place_meeting(x,y+sign(vsp),_nearest_platform)) {
					if (_i = 10) { // Prevent game from freezing up in edge cases involving collisions with platform and wall simultaneously
						exit;
					}
					y = y + sign(vsp);
					_i += 1;
				}
				//jump_current = jump_number;
				vsp = 0;
				state = PLAYERSTATE.FREE;
			}
		}
	}

	y = y + vsp;
	
	if (hsp != 0) {
		image_xscale = sign(hsp);
	}
}