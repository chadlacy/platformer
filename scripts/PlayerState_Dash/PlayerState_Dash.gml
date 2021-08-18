// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Dash(){
	
	if (prev_state != PLAYERSTATE.DASH) {
		hsp = 0;
		vsp = 0;
		dash_length_counter = dash_length;
		sprite_index = sPlayerFall;
		prev_state = PLAYERSTATE.DASH;
	}
	
	if (image_xscale == 1) { // Are they dashing right?
		var inst = instance_create_layer(x-1,y, "Instances", oDustAnim);
		with (inst) {
			image_angle = -90;
		}
		//hsp += 2.75;
		hsp = 8;
		dash_length_counter -= 1;
		if (0 <= dash_length_counter <= 5) { // Slow dash down in last few frames
			hsp -= 2;
		}
	} 
	else { // Or left?
		var inst = instance_create_layer(x+1,y, "Instances", oDustAnim);
		with (inst) {
			image_angle = 90;
		}
		//hsp -= 2.75;
		hsp = -8;
		dash_length_counter -= 1;
		if (0 <= dash_length_counter <= 5) {
			hsp += 2;
		}
	}
	
	// Code for allowing player to buffer attacks out of dash
	if (dash_length_counter <= 10) {
		if (dash_length_counter > 1 && key_attack) {
			buffer = true;
		}
		if (dash_length_counter <= 1 && buffer == true) {
			hsp = 0;
			dash_cooldown = 30;
			state = PLAYERSTATE.ATTACK_SLASH;
			buffer = false;
		}
	}
	
	if (dash_length_counter <= 0) {
		hsp = 0;
		vsp = 0;
		dash_cooldown = 30;
		
		if (place_meeting(x,y,oPlatform)) {
			state = PLAYERSTATE.FALL
		}
		else {
			state = PLAYERSTATE.FREE;
		}
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
		if (dash_length_counter <= 7) {
			dash_length_counter = dash_length;
		}
		else {
			dash_length_counter = 0;
		}
		
		state = PLAYERSTATE.FALL;
	}

	x = x + hsp;

}