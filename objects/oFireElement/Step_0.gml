
fall_spd = fall_spd + grav; //this makes the fall speed increase without stop, simulating gravity

if(hp <= 0){instance_destroy()}



if(place_meeting(x,y + fall_spd,oWall)){  //this is to make the object stop falling when in colission with 
	while(!place_meeting(x, y + sign(fall_spd), oWall)){ //teh ground, the double loop is needed because
		y = y + sign(fall_spd);            //if its not there the object will slow down just before   
	}                                      //landing on the ground, its weird but thats what it do
	fall_spd = 0;
}

y = y + fall_spd; //this appiles the gravity to the objects y cordinate (remember positive y goes downwards)

if(place_meeting(x + move_speed,y,oWall)){ //collisison with wall
	move_speed = 0;                        //sets speed to 0 if the x coordinate collides with wall
}

randomize();


if(state == enemy_state.idle){
	image_blend = c_white
	move_speed = 0;
	counter += 1;

	if(counter >= room_speed * 2){
		var change = choose(0,1);
		switch(change){
			case 0: state = enemy_state.wander;
			case 1: counter = 0; break;
		}
	}
	
	if(collision_circle(x,y,200,oPlayer,false,false)){
		state = enemy_state.alert; counter = 0;
	}
}

else if(state == enemy_state.wander){
	image_blend = c_green
	x += move_speed;
	counter += 1;
	if(counter >= room_speed * 4){
		move_speed = 0
		var change = choose(0,1);
		switch(change){
			case 0: state = enemy_state.idle; counter = 0; break;
			case 1:
			   spd = choose(-1.7,1.7);
			   move_speed = spd;
			   counter = 0; break;
		}
	}	
    
	if(collision_circle(x,y,200,oPlayer,false,false)){
		state = enemy_state.alert; counter = 0;
	}
}

else if(state == enemy_state.alert){
	image_blend = c_red
	counter +=1
	if(counter >= room_speed*1){
		var bul = pFlame
		Tri_midfast(bul)
		counter = 0
	}
	
	if(!collision_circle(x,y,200,oPlayer,false,false)){
		state = enemy_state.idle; counter = 0;
	}
}

