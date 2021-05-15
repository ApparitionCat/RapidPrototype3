/// @description Insert description here
// You can write your code in this editor

if(hp <= 0){game_end()}

if(state == player_state.normal){
	#region normal
	
	spd = 5.5;
    grav = 0.45;
    jmp = -13.35;   //because negative y values goes up instead of down
    jmpMax = 0.11;  //a constant for highest possible jump
	
	counter += 1;
	object_set_visible(oPlayer, true);
		
		
if(!bkwd){		
right_key = keyboard_check(ord("D"));
left_key = keyboard_check(ord("A"));
jump = keyboard_check_direct(vk_space);}
jump_held = keyboard_check(vk_space);


if(right_key){Ndir = 1; image_xscale = -2;}
if(left_key){Ndir = -1; image_xscale = 2;}

if(keyboard_check(ord("N"))) and (counter >= firRate){
	var bul = instance_create_layer(x+1*dir,y,"Instances", pPlayerBullet)
	counter = 0;
	 if(image_xscale <= -1){
        bul.direction = 0;
} else bul.direction = 180;
if(keyboard_check(ord("W"))){bul.direction = 90}
}

var movement = right_key - left_key;
var sped = spd;
move_speed = movement * sped;  

fall_spd += (grav);  

if (jump) and (place_meeting(x,y+1,oWall)) and (!jumpd){ //this if condition controls how high the player can jump
	fall_spd = jmp; //changing this will increase (higher negative value) or decrease (positive value) the height of the jump
	jumpd = 1;
}

if(!jump)and (place_meeting(x,y+1,oWall)) {jumpd = 0};

if(fall_spd < 0) && (!jump_held){fall_spd = max(fall_spd,-3)}


#region knockback
//-------------------------------------------------------knockback

/*
if(bkwd){  //lanch player backwards or forwards
	dir = sign(x - monhit.x) //wont work, change these into colission events!
	move_speed = 6*dir
	counter += 1;
	if(counter >= room_speed*0.9){bkwd = 0 counter = 0}  //the counter here CANNOT be higher than the
}                                                        //the counter of nohurt
if(nohurt){ //invincibility
	counter += 1;
	if(counter >= room_speed*1.5){nohurt = 0; counter = 10;}
}
*/
//--------------------------------------------------------------------------
//this is the movement speed, the movement variable simply checks if only
//one of the left or right keys are being pressed down, if both are the player wont move
//the movement is then multiplied by the spd variable which is the speed of the player
//-------------------------------------------------------
#endregion

							
//the following are the code for collision on walls and platforms, first is sideways collision and 
//second lets the player walk on platforms/floors without sinking/falling trough them
if(place_meeting(x + move_speed,y,oWall)){
	while(!place_meeting(x + sign(move_speed), y, oWall)){
		x = x + sign(move_speed);
	}
	move_speed = 0;
}
x = x + move_speed; //this applies the movement speed to the player object
//--------------------------------------------------------------------------------
if(place_meeting(x,y + fall_spd,oWall)){
	while(!place_meeting(x, y + sign(fall_spd), oWall)){
		y = y + sign(fall_spd);
	}
	fall_spd = 0;
}
y = y + fall_spd; //this applies the falling speed to the player
//---------------------------------------------------------------------------------

visible = true; 

#endregion

}


var instance = instance_place(x,y,room_transition){
	if(instance != noone){
		room_goto(instance.target_room)
	}
}
