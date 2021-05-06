// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Jump(){
	
	// I feel like the way I handled double jumping is janky and could be better. I feel like it should be
	// able to check if it came from falling state and give the player only one jump (if powerup acquired)
	// The problem is I feel like in order to do this you need to read two states ago instead of just one?
	
	if (prev_state != PLAYERSTATE.JUMP) {
		prev_state = PLAYERSTATE.JUMP;
	}
	
	var _move = key_right - key_left;
	hsp = (_move * walksp) * airspeed;
	vsp = vsp + grv;
	
	if (sprite_index != sPlayerJ && sprite_index != sPlayerDJ) {
		
		sprite_index = sPlayerJ;
		image_speed = 0.5;
		
		var _player_feet = y + sprite_height / 2;
		
		if (place_meeting(x,y+1,oWall) || place_meeting(x,_player_feet+6,oPlatform) || place_meeting(x,y+1,oStone)) { // Regular jump
			vsp = -jumpsp;
			jump_current -= 1;
			instance_create_layer(x,y,"Instances", oDustAnim);
		}
		else { // Double jump
			sprite_index = sPlayerDJ;
			vsp = -djumpsp; // Double jump
			jump_current -= 1;
			instance_create_layer(x,y,"Instances", oDustAnim);
		}
	}
	
	if (key_jump && jump_current > 0) {
		sprite_index = sPlayerDJ;
		vsp = -djumpsp; // Double jump
		jump_current -= 1;
		instance_create_layer(x,y,"Instances", oDustAnim);
	}
	
	if (vsp < 0 && !key_jump_held) vsp = max(vsp, 0);
	
	if (key_attack) state = PLAYERSTATE.ATTACK_SLASH;
	
	if (key_dash && has_dash == true && dash_cooldown <= 0) state = PLAYERSTATE.DASH;
	
	if (key_shoot) state = PLAYERSTATE.ATTACK_SPELL;
		
	if (vsp >= 0) {
		state = PLAYERSTATE.FALL;
	}
	
	if ((key_down) && has_gp == true) {
		state = PLAYERSTATE.GROUNDPOUND;
	}
	
	if (dash_cooldown > 0) {
		dash_cooldown -= 1;
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

	// Vertical collision
	if (place_meeting(x,y+vsp,oWall)) {
		while (!place_meeting(x,y+sign(vsp),oWall)) {
			y = y + sign(vsp);
		}
		vsp = 0;
	}
	
	// Vertical collision with stones
	if (place_meeting(x,y+vsp,oStone)) {
		while (!place_meeting(x,y+sign(vsp),oStone)) {
			y = y + sign(vsp);
		}
		vsp = 0;
	}

	y = y + vsp;
	
	// Animation
	if (hsp != 0) {
		image_xscale = sign(hsp);
	}
}