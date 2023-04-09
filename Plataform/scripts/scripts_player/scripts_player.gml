// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_state_free(){
xspd = xDirection * spd;
yspd += player_gravity;
mask_index = spr_player_walkingr;

//If player is on the ground, he can move
if (onTheGround) {
	
	if (xDirection != 0 and xDirection > 0) { dir = 0; sprite_index = spr_player_walkingr}
	else if (xDirection != 0 and xDirection < 0) {dir = 1; sprite_index = spr_player_walkingl}
	else {
		if (dir == 0){
			sprite_index = spr_player_idle;
		}else if (dir == 1) {
			sprite_index = spr_player_idlel;
		}
	}


	if (jump) {
		yspd = -7;
	}
}else { //If he's not in the ground (jumping), does:
	state = PlayerState.JUMP;
}

//Collision with wall
if (place_meeting(x + xspd, y, obj_wall)) {
	xspd = 0;
}

x += xspd;

if (place_meeting(x, y + yspd, obj_wall)) {
	yspd = 0;
}


y += yspd;
}
	
function player_state_jumping(){
xspd = xDirection * spd;
yspd += player_gravity;
mask_index = spr_player_walkingr;	
if(!onTheGround){
		
	if (xDirection > 0) {dir = 0; sprite_index = spr_player_jumpr}
	else if (xDirection < 0) {dir = 1; sprite_index = spr_player_jumpl}
	else if (xDirection == 0 and dir == 0) {sprite_index = spr_player_jumpr}
	else if (xDirection == 0 and dir == 1) {sprite_index = spr_player_jumpl}
	
}else{
	state = PlayerState.FREE;
}
//Collision with wall
if (place_meeting(x + xspd, y, obj_wall)) {
	xspd = 0;
}

x += xspd;

if (place_meeting(x, y + yspd, obj_wall)) {
	yspd = 0;
}


y += yspd;
}

function player_state_hurt(){
if (dir == 0) {
	sprite_index = spr_player_hurtr;
	if(animation_end()){
		state = PlayerState.FREE;
	}
}else if (dir == 1) {
	sprite_index = spr_player_hurtl;
	if(animation_end()){
		state = PlayerState.FREE;
	}
}

}