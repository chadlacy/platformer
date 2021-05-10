/// @description Game object to determine game state and other general settings
// Create event sets gamestate and other important variables

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