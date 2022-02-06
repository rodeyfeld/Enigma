package;

import AnimationMap;

class Fireball extends BulletType
{
	public function new()
	{
		var graphic = AssetPaths.fireball__png;
		var height = 16;
		var width = 16;
		var cooldown = 10;
		var timer = 10;
		var animations = [new AnimationMap("fire", [0, 1, 2, 3, 4], true, 6)];
		super(graphic, width, height, cooldown, timer, animations);
	}
}
