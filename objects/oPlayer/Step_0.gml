key_left = keyboard_check(vk_left)
key_right = keyboard_check(vk_right)

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

////Horizontal Collision
//if (place_meeting(x+hsp,y,oWall))
//{
//	while(!place_meeting(x+sign(hsp), y, oWall))
//	{
//		x = x + sign(hsp);
//	}
//	hsp = 0;	
//}

x = x + hsp;

if (hsp != 0) image_xscale = sign(hsp);

//Calculate Score
distanceTravelled += ceil(1 * StateManager.spdMultiplier);

//restart if hp <0
if (hp <= 0)
{
	game_restart();	
}