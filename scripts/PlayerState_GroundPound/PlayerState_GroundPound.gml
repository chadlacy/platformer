// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_GroundPound(){
	if (prev_state != PLAYERSTATE.GROUNDPOUND){
		sprite_index = sPlayerDJ;
		prev_state = PLAYERSTATE.GROUNDPOUND;
	}
	
	hsp = 0;
	if (gp_stall < 10) { // Stall for ten frames, then fall down
		vsp = 0;
		gp_stall += 1;
	} 
	else if (vsp < max_vsp) {
		vsp += 1;
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
	
	// TODO: Figure out a way to clean up all this nasty redundant code
	
	//Vertical collision with stones
	if (place_meeting(x,y+vsp,oStone)) {
		while (!place_meeting(x,y+sign(vsp),oStone)) {
			y = y + sign(vsp);
		}
		vsp = 0;
		if (sprite_index != sPlayerCrouch) {
			sprite_index = sPlayerCrouch;
			instance_create_layer(x,y,"Instances", oShockwave);
			ScreenShake(15, 1, 0.2);
		}
		if (gp_endlag_counter > 0) {
			gp_endlag_counter -= 1;
			image_index = 1;
		}
		else {
			image_index = 0;
			gp_endlag_counter = gp_endlag;
			state = PLAYERSTATE.FREE;
		}
	}
	
	if (instance_exists(oPlatform)) {
		var _player_feet = y + sprite_height / 2;
		var _i = 0;
		var _nearest_platform = instance_nearest(x,y,oPlatform);
	
		//Vertical collision with platforms (can only collide from above platform)
		if (floor(_player_feet) <= floor(_nearest_platform.y)) {
			if (place_meeting(x,y+vsp,_nearest_platform) && !key_down_held) {
				while (!place_meeting(x,y+sign(vsp),_nearest_platform)) {
					if (_i = 10) { // Prevent game from freezing up in edge cases involving collisions with platform and wall simultaneously
						exit;
					}
					y = y + sign(vsp);
					_i += 1;
				}
				vsp = 0;
				if (sprite_index != sPlayerCrouch) {
					sprite_index = sPlayerCrouch;
					instance_create_layer(x,y,"Instances", oShockwave);
					ScreenShake(15, 1, 0.2);
				}
				if (gp_endlag_counter > 0) {
					gp_endlag_counter -= 1;
					image_index = 1;
				}
				else {
					image_index = 0;
					gp_endlag_counter = gp_endlag;
					state = PLAYERSTATE.FREE;
				}
			}
		}
	}
	
	//Vertical collision with walls
	if (place_meeting(x,y+vsp,oWall)) {
		while (!place_meeting(x,y+sign(vsp),oWall)) {
			y = y + sign(vsp);
		}
		vsp = 0;
		if (sprite_index != sPlayerCrouch) {
			sprite_index = sPlayerCrouch;
			instance_create_layer(x,y,"Instances", oShockwave);
			ScreenShake(15, 1, 0.2);
		}
		if (gp_endlag_counter > 0) {
			gp_endlag_counter -= 1;
			image_index = 1;
		}
		else {
			image_index = 0;
			gp_endlag_counter = gp_endlag;
			state = PLAYERSTATE.FREE;
		}
	}
	
	y = y + vsp;
}