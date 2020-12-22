if(!hasSpawned)
{
	instance_create_layer(x,y,"FakeObstacles", oFakeObstacle);
	hasSpawned = true;
	alarm[0] = 1 * room_speed;
}
