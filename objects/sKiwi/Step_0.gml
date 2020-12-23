vsp = vsp + grv;

if (place_meeting(x,y+vsp,oStartingPlatformTop))
{
	while (!place_meeting(x,y+sign(vsp),oStartingPlatformTop))
	{
		y = y + sign(vsp);	
	}
	vsp = 0;
}

if (place_meeting(x,y+vsp,oStartingPlatformTopRight))
{
	while (!place_meeting(x,y+sign(vsp),oStartingPlatformTopRight))
	{
		y = y + sign(vsp);	
	}
	vsp = 0;
}


if (abs(oPlayer.x - x) < 32)
{
	playerCloseEnough = true;	
}

if (playerCloseEnough)
{
	sprite_index = sKiwiStand;
}

if (kiwiStartWalking)
{
	sprite_index = sKiwiWalk;
	hsp = 2;
	image_speed = min(1.5,image_speed+0.5);
}

x = x + hsp;
y = y + vsp;

if (y>inst_37BAE813.y) image_alpha = max(0, image_alpha - 0.01);
if (image_alpha == 0) instance_destroy(self);