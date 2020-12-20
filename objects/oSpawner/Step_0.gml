var xx = irandom_range(0, room_width);
var yy = y;

if (!hasSpawned)
{
	instance_create_layer(xx,yy, "Obstacles", obstacles[irandom_range(0,array_length(obstacles)-1)])
	hasSpawned = true;
	alarm[0] = max(10, room_speed - (oPlayer.distanceTravelled * 0.05)) ;
	show_debug_message("Spawned obstacle at" + string(xx) + string(yy));
}

if (!hasSpawnedPlatforms)
{
	startingXPos = oWallLeft.leftWall.x + 32 - 1;
	endingXPos = oWallRight.rightWall.x;
	lastSpawnXPos = startingXPos;
	var numberOfTiles = ceil((endingXPos - startingXPos)/sprite_get_width(sBreakableTile));
	show_debug_message(numberOfTiles);
	for (i = 0;  i < numberOfTiles; i++)
	{
		instance_create_layer(lastSpawnXPos,y+30,"Platforms",oBreakableTile);
		lastSpawnXPos = lastSpawnXPos + sprite_get_width(sBreakableTile);
	}
	alarm[1] = max(150, room_speed - (oPlayer.distanceTravelled * 0.05)) ;
	hasSpawnedPlatforms = true;
}