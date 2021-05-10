/// @description Logic for collision detecting and falling

if (oPlayer.state == PLAYERSTATE.FREE) {
	hsp = 0;
}

vsp = vsp + grv;

if (place_meeting(x,y,oButton)) {
	y = oButton.bbox_top - 15;
	vsp = 0;
}

//Horizontal collision
if (place_meeting(x+hsp,y,oWall)) {
	while (!place_meeting(x+sign(hsp),y,oWall)) {
		x = x + sign(hsp);
	}
	hsp = 0;
}

//Vertical collision
if (place_meeting(x,y+vsp,oWall)) {
	while (!place_meeting(x,y+sign(vsp),oWall)) {
		y = y + sign(vsp);
		ScreenShake(10, 1, 0.2);
	}
	vsp = 0;
	
}

//Vertical collision with platforms
if (place_meeting(x,y+vsp,oPlatform)) {
	while (!place_meeting(x,y+sign(vsp),oPlatform)) {
		y = y + sign(vsp);
		ScreenShake(10, 1, 0.2);
	}
	vsp = 0;
	
}

y = y + vsp;