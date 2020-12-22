timeSinceBegun += 0.01;
if (currentState != states.dead)
{
	if (currentState != states.slowMotion)
	{
		vspSet = max(-2.5, vspSet - 0.001 * timeSinceBegun) * spdMultiplier;
	}
	else
	{
		vspSet = min(-1, vspSet * spdMultiplier);
	}
	distanceMoved -= vspSet * spdMultiplier;
}

if (currentState != states.dead)
{
	spawningActive = true;	
}

if (distanceMoved > 1000)
{
	currentStage = stages.two;
}

if (distanceMoved > 2000)
{
	currentStage = stages.three;
}

if (distanceMoved > 5000)
{
	currentStage = stages.four;
}

if (currentComboCount >= comboThreshold)
{
	currentComboCount = 0;
	currentState = states.powerup;
}

if (oPlayer.hp <= -1)
{
	currentState = states.dead;
}

if (oPlayer.hp == 0)
{
	currentState = states.almostDead;	
}

switch currentState
{
	default: currentState = states.normal;
	break;
	case states.normal:
		with (oPlayer)
		{
			if (!playerPressedParry) && (!parrySuccess) && (!gotHurt) sprite_index = sFalling;	
		}
		spdMultiplier = 1;
		layer_vspeed("Backgrounds_1", vspSet - 0.05);
		break;
	case states.powerup:
		with (oPlayer)
		{
			if (!playerPressedParry) && (!parrySuccess) && (!gotHurt) sprite_index = sFalling;	
		}
		spdMultiplier = 5;
		layer_vspeed("Backgrounds_1", vspSet - 0.05);
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
		spdMultiplier = 0.90;
		layer_vspeed("Backgrounds_1", vspSet - 0.05);
		if (!triggered)
		{
			alarm[0] = 5 * room_speed;
			triggered = true;
		}
		break;
	case states.dead:
		spdMultiplier = 0;
		vspSet = 0;
		hspSet = 0;
		spawningActive = false;
		layer_vspeed("Backgrounds_1", 0);
		with (oPlayer)
		{
			oPlayer.hp = -1;
			sprite_index = sDead;
			grv = 0.09;
		}
		break;
	case states.almostDead:
		show_debug_message("Almost dead");
}