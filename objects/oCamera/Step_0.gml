/// @description Update camera

//Update destination
if (instance_exists(follow)) //if player exists
{
    xTo = follow.x; //set xTo to player x pos
    yTo = follow.y; //set yTo to player y pos
}

//Update object position
x += (xTo - x) / 9; //set oCamera object to 1/25 of difference between player xPos and oCamera xPos
y += (yTo - y) / 9; //set oCamera object to 1/25 of difference between player yPos and oCamera yPos
// effectively gives a slow panning effect as the camera pos is not set immediately to the player pos.
// The difference in distance also becomes smaller every frame, hence the motion is slowed as the camera pans nearer to player.
//sets camera to be clamped within the room
x = clamp(x, 0 + view_w_half, room_width - view_w_half); //min = left of room, max = right of room
y = clamp(y, view_h_half, room_height-view_h_half); //min = top of room, max = bottom of room

//Screen shake
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);
shake_remain = max(0, shake_remain-((1/shake_length)*shake_magnitude));

//Update camera view
camera_set_view_pos(cam,x-view_w_half, y-view_h_half);
//The top left of camera is the origin (0, 0).
//By subtracting by half of the width and height from the Camera pos, the camera is centered on the object followed.