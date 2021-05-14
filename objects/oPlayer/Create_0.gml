/// @description Insert description here
// You can write your code in this editor

image_speed = 0.5
image_xscale= 2;
image_yscale= 2;

instance_create_layer(x,y,"Instances", oPlayer_box);

//note: because of DELTA_TIME system, these constants might seem too big or too small but they work.

spd = 5.5;
grav = 0.09;
jmp = -1.87;   //because negative y values goes up instead of down
jmpMax = 0.11;  //a constant for highest possible jump
firRate = 700;
jumpd = 0;

move_speed = 0;
monhit = 0;
nohurt = 0;
bkwd = 0;
dir = 0;
Ndir = 1;
fall_spd = 0;
max_hp = 100;
hp = 100;
Z = 0;
counter = 0;


enum player_state{ 
	normal,
	hitstun,
	melee,
}

enum player_mode{
	regular
}

state = player_state.normal;
mode = player_mode.regular;