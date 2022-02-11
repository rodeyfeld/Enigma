package bullettypes;

import AnimationMap;

class ToxicCircle extends BulletType
{
	public function new()
	{
		var graphic = AssetPaths.toxicCircle__png;
		var height = 16;
		var width = 16;
		var cooldown = 10000000;
		var timer = 1;
		var moveSpeed = 0;
		var animations = [
			new AnimationMap("fire", [0, 1, 2, 3, 4, 5, 6, 7, 6, 5, 4, 3, 2, 1], true, 12, true)
		];
		var damage = .1;
		var lifeSpan = -1;
		var persist = true;
		super(graphic, width, height, cooldown, timer, animations, moveSpeed, damage, lifeSpan, persist);
	}
}
