if (oPlayer.distanceTravelled > 1000)
{
	currentStage = stages.two;
}

if (oPlayer.distanceTravelled > 2000)
{
	currentStage = stages.three;
}

if (currentComboCount >= comboThreshold)
{
	currentComboCount = 0;
	currentState = states.powerup;
}

switch currentState
{
	default:
	break;
	case states.normal:
		with (oPlayer)
		{
			if (!playerPressedParry) && (!parrySuccess) && (!gotHurt) sprite_index = sFalling;	
		}
		spdMultiplier = 1;
		layer_vspeed("Backgrounds_1", vspAmount - 0.05);
		break;
	case states.powerup:
		with (oPlayer)
		{
		if (!playerPressedParry) && (!parrySuccess) && (!gotHurt) sprite_index = sFalling;	
		}
		spdMultiplier = 2;
		layer_vspeed("Backgrounds_1", vspAmount - 0.05);
		ScreenShake(0.5, 1);
		if (!triggered)
		{
			alarm[0] = 5 * room_speed;
			triggered = true;
		}
		break;
	case states.slowMotion:
		with (oPlayer)
		{
			if (!playerPressedParry) && (!parrySuccess) && (!gotHurt) sprite_index = sFalling;	
		}
		spdMultiplier = 0.1;
		layer_vspeed("Backgrounds_1", vspAmount - 0.05);
		break;
}