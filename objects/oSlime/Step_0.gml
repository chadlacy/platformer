/// @description Logic to determine state of Slime object based on slime_state variable
if (slime_health <= 0) {
	slime_state = SLIMESTATE.DEATH;
}

if (global.game_state = GAMESTATE.RUN) {
	switch (slime_state) {
		case SLIMESTATE.IDLE: SlimeState_Idle(); break;
		case SLIMESTATE.MOVE: SlimeState_Move(); break;
		case SLIMESTATE.HITSTUN: SlimeState_Hitstun(); break;
		case SLIMESTATE.DEATH: SlimeState_Death(); break;
	}
}