if (bbox_bottom < 0)
{
	instance_destroy(self);
}

vsp = StateManager.vspSet + random_range(-1, 0);

//var nearestRightWall = instance_nearest(x,y,oWallRight);
//var nearestLeftWall = instance_nearest(x,y,oWallLeft);
//if (place_meeting(x+hsp,y,oWallLeft))
//{
//	hsp = -hsp;
//}

//if (place_meeting(x+hsp,y,oWallRight))
//{
//	hsp = -hsp;
//}

x = x + hsp;
y = y + vsp;

image_angle += rotateAmount;