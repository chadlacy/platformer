/// @description Insert description here
// You can write your code in this editor
if (global.game_state = GAMESTATE.RUN) {
	switch (door_state) {
		case DOORSTATE.OPEN: DoorState_Open(); break;
		case DOORSTATE.CLOSED: DoorState_Closed(); break;
	}
}