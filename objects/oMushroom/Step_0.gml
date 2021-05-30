/// @description Logic for determining current state of Mushroom enemy
if (mush_health <= 0) {
	mush_state = MUSHSTATE.DEATH;
}

if (global.game_state = GAMESTATE.RUN) {
	switch (mush_state) {
		case MUSHSTATE.MOVE: MushState_Move(); break;
		case MUSHSTATE.POISON: MushState_Poison(); break;
		case MUSHSTATE.HITSTUN: MushState_Hitstun(); break;
		case MUSHSTATE.DEATH: MushState_Death(); break;
	}
}
