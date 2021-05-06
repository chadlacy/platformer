/// @description Draw black bars
// You can write your code in this editor
draw_set_color(c_white);
//draw_text(0,oWorm.y, string(oWorm.y + (oWorm.sprite_height / 2)));
//draw_text(0,10, string(oWall.y));
//draw_text(oPlatform.x,oPlatform.y, string(oPlatform.y));
//draw_text(oSlime.x-45,oSlime.y - 100,"STATE: " + string(oSlime.slime_state));


if (mode != TRANS_MODE.OFF) {
	draw_set_color(c_black);
	draw_rectangle(0,0,w,percent*h_half,false);
	draw_rectangle(0,h,w,h-(percent*h_half),false);
}

