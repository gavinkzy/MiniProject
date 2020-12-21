timeSinceBegun += 0.01;
if (currentState != states.dead)
{
	vspSet = max(-2.5, vspSet - 0.001 * timeSinceBegun) * spdMultiplier;
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

if (oPlayer.hp <= 0)
{
	currentState = states.dead;
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
		spdMultiplier = 0.10;
		layer_vspeed("Backgrounds_1", vspSet - 0.05);
		break;
	case states.dead:
		spdMultiplier = 0;
		vspSet = 0;
		hspSet = 0;
		spawningActive = false;
		layer_vspeed("Backgrounds_1", 0);
		with (oPlayer)
		{
			sprite_index = sDead;
			grv = 0.09;
		}
}