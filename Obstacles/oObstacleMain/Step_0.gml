x = x + hsp * hspMultiplier;
y = y + vsp * vspMultiplier;


if (y < 0)
{
	instance_destroy(self);
}