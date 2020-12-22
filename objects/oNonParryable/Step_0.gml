if (bbox_bottom < 0)
{
	instance_destroy(self);
}

vsp = StateManager.vspSet;
hsp = StateManager.hspSet;

x = x + hsp;
y = y + vsp;
image_angle += rotateAmount;