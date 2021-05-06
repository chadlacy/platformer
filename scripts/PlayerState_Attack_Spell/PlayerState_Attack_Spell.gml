// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Attack_Spell(){
	if (prev_state != PLAYERSTATE.ATTACK_SPELL) {
		prev_state = PLAYERSTATE.ATTACK_SPELL;
	}
	
	vsp = vsp + grv;
	
	if (image_xscale == 1) { // Make sure the spell travels in the direction the player is facing
		var inst = instance_create_layer(x+35,y, "Instances", oAttack);
		inst.direction = 0;
	} 
	else {
		var inst = instance_create_layer(x-35,y, "Instances", oAttack); // Shoot an attack spell
		inst.direction = 180;
		with (inst) {
			image_xscale = -1; // Mirror the sprite if shooting to the left
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
	
	//Vertical collision
	if (place_meeting(x,y+vsp,oWall)) {
		while (!place_meeting(x,y+sign(vsp),oWall)) {
			y = y + sign(vsp);
		}
		vsp = 0;
	}
	
	y = y + vsp;
	
	state = PLAYERSTATE.FREE;
}