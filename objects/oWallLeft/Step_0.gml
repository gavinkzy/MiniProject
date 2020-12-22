switch StateManager.currentStage
{
	case stages.one:
		with (oPlayer)
		{
			if (playerPressedMove) && (place_meeting(x+1, y, other) || place_meeting(x-1, y, other))
			{
				StateManager.currentState = states.dead;
			}
		}
		break;
	case stages.two:
		if (leftWall.x != 35)
		{
			show_debug_message("Moving towards target");
			//check if player beside
			if (place_meeting(x+1,y,oPlayer))
			{
				oPlayer.x += 1;
			}
			x = x + 1;
			ScreenShake(1,2);
		}
		else
		{
			with (oPlayer)
			{
				if (playerPressedMove) && (place_meeting(x+1, y, other) || place_meeting(x-1, y, other))
				{
					StateManager.currentState = states.dead;
				}
			}
		}
		break;
	case stages.three:
		if (leftWall.x != 85)
		{
			show_debug_message("Moving towards target");
			//check if player beside
			if (place_meeting(x+1,y,oPlayer))
			{
				oPlayer.x += 1;
			}
			x = x + 1;
			ScreenShake(1,2);
		}
		else
		{
			with (oPlayer)
			{
				if (playerPressedMove) && (place_meeting(x+1, y, other) || place_meeting(x-1, y, other))
				{
					StateManager.currentState = states.dead;
				}
			}
		}
		break;
	case stages.four:
			if (leftWall.x != 105)
		{
			show_debug_message("Moving towards target");
			//check if player beside
			if (place_meeting(x+1,y,oPlayer))
			{
				oPlayer.x += 1;
			}
			x = x + 1;
			ScreenShake(1,2);
		}
		else
		{
			with (oPlayer)
			{
				if (playerPressedMove) && (place_meeting(x+1, y, other) || place_meeting(x-1, y, other))
				{
					StateManager.currentState = states.dead;
				}
			}
		}
}