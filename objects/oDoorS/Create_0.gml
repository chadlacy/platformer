/// @description Create state machine for oDoorS object

prev_state = DOORSTATE.CLOSED;
door_state = DOORSTATE.CLOSED;

enum DOORSTATE {
	OPEN,
	CLOSED
}