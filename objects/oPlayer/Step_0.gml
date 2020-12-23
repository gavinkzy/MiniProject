vsp = vsp + grv;

var isDead = (StateManager.currentState == states.dead);
var isPowerUp = (StateManager.currentState == states.powerup);
var isPreGame = (StateManager.currentState == states.preGame);

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
	oPlayer.hp = -1;
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
if (isDead)
{
	if (place_meeting(x+hsp,y, oWallLeftRight))
	{
		while (!place_meeting(x+sign(hsp),y, oWallLeftRight))
		{
			x = x + sign(hsp);	
		}
		hsp = (bounceXVelo) - 3;
		deadHasTouchedWall = true;
	}

	//Horizontal collision with Right Wall
	if (place_meeting(x+hsp,y, oWallRightLeft))
	{
		while (!place_meeting(x+sign(hsp),y, oWallRightLeft))
		{
			x = x + sign(hsp);	
		}
		hsp = (-bounceXVelo) + 3;
		deadHasTouchedWall = true;
	}
}

if (deadHasTouchedWall)
{
	image_angle += 3;
}

if (isPreGame)
{
	var nearestLeftWall = instance_nearest(x,y,oWallLeftRight);
	var nearestRightWall = instance_nearest(x,y,oWallRightLeft);
	if (place_meeting(x+hsp,y, oWallLeftRight))
	{
		while (!place_meeting(x+sign(hsp),y, oWallLeftRight))
		{
			x = x - 1;	
		}
		hsp = 0;
	}
	
	if (place_meeting(x+hsp,y, oWallLeftTopRight))
	{
		while (!place_meeting(x+sign(hsp),y, oWallLeftTopRight))
		{
			x = x - 1;	
		}
		hsp = 0;
	}

	if (place_meeting(x+hsp,y, oWallRightLeft))
	{
		while (!place_meeting(x+sign(hsp),y, oWallRightLeft))
		{
			x = x + 1;	
		}
		hsp = 0;
	}
	
	if (place_meeting(x,y+vsp, oStartingPlatform))
	{
		while (!place_meeting(x,y+sign(vsp), oStartingPlatform))
		{
			y = y +sign(vsp);	
		}
		vsp = 0;
		hasJumped = false;
	}
	else
	{
		hasJumped = true;
	}
	
	if (place_meeting(x+hsp,y, oStartingPlatform))
	{
		while (!place_meeting(x+sign(hsp),y, oStartingPlatform))
		{
			x = x +sign(hsp);	
		}
		hsp = 0;
	}
	
	if (keyboard_check_pressed(vk_space)) && (!hasJumped)
	{
		vsp = preGameJumpSpd;
	}
}


x = x + hsp * slowMoMultiplier;

if (hsp != 0) image_xscale = sign(hsp);

y = y + vsp * slowMoMultiplier;