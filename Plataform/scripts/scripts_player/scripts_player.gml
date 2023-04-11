// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_state_free(){
previous_state = "free";
xspd = xDirection * spd;
yspd += player_gravity;
mask_index = spr_player_walking;

//If player is on the ground, he can move	
if(xspd != 0) {
	sprite_index = spr_player_walking;
	image_xscale = sign(xspd);
}else if (image_xscale > 0){
	sprite_index = spr_player_idle;
	image_xscale = 1;
}else{
	sprite_index = spr_player_idle;
	image_xscale = -1;
}

	if(attack_button){state = PlayerState.ATTACK;}

	if(run){state = PlayerState.RUNNING;}

	if(jump){
		yspd = jump_value; 
		state = PlayerState.JUMP;
	}else if (!onTheGround){
		state = PlayerState.JUMP;
	}
	

//Horizontal collision with wall
if (place_meeting(x + xspd, y, obj_wall)) {
	
	while(!place_meeting(x + sign(xspd), y, obj_wall)){
		x = x + sign(xspd)
	}
	xspd = 0;
}

x += xspd;
//Vertical collision with wall
if (place_meeting(x, y + yspd, obj_wall)) {
	
	while(!place_meeting(x, y + sign(yspd), obj_wall)){
		y = y + sign(yspd)
	}
	yspd = 0;
}

y += yspd;

}
	
	
function player_state_jumping(){
if(previous_state == "free"){
	xspd = xDirection * spd;
}else if(previous_state == "running"){
	xspd = xDirection * run_spd;
}
yspd += player_gravity;
mask_index = spr_player_walking;	

if(xspd != 0) {
	sprite_index = spr_player_jump;
	image_xscale = sign(xspd);
}


//Horizontal collision with wall
if (place_meeting(x + xspd, y, obj_wall)) {
	
	while(!place_meeting(x + sign(xspd), y, obj_wall)){
		x = x + sign(xspd)
	}
	xspd = 0;
}

x += xspd;
//Vertical collision with wall
if (place_meeting(x, y + yspd, obj_wall)) {
	
	while(!place_meeting(x, y + sign(yspd), obj_wall)){
		y = y + sign(yspd)
	}
	yspd = 0;
}
//Checking if he touches in ground
if(onTheGround){state = PlayerState.FREE;}

y += yspd;
}


function player_state_hurt(){
	
if (xspd != 0) {
	sprite_index = spr_player_hurt;
	image_xscale = sign(xspd);
	if(animation_end()){
		state = PlayerState.FREE;
	}
}

}
	
	
function player_state_attack(){
	
if (xspd != 0){
	sprite_index = spr_player_attack;
	image_xscale = sign(xspd);
}else if (image_xscale > 0){
	sprite_index = spr_player_attack;
	image_xscale = 1;
}else{
	sprite_index = spr_player_attack;
	image_xscale = -1;
}

if(animation_end()){
	state = PlayerState.FREE;
}

}


function player_state_running(){
previous_state = "running";
if(!run){
	state = PlayerState.FREE;
}

run_spd = 5;
xspd = xDirection * run_spd;
yspd += player_gravity;
mask_index = spr_player_walking;

//If player is on the ground, he can move	
if(xspd != 0) {
	sprite_index = spr_player_run;
	image_xscale = sign(xspd);
}else{
	state = PlayerState.FREE;
}

	if(jump){
		yspd = jump_value; 
		state = PlayerState.JUMP;
	}else if (!onTheGround){
		state = PlayerState.JUMP;
	}
	

//Horizontal collision with wall
if (place_meeting(x + xspd, y, obj_wall)) {
	
	while(!place_meeting(x + sign(xspd), y, obj_wall)){
		x = x + sign(xspd)
	}
	xspd = 0;
}

x += xspd;
//Vertical collision with wall
if (place_meeting(x, y + yspd, obj_wall)) {
	
	while(!place_meeting(x, y + sign(yspd), obj_wall)){
		y = y + sign(yspd)
	}
	yspd = 0;
}

y += yspd;

}
