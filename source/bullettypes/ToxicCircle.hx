package bullettypes;

import AnimationMap;

class ToxicCircle extends BulletType
{
	public function new()
	{
		super({
			'graphic': AssetPaths.toxicCircle__png,
			'height': 16,
			'width': 16,
			'cooldown': 10000000,
			'timer': 1,
			'moveSpeed': 0,
			'animations': [
				new AnimationMap("fire", [0, 1, 2, 3, 4, 5, 6, 7, 6, 5, 4, 3, 2, 1], true, 12, true)
			],
			'damage': .1,
			'lifeSpan': -1,
			'persist': true,
		});
	}
}
