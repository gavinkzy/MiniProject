if (bbox_bottom < 0)
{
	instance_destroy(self);
}

vspMultiplier = min(5, 0.01 * oPlayer.distanceTravelled);



x = x + (hsp + hsp * hspMultiplier * StateManager.spdMultiplier);
y = y + (vsp + vsp * vspMultiplier * StateManager.spdMultiplier);

with (StateManager)
{
	hspAmount = other.hsp + other.hsp * other.hspMultiplier * spdMultiplier;
	vspAmount = other.vsp + other.vsp * other.vspMultiplier * spdMultiplier;
}