Xmove = 0;
move_speed = 1;
grav = 1;
fall_spd = 0;
max_hp = 100;
hp = 100;
dir = 0;
counter = 0;
spd = 2;

enum enemy1_state{
	idle,
	wander,
	alert,
}

state = enemy1_state.idle;