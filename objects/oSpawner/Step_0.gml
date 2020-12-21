var xx = irandom_range(0+obstacleWidth/2, room_width-obstacleWidth/2);
var yy = y-30;

//spawning by distance
if (StateManager.distanceMoved >= lastCheckPoint + 200)
{
	hasSpawned = false;
	hasSpawnedPlatforms = false;
	lastCheckPoint = StateManager.distanceMoved;
}

if (StateManager.spawningActive)
{
	if (!hasSpawned)
	{
		instance_create_layer(xx,yy, "Obstacles", obstacles[irandom_range(0,array_length(obstacles)-1)])
		hasSpawned = true;
		show_debug_message("Spawned obstacle at" + string(xx) + string(yy));
	}

	if (!hasSpawnedPlatforms)
	{
		startingXPos = (inst_2879C075).x + 32;
		endingXPos = (inst_149E7C39).x;
		var numberOfTiles = ceil((endingXPos - startingXPos)/sprite_get_width(sBreakableTile));
		var posChosen = irandom_range(3, numberOfTiles-3);
		show_debug_message(string(posChosen));
		lastSpawnXPos = startingXPos;
		for (i = 0;  i < numberOfTiles; i++)
		{
			show_debug_message("Current i:" +string(i));
			if (i < posChosen + irandom_range(1,3)) && (i > posChosen - irandom_range(1,3))
			{
				instance_create_layer(lastSpawnXPos,y+20,"Platforms",oBreakableTile);
				show_debug_message("Spawned at " +string(lastSpawnXPos));
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