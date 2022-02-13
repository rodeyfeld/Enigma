package bullettypes;

import AnimationMap;

class LightningStrike extends BulletType
{
	public function new()
	{
		super({
			'graphic': AssetPaths.lightningstrike__png,
			'height': 16,
			'width': 16,
			'cooldown': 50,
			'timer': 10,
			'moveSpeed': 100,
			'animations': [
				new AnimationMap("fire", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 8, 7, 6, 5, 4, 3, 2, 1], true, 6)
			],
			'damage': 1,
			'lifeSpan': 100,
		});
	}
}
