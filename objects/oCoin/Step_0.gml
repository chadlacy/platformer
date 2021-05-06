/// @description Insert description here
// You can write your code in this editor

vsp = vsp + grv;

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
	if (bounce > 0) {
		vsp = vsp * -0.5;
		bounce -= 1;
	}
	else {
		vsp = 0;
		hsp = 0;
	}
}

y = y + vsp;


if (grabbable_timer > 0) {
	grabbable_timer -= 1
}

