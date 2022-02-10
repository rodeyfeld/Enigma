package bullettypes;

import AnimationMap;

class ToxicCircle extends BulletType
{
	public function new()
	{
		var graphic = AssetPaths.toxicCircle__png;
		var height = 16;
		var width = 16;
		var cooldown = 50;
		var timer = 10;
		var move_speed = 0;
		var animations = [new AnimationMap("fire", [0, 1, 2, 3, 4, 5, 6, 7], true, 6)];
		var damage = 1;
		var lifeSpan = -1;
		super(graphic, width, height, cooldown, timer, animations, move_speed, damage, lifeSpan);
	}
}
