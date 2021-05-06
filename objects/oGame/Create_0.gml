/// @description Insert description here
// You can write your code in this editor
window_set_fullscreen(true);
randomize();


enum GAMESTATE
{
	RUN,
	READ,
	PAUSE
}

text_queue = ds_list_create();

global.game_state = GAMESTATE.RUN;