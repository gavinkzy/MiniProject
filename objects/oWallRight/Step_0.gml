switch StateManager.currentStage
{
	case stages.one:
		with (oPlayer)
		{
			if (playerPressedMove) && (place_meeting(x+1, y, other) || place_meeting(x-1, y, other))
			{
				hp = 0;
			}
		}
		break;
	case stages.two:
		if (rightWall.x != room_width - 35 - 32)
		{
			show_debug_message("Moving towards target");
			//check if player beside
			if (place_meeting(x-1,y,oPlayer))
			{
				oPlayer.x -= 1;
			}
			x = x - 1;
			ScreenShake(1,2);
		}
		else
		{
			with (oPlayer)
			{
				if (playerPressedMove) && (place_meeting(x+1, y, other) || place_meeting(x-1, y, other))
				{
					hp = 0;
				}
			}
		}
		break;
	case stages.three:
		if (rightWall.x != room_width - 35 - 50 - 32)
		{
			show_debug_message("Moving towards target");
			//check if player beside
			if (place_meeting(x-1,y,oPlayer))
			{
				oPlayer.x -= 1;
			}
			x = x - 1;
			ScreenShake(1,2);
		}
		else
		{
			with (oPlayer)
			{
				if (playerPressedMove) && (place_meeting(x+1, y, other) || place_meeting(x-1, y, other))
				{
					hp = 0;
				}
			}
		}
		break;
	case stages.four:
	if (rightWall.x != room_width - 35 - 50 - 32 - 20)
	{
		show_debug_message("Moving towards target");
		//check if player beside
		if (place_meeting(x-1,y,oPlayer))
		{
			oPlayer.x -= 1;
		}
		x = x - 1;
		ScreenShake(1,2);
	}
	else
	{
		with (oPlayer)
		{
			if (playerPressedMove) && (place_meeting(x+1, y, other) || place_meeting(x-1, y, other))
			{
				hp = 0;
			}
		}
	}
}