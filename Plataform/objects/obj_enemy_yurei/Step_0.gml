/// @description Insert description here
onTheGround = place_meeting(x, y + 1, obj_wall);

switch(state){
	case EnemyState.FREE: enemy_state_free(); break;
	case EnemyState.CHASE: enemy_state_chase(); break;
	case EnemyState.ATTACK: enemy_state_attack(); break;
}



y += yspd;
