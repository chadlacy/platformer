/// @description Logic for determining state of worm object based on value of worm_state variable

if (worm_health <= 0) {
	worm_state = SLIMESTATE.DEATH;
}

if (global.game_state = GAMESTATE.RUN) {
	switch (worm_state) {
		case WORMSTATE.IDLE: WormState_Idle(); break;
		case WORMSTATE.MOVE: WormState_Move(); break;
		case WORMSTATE.HITSTUN: WormState_Hitstun(); break;
		case WORMSTATE.DEATH: WormState_Death(); break;
	}
}