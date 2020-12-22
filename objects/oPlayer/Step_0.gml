vsp = vsp + grv;

var isDead = (StateManager.currentState == states.dead);
var isPowerUp = (StateManager.currentState == states.powerup);

key_left = keyboard_check(vk_left)
key_right = keyboard_check(vk_right)

if (!isDead)
{
	if (key_left) || (key_right)
	{
		playerPressedMove = true;
	}
	else
	{
		playerPressedMove = false;
	}

	if (playerPressedMove)
	{
		var spddirection = key_right - key_left;
		hsp = spddirection * movespd;
	}
	else // Player does not input horizontal movement
	{
		if (hsp > 0)
		{
			hsp = max(0, hsp - _airresistance);
		}
		else
		{
			hsp = min(0, hsp + _airresistance);
		}
	}
}

//Vertical collision with platform
var nearestPlatform = instance_nearest(x,y,oPlatform);
if (place_meeting(x,y+1,oPlatform)) && (!isDead) && (!isPowerUp) && (y<nearestPlatform.y)
{
	StateManager.currentState = states.dead;
	deathBounceCount -= 1;
	vsp = bounceYVelo;
	hsp = bounceXVelo;
}

if (isDead)
{
	if (place_meeting(x,y+vsp,oPlatform)) && (deathBounceCount > 0)
	{
		while (!place_meeting(x, y+sign(vsp),oPlatform))
		{
			y = y + sign(vsp);
		}
		bounceXVelo -= 3;
		bounceYVelo += 0.2;
		vsp = min(-1, bounceYVelo);
		if (hsp>0)
		{
			hsp = bounceXVelo;
		}
		else
		{
			hsp = -bounceXVelo;	
		}
		deathBounceCount -= 1;
	}
	if (deathBounceCount <=0)
	{
		if (slowMoMultiplier == 1)
		{
			slowMoMultiplier = 0.10;	
		}
		slowMoMultiplier = min(0.9999, slowMoMultiplier+0.001);
	}
	show_debug_message(slowMoMultiplier);
}

//Horizontal collision with platform
if (place_meeting(x+hsp,y, oPlatform)) && (!isDead)
{
	while (!place_meeting(x+sign(hsp),y, oPlatform))
	{
		x = x + sign(hsp);	
	}
	hsp = 0;
}

//Horizontal collision with Left Wall
if (place_meeting(x+hsp,y, oWallLeft)) && (isDead)
{
	while (!place_meeting(x+sign(hsp),y, oWallLeft))
	{
		x = x + sign(hsp);	
	}
	hsp = (bounceXVelo) - 3;
}

//Horizontal collision with Right Wall
if (place_meeting(x+hsp,y, oWallRight)) && (isDead)
{
	while (!place_meeting(x+sign(hsp),y, oWallRight))
	{
		x = x + sign(hsp);	
	}
	hsp = (-bounceXVelo) + 3;
}


x = x + hsp * slowMoMultiplier;

if (hsp != 0) image_xscale = sign(hsp);

y = y + vsp * slowMoMultiplier;