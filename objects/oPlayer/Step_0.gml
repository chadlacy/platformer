/// @description Core Player Logic

//Get player inputs
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_up = keyboard_check_pressed(ord("W"));
key_jump = keyboard_check_pressed(vk_space);
key_jump_held = keyboard_check(vk_space);
key_attack = keyboard_check_pressed(ord("J"));
key_shoot = keyboard_check(ord("H"));
key_dash = keyboard_check_pressed(vk_enter);
key_down = keyboard_check_pressed(ord("S"));
key_down_held = keyboard_check(ord("S"));


if (global.game_state == GAMESTATE.RUN) {
	switch (state) {
		case PLAYERSTATE.FREE: PlayerState_Free(); break;
		case PLAYERSTATE.JUMP: PlayerState_Jump(); break;
		case PLAYERSTATE.FALL: PlayerState_Fall(); break;
		case PLAYERSTATE.ATTACK_SLASH: PlayerState_Attack_Slash(); break;
		case PLAYERSTATE.ATTACK_SPELL: PlayerState_Attack_Spell(); break;
		case PLAYERSTATE.HITSTUN: PlayerState_Hitstun(); break;
		case PLAYERSTATE.DASH: PlayerState_Dash(); break;
		case PLAYERSTATE.PUSH: PlayerState_Push(); break;
		case PLAYERSTATE.GROUNDPOUND: PlayerState_GroundPound(); break;
		case PLAYERSTATE.TRANS: PlayerState_Trans(); break;
		case PLAYERSTATE.DEATH: PlayerState_Death(); break;
	}
}

