/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_white);

draw_text(0,0, string("Health: " + string(oPlayer.player_health)));
draw_text(0,15, string("Gold: " + string(oPlayer.gold)));
draw_text(0,30, string("State: " + string(oPlayer.state)));
//draw_text(0,45, string("collision: " + string(instance_place(x+hsp,y,oWall))));
//draw_text(0,60, string("space held: " + string(oPlayer.key_jump_held)));
