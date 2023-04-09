/// @description Insert description here
xDirection =  keyboard_check(ord("D")) - keyboard_check(ord("A"));
jump = keyboard_check(ord("W"));
onTheGround = place_meeting(x, y + 1, obj_wall);
run = keyboard_check(vk_lshift);
hurt_sample = keyboard_check(ord("K"));

switch(state){
	case PlayerState.FREE: player_state_free(); break;
	case PlayerState.JUMP: player_state_jumping(); break;
	case PlayerState.HURT: player_state_hurt(); break;
}

if (life <= 0){
	state = PlayerState.DEAD;
}

if(hurt_sample){state = PlayerState.HURT};