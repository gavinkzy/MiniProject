if (currentState != states.preGame) && (currentState != states.dead) && (!oPlayer.playerTouchedHoneyJar)
{
	timeSinceBegun += 0.01;
	with (oPlayer)
	{
		if (y<60)
		{
			y = y + 1;	
		}
	}
}
if (currentState != states.dead) && (currentState != states.preGame) && (!oPlayer.playerTouchedHoneyJar)
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
//wall stuff
if (currentState != states.winningState)
{
	if (distanceMoved > 1000)
	{
		currentStage = stages.two;
		criticalStageChangeV = 1000;
		oSpawner.spawnDistInterval = 150;
	}

	if (distanceMoved > 2000)
	{
		currentStage = stages.three;
		criticalStageChangeV = 2000;
		oSpawner.spawnDistInterval = 100;
	}

	if (distanceMoved > 3000)
	{
		currentStage = stages.four;
		criticalStageChangeV = 3000;
		oSpawner.spawnDistInterval = 80;
	}
}

if (distanceMoved > 5000)
{
	currentState = states.winningState;
}

if (distanceMoved + 200 > criticalStageChangeV)
{
	closeToStageChange = true;
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
	case states.preGame:
		oPlayer.grv = preGameGravity;
		layer_vspeed("Backgrounds_1", -1);
		spawningActive = false;
		with (oPlayer)
		{
			if (bbox_left>(inst_189B19E6).x+sprite_get_width(sPlatform)/2)
			{
				grv = 0;
				vsp = 0;
				hsp = 0;
				other.currentState = states.normal;
				
			}
		}
		break;
	case states.normal:
		with (oPlayer)
		{
			if (!playerPressedParry) && (!parrySuccess) && (!gotHurt) sprite_index = sFalling;	
		}
		spdMultiplier = 1;
		layer_vspeed("Backgrounds_1", vspSet - 0.30);
		spawningActive = true;
		break;
	case states.powerup:
		with (oPlayer)
		{
			if (!playerPressedParry) && (!parrySuccess) && (!gotHurt) sprite_index = sFalling;	
		}
		spdMultiplier = 5;
		layer_vspeed("Backgrounds_1", vspSet - 0.30);
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
		layer_vspeed("Backgrounds_1", vspSet - 0.30);
		if (!triggered)
		{
			alarm[0] = 5 * room_speed;
			triggered = true;
		}
		break;
	case states.dead:
		vspSet = 0;
		hspSet = 0;
		spawningActive = false;
		layer_vspeed("Backgrounds_1", -0.30 * oPlayer.slowMoMultiplier);
		with (oPlayer)
		{
			oPlayer.hp = -1;
			sprite_index = sDead;
			grv = 0.09;
		}
		if (oPlayer.deathBounceCount <= 0) && (!triggeredDeath)
		{
			alarm[1] = 5 * room_speed;
			triggeredDeath = true;
		}
		break;
	case states.almostDead:
		show_debug_message("Almost dead");
	case states.winningState:
		spawningActive = false;
}