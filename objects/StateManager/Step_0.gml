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
	if (distanceMoved > 1000) && (distanceMoved < 5000)
	{
		currentStage = stages.two;
		criticalStageChangeV = 4800;
		oSpawner.spawnDistInterval = 150;
	}

	if (distanceMoved > 5000) && (distanceMoved < 10000)
	{	
		audio_stop_sound(sndStage1n2);
		if (!playedMusic)
		{
			audio_play_sound(sndStage3n4,1,1);
			playedMusic = true;
		}
		currentStage = stages.three;
		criticalStageChangeV = 9800;
		oSpawner.spawnDistInterval = 100;
	}

	if (distanceMoved > 10000) && (distanceMoved < 15000)
	{
		currentStage = stages.four;
		criticalStageChangeV = 14800;
		oSpawner.spawnDistInterval = 80;
	}
}

if (distanceMoved > 15000)
{
	if (oPlayer.playerTouchedHoneyJar) && (!playedLastMusic)
	{
		audio_stop_sound(sndStage3n4);
		audio_play_sound(sndStage5,1,1);
		playedLastMusic = true;
	}
	currentState = states.winningState;
}

if (distanceMoved >= criticalStageChangeV)
{
	closeToStageChange = true;
}
else
{
	closeToStageChange = false;	
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
			//Game Start Condition
			if (bbox_left>(inst_37BAE813).x + 32)
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
		layer_hspeed("Backgrounds_1", -1);
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
			alarm[0] = 1 * room_speed;
			triggered = true;
		}
		break;
	case states.slowMotion:
		if (!savedSpd)
		{
			savedSpd = true;
			topSpeed = vspSet;
		}
		with (oPlayer)
		{
			if (!playerPressedParry) && (!parrySuccess) && (!gotHurt) sprite_index = sFalling;	
		}
		spdMultiplier = 0.90;
		layer_vspeed("Backgrounds_1", vspSet - 0.30);
		if (!triggered)
		{
			alarm[2] = 1 * room_speed;
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
		if (!triggeredDeath2)
		{
			alarm[3] = 8 * room_speed;
			triggeredDeath2 = true;
		}
		break;
	case states.almostDead:
		break;
	case states.winningState:
		spawningActive = false;
		break;
}