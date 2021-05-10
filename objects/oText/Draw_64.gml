/// @description Draws text to GUI layer on screen

global.game_state = GAMESTATE.READ;

var key_advance = keyboard_check_pressed(vk_space);
var key_skip = keyboard_check(vk_enter);

//var font = font_add_sprite(sFont, ord("!"), true, 2);
//draw_set_font(font);

var _text_box_left_bound = 0;
var _text_box_right_bound = 235;
var _text_box_upper_bound = 0;
var _text_box_lower_bound = 50;

var _width = _text_box_right_bound - _text_box_left_bound;

NineSliceBox(sTextBox, _text_box_left_bound, _text_box_upper_bound, _text_box_right_bound, _text_box_lower_bound);

draw_scrolling_text(_text_box_left_bound + 15, _text_box_upper_bound + 10,oGame.text_queue,10,_width-20,0.3,10,key_advance,key_skip,false);

