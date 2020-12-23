var xx = irandom_range(32+obstacleWidth/2, room_width-obstacleWidth/2-32);
var yy = y-30;

//spawning by distance

if (StateManager.currentState != states.powerup)
{
	if (StateManager.distanceMoved >= lastCheckPoint + spawnDistInterval)
	{
		hasSpawned = false;
		hasSpawnedPlatforms = false;
		lastCheckPoint = StateManager.distanceMoved;
	}
}
else
{
	if (StateManager.distanceMoved >= lastCheckPoint + 1500)
	{
		hasSpawned = false;
		hasSpawnedPlatforms = false;
		lastCheckPoint = StateManager.distanceMoved;
	}
}

if (StateManager.spawningActive)
{
	if (!hasSpawned)
	{
		instance_create_layer(xx,yy, "Obstacles", obstacles[irandom_range(0,array_length(obstacles)-1)])
		hasSpawned = true;
		show_debug_message("Spawned obstacle at" + string(xx) +" " + string(yy));
	}

	if (!hasSpawnedPlatforms)
	{
		startingXPos = (inst_2E704A28).x;
		endingXPos = (inst_7B657F13).x+32;
		numberOfTiles = ceil((endingXPos - startingXPos)/sprite_get_width(sBreakableTile));
		if (StateManager.closeToStageChange)
		{
			posChosen = round(numberOfTiles/2);
		}
		else
		{
			posChosen = irandom_range(6, numberOfTiles-6);
		}
		lastSpawnXPos = startingXPos;
		for (i = 0;  i < numberOfTiles; i++)
		{
			if (i < posChosen + irandom_range(1,3)) && (i > posChosen - irandom_range(1,5))
			{
				instance_create_layer(lastSpawnXPos,y+20,"Platforms",oBreakableTile);
				lastBreakableSpawnX = lastSpawnXPos;
			}
			else
			{
				instance_create_layer(lastSpawnXPos,y+20,"Platforms",oPlatform);
			}
			lastSpawnXPos = lastSpawnXPos + sprite_get_width(sPlatform);
			hasSpawnedPlatforms = true;
		}
	}
}

else if (StateManager.currentState == states.winningState)
{
	if(!honeyJarSpawned) 
	{
		instance_create_layer(lastBreakableSpawnX,y+100,"HoneyJar",oHoneyJar);
		honeyJarSpawned = true;
		show_debug_message("Honey Jar spawned");
	}
	else if(oPlayer.playerTouchedHoneyJar)
		{
			instance_create_layer(irandom_range(0,room_width), 0,"HoneyJar",oFallingHoneyJar);
			show_debug_message("Spawned Falling Honey Jar");
		}
}
